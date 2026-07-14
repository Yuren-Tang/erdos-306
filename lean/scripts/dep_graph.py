#!/usr/bin/env python3
"""Static RequestProject import-graph reconnaissance.

Unlike scripts/audit_imports.sh (which needs each module to actually build),
this reads `import RequestProject.*` lines as plain text, so it stays useful
even while large parts of the tree are red mid-refactor. It answers:

  - which modules are unreachable from a given root (dead-code candidates —
    verify with `rg` for the declaration names before deleting, per
    docs/architecture.md's deletion policy);
  - which modules are import hubs / aggregators (likely load-bearing or
    likely tangled, worth a closer read);
  - rough size/sorry/axiom counts per module.

Usage: run from lean/, i.e. `python3 scripts/dep_graph.py [root_module]`.
Default root is RequestProject.Public.Erdos306, the stable public entry file.
"""
import re
import os
import sys
import json
import collections

ROOT_DIR = "RequestProject"
DEFAULT_ROOT = "RequestProject.Public.Erdos306"


def module_name(path: str) -> str:
    rel = os.path.relpath(path, ".")
    rel = rel[: -len(".lean")]
    return rel.replace(os.sep, ".")


def scan():
    files = []
    for dirpath, _dirnames, filenames in os.walk(ROOT_DIR):
        for fn in filenames:
            if fn.endswith(".lean"):
                files.append(os.path.join(dirpath, fn))

    imports, sorry_count, axiom_count, line_count = {}, {}, {}, {}
    for f in files:
        mod = module_name(f)
        text = open(f, encoding="utf-8", errors="replace").read()
        imports[mod] = re.findall(r"^import (RequestProject\S*)", text, re.MULTILINE)
        sorry_count[mod] = len(re.findall(r"\bsorry\b", text))
        axiom_count[mod] = len(re.findall(r"^axiom ", text, re.MULTILINE))
        line_count[mod] = text.count("\n")
    return imports, sorry_count, axiom_count, line_count


def reachable_from(imports, root):
    seen, stack = set(), [root]
    while stack:
        m = stack.pop()
        if m in seen:
            continue
        seen.add(m)
        stack.extend(imports.get(m, []))
    return seen


def main():
    root = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_ROOT
    imports, sorry_count, axiom_count, line_count = scan()

    importers = collections.defaultdict(list)
    for mod, deps in imports.items():
        for d in deps:
            importers[d].append(mod)

    all_mods = set(imports.keys())
    final = reachable_from(imports, root)
    orphans = all_mods - final

    print(f"Total modules: {len(all_mods)}  Total lines: {sum(line_count.values())}")
    print(f"Reachable from {root}: {len(final)}")
    print(f"NOT reachable ({len(orphans)} modules, "
          f"{sum(line_count[m] for m in orphans)} lines) — verify with rg before deleting:")
    for m in sorted(orphans):
        print(f"  {m}  ({line_count[m]} lines, sorry={sorry_count[m]}, axiom={axiom_count[m]})")

    print("\nTop 10 import hubs (most-imported modules):")
    for mod, users in sorted(importers.items(), key=lambda x: -len(x[1]))[:10]:
        print(f"  {len(users):3d}  {mod}")

    dump = {
        "root": root,
        "imports": imports,
        "line_count": line_count,
        "sorry_count": sorry_count,
        "axiom_count": axiom_count,
        "orphans": sorted(orphans),
    }
    out_path = os.environ.get("DEP_GRAPH_OUT", "dep_graph.json")
    with open(out_path, "w") as fh:
        json.dump(dump, fh, indent=1)
    print(f"\nFull graph written to {out_path}")


if __name__ == "__main__":
    main()
