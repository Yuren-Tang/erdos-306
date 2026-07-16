# E306-RV1 exact-tip local verification plan

Workstream: `E306-RV1-01`  
Target repository: `Yuren-Tang/erdos-306`  
Target commit: `e55ef359a8b98525f0bac6c7a510fcad94469bff`  
Exact review base: `d3a8dcfb9c0c9bf0e0ad25e1da81b7b12e83e628`  
Expected interval size: 40 commits  
Pinned toolchain: `leanprover/lean4:v4.31.0`  
Pinned Mathlib revision: `v4.31.0`

This is a future execution plan. The RV1 reviewer did **not** run these commands and does not claim local compilation. Execute them only in an authorized clean workspace after the Director disposes the review packet.

## 1. Verification policy

The verification must answer five separate questions rather than treating one green `lake build` as sufficient.

1. Is the workspace exactly the frozen source commit and the expected 40-commit ancestry?
2. Does a source-clean build elaborate the public theorem and audit entry point without project `.olean` reuse?
3. Does Lean print exactly the intended five-axiom boundary and no `sorryAx`?
4. Do every source module's declared imports elaborate without hidden dependencies, and do the builtin Lean linters finish rather than cancel?
5. Do workflow syntax, documentation paths, dependency graph, and migration residue match the frozen tree?

Record every command, exit code, and output file. A failure in an earlier phase is not repaired by a later green phase.

## 2. Required clean environment

Use a new clone, not the development checkout. Do not copy `lean/.lake`, `build`, `.olean`, `.ilean`, or editor caches from another workspace.

```bash
set -euo pipefail

export REPO_URL=https://github.com/Yuren-Tang/erdos-306.git
export TARGET_SHA=e55ef359a8b98525f0bac6c7a510fcad94469bff
export REVIEW_BASE=d3a8dcfb9c0c9bf0e0ad25e1da81b7b12e83e628
export OUT="$PWD/e306-rv1-local-$(date -u +%Y%m%dT%H%M%SZ)"
mkdir -p "$OUT"

work=$(mktemp -d "${TMPDIR:-/tmp}/e306-rv1.XXXXXX")
trap 'rm -rf "$work"' EXIT
cd "$work"
git clone --no-checkout "$REPO_URL" erdos-306
cd erdos-306
git fetch --no-tags origin "$TARGET_SHA"
git checkout --detach "$TARGET_SHA"
```

Capture basic environment data:

```bash
{
  date -u
  uname -a
  git --version
  curl --version | head -n 1
} | tee "$OUT/environment.txt"
```

If `elan` is absent, install it by the documented project route; otherwise record the existing version before it changes anything:

```bash
if command -v elan >/dev/null 2>&1; then
  elan --version | tee -a "$OUT/environment.txt"
else
  curl -fsSL https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
    -o /tmp/elan-init.sh
  sh /tmp/elan-init.sh -y --default-toolchain none
  . "$HOME/.elan/env"
  elan --version | tee -a "$OUT/environment.txt"
fi
```

**Stop condition:** inability to fetch the exact SHA, an unexpected repository remote, or a dirty initial worktree.

## 3. Identity, ancestry, and interval checks

Run before Lake or Lean:

```bash
git status --short
test -z "$(git status --porcelain)"

test "$(git rev-parse HEAD)" = "$TARGET_SHA"
test "$(git merge-base "$REVIEW_BASE" "$TARGET_SHA")" = "$REVIEW_BASE"
test "$(git rev-list --count "$REVIEW_BASE..$TARGET_SHA")" = 40
test "$(git rev-list --count "$TARGET_SHA..$REVIEW_BASE")" = 0

git show --no-patch --format=fuller HEAD | tee "$OUT/target-commit.txt"
git diff --stat "$REVIEW_BASE..$TARGET_SHA" | tee "$OUT/interval-stat.txt"
git diff --name-status "$REVIEW_BASE..$TARGET_SHA" | tee "$OUT/interval-files.txt"
git log --reverse --format='%H%x09%s' "$REVIEW_BASE..$TARGET_SHA" \
  | tee "$OUT/interval-commits.tsv"
test "$(wc -l < "$OUT/interval-commits.tsv" | tr -d ' ')" = 40
```

