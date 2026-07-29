# Recovery manifest — E306-POST-V1-AP-01

## Role identity

- Role: `E306 — Restricted-Prime Second-Application Proof Developer 01`
- Role ID: `E306-POST-V1-AP-01`
- Lifecycle: one-off bounded proof-development role
- Control issue: `Yuren-Tang/research-workbench#116`
- Project repository: `Yuren-Tang/erdos-306`
- Dedicated branch: `research/e306-post-v1-restricted-primes-v1`

## Immutable inputs

- Authorised starting head: `f03105e95dc2ec5595a931293f6ca951e4bc424a`
- Exact mathematical source: `9790763ab11a4406a7a15f79218e0d96efb81172`
- Source-preserving clarification candidate: `f03105e95dc2ec5595a931293f6ca951e4bc424a`
- Controlling feasibility return: `Yuren-Tang/research-workbench#110#issuecomment-5110977295`

Before mutation, comparison of the dedicated branch with the authorised starting head returned `identical`, with zero commits ahead and zero behind.  The required ACK was then posted to issue `#116`.

## Authorised outputs

Only the following files belong to this role:

1. `research/post-v1/restricted-primes/FIXED_PROGRESSION_RESTRICTED_SEMIPRIMES.md`
2. `research/post-v1/restricted-primes/SOURCE_MAP.md`
3. `research/post-v1/restricted-primes/VALIDATION.md`
4. `research/post-v1/restricted-primes/RECOVERY_MANIFEST.md`

No other path is authorised.

## Commit chain

Starting from `f03105e95dc2ec5595a931293f6ca951e4bc424a`:

1. `0cabea23afff65e07fb2c092418c0d3f738d2f55` — `Prove fixed-progression restricted semiprime theorem`
2. `1dc9aa2a15bb2191197d9eefff2aee79b5414a67` — `Map restricted-prime proof to exact article source`
3. `be03e73baa23a2d51d0e975608b16a56c39748a3` — `Record restricted-prime proof validation`
4. the commit creating this recovery manifest — `Add restricted-prime dossier recovery manifest`

The exact final head is to be read from the dedicated branch after this file is committed and recorded in the durable return.

## Theorem actually established

For fixed `m>=1` and nonempty `C subset (Z/mZ)^×`, put

`P_C={p prime:p mod m in C}`.

A positive rational in lowest terms is representable as a finite sum of reciprocals of pairwise distinct squarefree semiprimes whose two prime factors lie in `P_C` if and only if its reduced denominator is squarefree and every prime divisor of that denominator lies in `P_C`.  Every prescribed finite set of denominators can be avoided.

The dossier proves the theorem at authorial proof-development level by adapting the exact article mechanism with:

- fixed-modulus PNT/AP;
- Abel-summed reciprocal estimates;
- density `delta=|C|/phi(m)`;
- load-calibrated `Z=X^A`, `A=exp(sqrt(3/2)/delta)`;
- explicit anchor, fingerprint, row, decoder, retained-pair and sector losses;
- exact target-coordinate observability;
- direct supported `b=2` treatment and auxiliary-prime `b=1` closure;
- LCM squarefreeness and prime-support necessity.

## Audit-critical invariants

An independent auditor should verify the following in order:

1. the fixed-modulus PNT/AP is used only with fixed ratios and fixed `m`;
2. `delta log A=sqrt(3/2)`, so the complete-pair load tends to `3/4`;
3. `A>2` simultaneously makes target-row square load negligible and target-coordinate decoding valid through Sector II;
4. lower-row separation uses only `mu_r<=Z/(2r)+1`, never distribution modulo the moving row prime;
5. anchor and lower-row forcing lose `delta^3`, target rows lose `delta`, and adaptive retained pairs lose `delta^2`;
6. `M_dec=c_0 delta XZ/(log Z)^2` satisfies all decoder and Sector IV inequalities;
7. target rows exist exactly because every prime divisor of `b` belongs to `P_C`;
8. the finite avoidance and numerator induction preserve pairwise distinctness;
9. the LCM argument proves both necessary conditions;
10. no excluded generalisation is asserted.

## Recovery procedure

To recover or audit this role:

1. check out `Yuren-Tang/erdos-306:research/e306-post-v1-restricted-primes-v1` at the final head reported in issue `#116`;
2. compare that head against `f03105e95dc2ec5595a931293f6ca951e4bc424a` and confirm that exactly the four authorised files differ;
3. read the control issue and feasibility return in full;
4. compare every row of `SOURCE_MAP.md` with the exact source at `9790763...` and the clarification candidate at `f03105e...`;
5. recheck the scale algebra in `VALIDATION.md`;
6. audit the proof in `FIXED_PROGRESSION_RESTRICTED_SEMIPRIMES.md` from necessity through the `b=1,2` closure.

## Explicit non-actions

This role did not modify or act upon:

- `paper/**`;
- `lean/**`;
- any workflow;
- `main`;
- PR `#9`;
- any tag or GitHub Release;
- Zenodo or DOI records;
- `Yuren-Tang/mathematics`;
- any pull request.

## Current disposition

No remaining mathematical obstruction was identified for the fixed nonempty union of reduced residue classes.  The result is confined to the dedicated post-v1 research branch and awaits independent mathematical audit.