Also verify the immutable release object without checking it out:

```bash
git fetch --no-tags origin tag v0.0.3
test "$(git rev-list -n 1 v0.0.3)" = 4582185de1e0e27416e9362e0cc7943c3d2fb4fe
```

**Stop condition:** any ancestry/count mismatch. Do not “repair” it by rebasing, merging, or substituting a newer head.

## 4. Pin and manifest audit

From the repository root:

```bash
cat lean/lean-toolchain | tee "$OUT/lean-toolchain.txt"
grep -nE '^(name|git|rev) = ' lean/lakefile.toml \
  | tee "$OUT/lakefile-pins.txt"
sha256sum lean/lean-toolchain lean/lakefile.toml lean/lake-manifest.json \
  | tee "$OUT/pin-sha256.txt"

test "$(cat lean/lean-toolchain)" = 'leanprover/lean4:v4.31.0'
grep -Fq 'rev = "v4.31.0"' lean/lakefile.toml
```

After entering `lean/`, record resolved versions:

```bash
cd lean
lake --version | tee "$OUT/lake-version.txt"
lean --version | tee "$OUT/lean-version.txt"
lake env lean --version | tee "$OUT/lake-env-lean-version.txt"
```

Do **not** run `lake update`; the checked-in manifest is part of the reviewed source state.

**Stop condition:** pin mismatch, manifest mutation, or a command that rewrites the lockfile.

## 5. Eliminate stale project artifacts

The Mathlib cache may be downloaded, but no project `.olean` may survive from a prior checkout.

```bash
rm -rf .lake/build
find RequestProject -type f \( -name '*.olean' -o -name '*.ilean' -o -name '*.trace' \) -delete

test ! -e .lake/build
if find RequestProject -type f \( -name '*.olean' -o -name '*.ilean' \) | grep -q .; then
  echo 'unexpected source-tree Lean artifact' >&2
  exit 1
fi

lake exe cache get 2>&1 | tee "$OUT/cache-get.log"
```

After cache retrieval, verify that no **project** build artifact has appeared before the build:

```bash
if find .lake/build -path '*/RequestProject/*' -type f 2>/dev/null | grep -q .; then
  echo 'RequestProject artifact existed before source build' >&2
  exit 1
fi
```

**Stop condition:** project artifacts exist before the build or cache retrieval modifies tracked files.

## 6. Clean public theorem and audit builds

Build the public target first, then the audit target explicitly. Use `--keep-going` only in a separate diagnostic retry; the release gate uses ordinary fail-fast builds.

```bash
/usr/bin/time -p lake build RequestProject.Public.Erdos306 \
  2>&1 | tee "$OUT/build-public.log"
public_status=${PIPESTATUS[0]}
test "$public_status" = 0

/usr/bin/time -p lake build RequestProject.Audit \
  2>&1 | tee "$OUT/build-audit-target.log"
audit_build_status=${PIPESTATUS[0]}
test "$audit_build_status" = 0
```

Then run the audit source directly:

```bash
lake env lean RequestProject/Audit.lean \
  2>&1 | tee "$OUT/audit.log"
audit_status=${PIPESTATUS[0]}
test "$audit_status" = 0
```

Confirm the tracked source tree remains unchanged:

```bash
git -C .. status --short | tee "$OUT/post-build-git-status.txt"
test -z "$(git -C .. status --porcelain)"
```

**Stop condition:** any elaboration failure, any tracked mutation, or any build that succeeds only after restoring a previous project `.lake/build`.

## 7. Exact axiom audit

Reproduce, then strengthen, the CI parser. First retain the raw Lean output from the previous phase. Extract the dependency block:

```bash
axlist=$(sed -n '/depends on axioms: \[/,/\]/p' "$OUT/audit.log")
test -n "$axlist"
printf '%s\n' "$axlist" | tee "$OUT/axiom-block.txt"

names=$(printf '%s\n' "$axlist" \
  | sed 's/.*depends on axioms: \[//' \
  | tr ',[]' '\n' \
  | sed 's/^[[:space:]]*//; s/[[:space:]]*$//' \
  | grep -E '.')
printf '%s\n' "$names" | sort -u | tee "$OUT/axiom-names.txt"
```

Require absence of `sorryAx`, presence of both structural inputs, and no other name:

```bash
! grep -qx 'sorryAx' "$OUT/axiom-names.txt"
for ax in \
  GlobalControl.pnt_dyadic_prime_density \
  GlobalControl.mertens_dyadic_window_mass
do
  grep -qx "$ax" "$OUT/axiom-names.txt"
done

unexpected=$(grep -vxE \
  'propext|Classical\.choice|Quot\.sound|GlobalControl\.pnt_dyadic_prime_density|GlobalControl\.mertens_dyadic_window_mass' \
  "$OUT/axiom-names.txt" || true)
test -z "$unexpected"
```

Require the exact set, not merely a subset. This catches an expected axiom silently dropping out as well as an unexpected one entering:

```bash
cat > "$OUT/expected-axioms.txt" <<'EOF'
Classical.choice
GlobalControl.mertens_dyadic_window_mass
GlobalControl.pnt_dyadic_prime_density
Quot.sound
propext
EOF
sort -u "$OUT/expected-axioms.txt" -o "$OUT/expected-axioms.txt"
diff -u "$OUT/expected-axioms.txt" "$OUT/axiom-names.txt" \
  | tee "$OUT/axiom-set.diff"
```

Verify that the printed declarations themselves are present in `audit.log`:

```bash
grep -F 'GlobalControl.pnt_dyadic_prime_density' "$OUT/audit.log"
grep -F 'GlobalControl.mertens_dyadic_window_mass' "$OUT/audit.log"
grep -F 'Erdos306.erdos_306' "$OUT/audit.log"
```

**Stop condition:** `sorryAx`, any sixth axiom, either structural axiom absent, the exact set differs, or the audit parser finds no block.

## 8. Public import-closure checks

### 8.1 Static source graph

Run the repository graph script from both public and audit roots:

```bash
DEP_GRAPH_OUT="$OUT/public-dep-graph.json" \
  python3 scripts/dep_graph.py RequestProject.Public.Erdos306 \
  | tee "$OUT/public-dep-graph.txt"

DEP_GRAPH_OUT="$OUT/audit-dep-graph.json" \
  python3 scripts/dep_graph.py RequestProject.Audit \
  | tee "$OUT/audit-dep-graph.txt"
```

Check that every statically referenced `RequestProject.*` module has a source file:

```bash
python3 - "$OUT/public-dep-graph.json" <<'PY'
import json, pathlib, sys
p = pathlib.Path(sys.argv[1])
data = json.loads(p.read_text())
missing = []
for src, deps in data['imports'].items():
    for dep in deps:
        path = pathlib.Path(dep.replace('.', '/') + '.lean')
        if not path.exists():
            missing.append((src, dep, str(path)))
if missing:
    for row in missing:
        print('\t'.join(row))
    raise SystemExit(1)
PY
```

### 8.2 Source import audit over every module

Run the unsharded authoritative local command:

```bash
scripts/audit_imports.sh 2>&1 | tee "$OUT/import-audit-all.log"
import_status=${PIPESTATUS[0]}
test "$import_status" = 0
```

Also reproduce CI's four-way partition to detect shard-specific shell or ordering behavior:

```bash
for shard in 0 1 2 3; do
  scripts/audit_imports.sh --shard "$shard" 4 \
    2>&1 | tee "$OUT/import-audit-shard-$shard.log"
  test "${PIPESTATUS[0]}" = 0
done
```

Search all logs for fatal and informational import findings separately:

```bash
! grep -Eiq 'missing imports|error:' "$OUT"/import-audit-*.log

grep -Ei 'Found the following transitively redundant imports|unneeded import' \
  "$OUT"/import-audit-*.log \
  > "$OUT/redundant-imports.txt" || true
```

Transitive redundancy is not itself a failure under the current project policy, but the resulting list must be reviewed at the public and major confluence modules.

**Stop condition:** any source module fails to elaborate from its declared imports, any missing module path, or a public/audit import reaches a file intended to be dead.

## 9. Builtin Lean linter completion

The latest remote workflow did not complete these shards. Run the exact CI selection locally and require every shard to finish normally.

```bash
mapfile -t modules < <(
  find RequestProject -name '*.lean' -type f -print |
    sort |
    sed -e 's/\.lean$//' -e 's|/|.|g'
)
printf '%s\n' "${modules[@]}" > "$OUT/all-modules.txt"
test "${#modules[@]}" -gt 0

for shard in 1 2 3 4; do
  selected=()
  shard_index=$((shard - 1))
  for i in "${!modules[@]}"; do
    if (( i % 4 == shard_index )); then
      selected+=("${modules[$i]}")
    fi
  done
  printf '%s\n' "${selected[@]}" > "$OUT/lint-shard-$shard-modules.txt"
  lake lint --builtin-only "${selected[@]}" \
    2>&1 | tee "$OUT/lint-shard-$shard.log"
  lint_status=${PIPESTATUS[0]}
  test "$lint_status" = 0
done
```

As a cross-check, run one unsharded invocation if command-line length permits:

```bash
lake lint --builtin-only "${modules[@]}" \
  2>&1 | tee "$OUT/lint-all.log"
test "${PIPESTATUS[0]}" = 0
```

If the unsharded command exceeds the platform's argument limit, record that fact and retain the four successful shard logs; do not treat an argument-length failure as a source linter failure.

**Stop condition:** any shard exits nonzero, is killed/cancelled, omits its final modules, or produces a linter error requiring a source edit. Such an edit needs a separately authorized revision slice.

## 10. Workflow lint and workflow semantics

Install or use a pinned `actionlint`; record its version. A recommended reproducible route is to download a named release in a disposable directory rather than use an unversioned system binary. If the repository or Director specifies a version, that version controls.

```bash
if command -v actionlint >/dev/null 2>&1; then
  actionlint -version | tee "$OUT/actionlint-version.txt"
  actionlint .github/workflows/*.yml \
    2>&1 | tee "$OUT/actionlint.log"
  test "${PIPESTATUS[0]}" = 0
else
  echo 'actionlint not installed: install a pinned release before this phase' \
    | tee "$OUT/actionlint-not-installed.txt"
  exit 1
fi
```

Validate the intended workflow facts directly from YAML:

```bash
grep -nF 'build-args: "RequestProject.Audit"' ../.github/workflows/ci.yml
grep -nF 'GlobalControl.pnt_dyadic_prime_density' ../.github/workflows/ci.yml
grep -nF 'GlobalControl.mertens_dyadic_window_mass' ../.github/workflows/ci.yml
grep -nF 'scripts/audit_imports.sh --shard' ../.github/workflows/ci.yml
grep -nF 'raven-actions/actionlint@v2' ../.github/workflows/ci.yml
```

Review rather than silently assume these behavioral points:

- push trigger is restricted to `main`;
- pull-request runs test GitHub's synthetic merge ref by default;
- `workflow-lint` has no `needs: build` or `needs: verify` dependency;
- lint and import jobs restore the build artifact generated in the same run;
- the exact-head release check must therefore be supplemented by this local detached-SHA plan.

**Stop condition:** actionlint failure, unexpected workflow target, or allowlist drift.

## 11. Historical route, shim, and dead-code audit

Run exact path/name searches from the repository root. These commands are reconnaissance; interpret each match rather than deleting automatically.

```bash
cd ..

rg -n --hidden --glob '!lean/.lake/**' \
  'RequestProject\.(Erdos306FormalConjectures|Erdos306Final|GlobalControl$|DyadicPrimes|R2[A-Za-z0-9_]*|RSPrimeSums|SBEE)' \
  . | tee "$OUT/historical-import-name-matches.txt" || true

rg -n --hidden --glob '!lean/.lake/**' \
  'import RequestProject\.(Erdos306FormalConjectures|Erdos306Final|GlobalControl|DyadicPrimes|R2|RSPrimeSums|SBEE)' \
  lean/RequestProject .github docs README.md \
  | tee "$OUT/historical-import-matches.txt" || true

rg -n --hidden --glob '!lean/.lake/**' \
  'rosser_schoenfeld|RosserSchoenfeld|RSPrimeSums' \
  lean/RequestProject README.md docs .github \
  | tee "$OUT/rosser-schoenfeld-residue.txt" || true

rg -n --hidden --glob '!lean/.lake/**' \
  'RequestProject\.AnalyticInputs|RequestProject/AnalyticInputs\.lean|GlobalControl \(public aggregate|-> GlobalControl' \
  README.md docs lean/RequestProject \
  | tee "$OUT/stale-documentation-paths.txt" || true
```

Classify each surviving match as one of:

- active import and blocker;
- compatibility theorem alias with explicit expiry;
- internal historical theorem name;
- historical documentation only;
- source citation prose;
- stale documentation defect.

Use graph orphans as candidates, not proof of deadness. For each orphan file, search its declarations before proposing deletion:

```bash
python3 - "$OUT/public-dep-graph.json" <<'PY' > "$OUT/public-orphan-modules.txt"
import json, sys
for m in json.load(open(sys.argv[1]))['orphans']:
    print(m)
PY

while IFS= read -r module; do
  path="lean/${module//.//}.lean"
  printf '\n### %s\n' "$module"
  if [[ -f "$path" ]]; then
    rg -n '^(def|theorem|lemma|structure|class|abbrev|instance|axiom) ' "$path" || true
  fi
done < "$OUT/public-orphan-modules.txt" \
  | tee "$OUT/public-orphan-declarations.txt"
```

**Stop condition:** a deleted historical import remains active, the public path reaches an unauthorized compatibility route, or a supposedly dead declaration has a live external consumer.

## 12. Documentation-source consistency checks

At minimum, verify these source paths exist:

```bash
for path in \
  lean/RequestProject/Statement/Erdos306.lean \
  lean/RequestProject/Erdos306.lean \
  lean/RequestProject/Public/Erdos306.lean \
  lean/RequestProject/GlobalControl/AnalyticInputs.lean \
  lean/RequestProject/Audit.lean
 do
  test -f "$path"
done
```

Then detect links to missing Lean paths in Markdown:

```bash
python3 - <<'PY' | tee "$OUT/missing-markdown-lean-links.txt"
import pathlib, re
root = pathlib.Path('.')
missing = []
for md in [root/'README.md', *root.glob('docs/**/*.md')]:
    text = md.read_text(encoding='utf-8', errors='replace')
    for target in re.findall(r'\(([^)]+\.lean)(?:#[^)]+)?\)', text):
        if '://' in target:
            continue
        p = (md.parent / target).resolve()
        if not p.exists():
            missing.append((str(md), target))
for a, b in missing:
    print(f'{a}\t{b}')
raise SystemExit(1 if missing else 0)
PY
```

Manually reconcile prose with YAML and source for:

- the actual analytic-input module path;
- push versus pull-request workflow triggers;
- whether linter/actionlint jobs are sequenced after verification;
- absence of the deleted `GlobalControl.lean` aggregate;
- inclusive Mertens index range `Icc k0 (3*k0)` and its actual prime window;
- distinction between immutable v0.0.3's released boundary and the frozen development boundary.

**Stop condition:** public README points to missing files, describes a different CI policy, or describes the structural axioms as verbatim source statements.

## 13. Optional independent theorem-type comparison

To supplement visual comparison between the exact base and frozen tip, create two disposable checkouts and print the old and new theorem types with their respective pinned environments. This is optional because it requires building both historical states, but it gives an independent artifact.

At the frozen tip:

```bash
cd lean
cat > /tmp/e306-tip-type.lean <<'EOF'
import RequestProject.Public.Erdos306
#print Erdos306.erdos_306
EOF
lake env lean /tmp/e306-tip-type.lean | tee "$OUT/tip-theorem-type.txt"
```

At the exact base in a second clean checkout, build and print `RequestProject.Erdos306FormalConjectures.erdos_306`, retaining its own checked-in toolchain/manifest. Normalize only source-location prefixes, then compare the proposition bodies. Do not copy `.olean` files between the two checkouts.

**Stop condition:** any logical binder, hypothesis, witness condition, or sum expression differs. Cosmetic pretty-printer differences alone require interpretation, not automatic rejection.

## 14. Re-run after clean build deletion

A single source-clean build is strong evidence; a second clean rebuild catches accidental reliance on manually generated untracked source or incomplete dependency declarations.

```bash
cd lean
rm -rf .lake/build
lake exe cache get 2>&1 | tee "$OUT/cache-get-second.log"
lake build RequestProject.Audit 2>&1 | tee "$OUT/build-audit-second.log"
test "${PIPESTATUS[0]}" = 0
lake env lean RequestProject/Audit.lean 2>&1 | tee "$OUT/audit-second.log"
test "${PIPESTATUS[0]}" = 0
cmp "$OUT/axiom-block.txt" \
  <(sed -n '/depends on axioms: \[/,/\]/p' "$OUT/audit-second.log")
```

Run at least the public/audit-target import audits again after deletion:

```bash
scripts/audit_imports.sh \
  RequestProject/Public/Erdos306.lean \
  RequestProject/Erdos306.lean \
  RequestProject/Audit.lean \
  2>&1 | tee "$OUT/import-audit-public-second.log"
test "${PIPESTATUS[0]}" = 0
```

**Stop condition:** the second clean build or audit differs from the first in logical dependencies.

## 15. Evidence packet and checksums

The completed local verification packet should contain at least:

```text
environment.txt
target-commit.txt
interval-commits.tsv
interval-files.txt
lean-toolchain.txt
lakefile-pins.txt
pin-sha256.txt
cache-get.log
build-public.log
build-audit-target.log
audit.log
axiom-block.txt
axiom-names.txt
expected-axioms.txt
public-dep-graph.json
audit-dep-graph.json
import-audit-all.log
import-audit-shard-{0,1,2,3}.log
lint-shard-{1,2,3,4}.log
actionlint-version.txt
actionlint.log
historical-import-name-matches.txt
rosser-schoenfeld-residue.txt
stale-documentation-paths.txt
missing-markdown-lean-links.txt
post-build-git-status.txt
build-audit-second.log
audit-second.log
```

Create a machine-readable outcome summary and checksums:

```bash
cat > "$OUT/RESULT.md" <<'EOF'
# E306 RV1 local verification result

- Target SHA: e55ef359a8b98525f0bac6c7a510fcad94469bff
- Exact interval: d3a8dcfb9c0c9bf0e0ad25e1da81b7b12e83e628..e55ef359a8b98525f0bac6c7a510fcad94469bff
- Interval count: 40
- Clean public build: [PASS/FAIL]
- Clean audit build: [PASS/FAIL]
- Exact five-axiom set: [PASS/FAIL]
- Full import audit: [PASS/FAIL]
- Four linter shards completed: [PASS/FAIL]
- actionlint: [PASS/FAIL]
- Documentation/source consistency: [PASS/FAIL]
- Historical-route audit: [PASS/FAIL]
- Second clean rebuild: [PASS/FAIL]
- Overall disposition evidence: [GREEN/RED]
EOF

(
  cd "$OUT"
  find . -type f ! -name SHA256SUMS -print0 | sort -z | xargs -0 sha256sum
) > "$OUT/SHA256SUMS"
```

Replace every placeholder in `RESULT.md`; do not call the packet green while any required item remains blank or failed.

## 16. Required outcome before acceptance

Immediate acceptance becomes technically supportable only if all of the following hold:

1. exact SHA and 40-commit ancestry verified;
2. clean public and audit builds succeed twice;
3. exact axiom set is the three standard Lean axioms plus the two structural inputs, with no `sorryAx`;
4. full and four-shard source import audits succeed;
5. all four builtin linter shards complete successfully;
6. `actionlint` succeeds;
7. no public import relies on deleted historical routes or hidden compatibility aggregates;
8. public documentation paths and CI descriptions are corrected;
9. the Director separately approves the mathematical trust-boundary bridge or accepts the two structural statements as the explicit publication assumptions.

A green technical packet cannot by itself approve item 9. Conversely, mathematical approval of the structural axioms cannot waive a red build, linter, import, or documentation result.
