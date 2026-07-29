# Recovery manifest — E306-POST-V1-AP-01 and source repair

## Role identity

### Authorial role

- Role: `E306 — Restricted-Prime Second-Application Proof Developer 01`
- Role ID: `E306-POST-V1-AP-01`
- Lifecycle: one-off bounded proof-development role

### Bounded source-repair role

- Role: `E306 — Restricted-Prime External-Source Repair 01`
- Role ID: `E306-POST-V1-AP-SOURCE-REPAIR-01`
- Lifecycle: one-off documentary source repair and source-fidelity clarification
- Control issue: `Yuren-Tang/research-workbench#116`
- Project repository: `Yuren-Tang/erdos-306`
- Dedicated branch: `research/e306-post-v1-restricted-primes-v1`

## Immutable inputs

- Original authorised starting head: `f03105e95dc2ec5595a931293f6ca951e4bc424a`
- Authorial returned head and exact source-repair starting head: `1290c4124df0626bba3f3715e469bb7cc70e93a6`
- Exact mathematical source: `9790763ab11a4406a7a15f79218e0d96efb81172`
- Source-preserving clarification candidate: `f03105e95dc2ec5595a931293f6ca951e4bc424a`
- Controlling feasibility return: `Yuren-Tang/research-workbench#110#issuecomment-5110977295`
- Authorial durable return: `Yuren-Tang/research-workbench#116#issuecomment-5112092315`
- Independent audit return: `Yuren-Tang/research-workbench#116#issuecomment-5112349809`
- Director disposition: `Yuren-Tang/research-workbench#116#issuecomment-5112456388`
- Source-repair packet: `Yuren-Tang/research-workbench#116#issuecomment-5112461304`

Before authorial mutation, comparison of the dedicated branch with `f03105e...` returned `identical`, with zero commits ahead and zero behind.  Before source-repair mutation, the branch was independently verified to resolve exactly to `1290c412...`, to be four commits ahead of and zero behind `f03105e...`, and to differ in exactly the four authorised files.  The source-repair ACK was then posted at `Yuren-Tang/research-workbench#116#issuecomment-5112808544`.

## Authorised outputs

Only the following files belong to these roles:

1. `research/post-v1/restricted-primes/FIXED_PROGRESSION_RESTRICTED_SEMIPRIMES.md`
2. `research/post-v1/restricted-primes/SOURCE_MAP.md`
3. `research/post-v1/restricted-primes/VALIDATION.md`
4. `research/post-v1/restricted-primes/RECOVERY_MANIFEST.md`

No other path is authorised.

## Commit chain

### Authorial chain from `f03105e...`

1. `0cabea23afff65e07fb2c092418c0d3f738d2f55` — `Prove fixed-progression restricted semiprime theorem`
2. `1dc9aa2a15bb2191197d9eefff2aee79b5414a67` — `Map restricted-prime proof to exact article source`
3. `be03e73baa23a2d51d0e975608b16a56c39748a3` — `Record restricted-prime proof validation`
4. `1290c4124df0626bba3f3715e469bb7cc70e93a6` — `Add restricted-prime dossier recovery manifest`

### Source-repair chain from `1290c412...`

1. `ef4d229614c606cda3dfcf5d45dd42920ecda408` — `Repair restricted-prime external source record`
2. `f9f509d43259d053260b432f70a11111650d0d45` — `Complete restricted-prime source map`
3. `541003b6d6124925d987a01e8487e9c37f9ed924` — `Validate restricted-prime source repair`
4. the commit creating this synchronised recovery manifest — `Synchronize restricted-prime recovery state`

The exact final source-repair head is to be read from the dedicated branch after this file is committed and is recorded in the durable return to issue `#116`.

## Theorem actually established

For fixed `m>=1` and nonempty `C subset (Z/mZ)^×`, put

`P_C={p prime:p mod m in C}`.

A positive rational in lowest terms is representable as a finite sum of reciprocals of pairwise distinct squarefree semiprimes whose two prime factors lie in `P_C` if and only if its reduced denominator is squarefree and every prime divisor of that denominator lies in `P_C`.  Every prescribed finite set of denominators can be avoided.

The source repair does not alter this theorem or any part of its proof.  It adds only:

- a precise authoritative source and exact locator for fixed-modulus PNT/AP;
- the explicit order of quantifiers fixing `m` and `C` before the scale tends to infinity;
- the Abel/partial-summation derivation of reciprocal-prime estimates;
- the distinction from ordinary PNT and the exclusion of varying-modulus inputs;
- the exact adaptive-interval phase calculation already present in the article source for Sector III.

## Authoritative external source

Harold Davenport, *Multiplicative Number Theory*, second edition, revised by Hugh L. Montgomery, Graduate Texts in Mathematics 74, Springer-Verlag, New York, 1980.

Exact locator:

- Chapter 22, “The Prime Number Theorem for Arithmetic Progressions (II)”, formula (4), p. 133;
- the paragraph immediately following formula (4), p. 133, deriving the `pi(x;q,a)` analogue by partial summation with main term `Li(x)/phi(q)`;
- Chapter 20, “The Prime Number Theorem for Arithmetic Progressions (I)”, pp. 121–125, for the preceding progression estimates and notation.

Only the fixed-`q=m` consequence is used, for the finitely many fixed classes in `C`.  No modulus varies with `X`.

## Audit-critical invariants

An independent source-repair verifier should check the following in order:

1. the final branch descends from exact source-repair head `1290c412...` without any intervening foreign movement;
2. only the four authorised files differ from `1290c412...`;
3. every changed line is bibliographic completion, source-fidelity wording, source validation, or recovery synchronisation;
4. Theorem A and all hypotheses are byte-for-byte or semantically unchanged;
5. `m` and `C` are fixed before `X->infinity`;
6. the citation and exact locator agree with Davenport, Chapter 22, p. 133;
7. partial summation, not a separate distribution theorem, derives the reciprocal-prime estimate;
8. no varying-modulus, Siegel–Walfisz, Bombieri–Vinogradov, GRH, short-interval, or moving-row-prime theorem is invoked;
9. the Sector III clarification uses exactly `4|n|<=pq<=9|n|`, `1/9<=|n|/(pq)<=1/4`, `||n/(pq)||>=1/9`, and `binom(K_n,2)` retained pairs;
10. no scale, constant, denominator construction, sector boundary, closure argument, finite-avoidance step, or exclusion changed.

## Recovery procedure

To recover or audit the repaired role:

1. check out `Yuren-Tang/erdos-306:research/e306-post-v1-restricted-primes-v1` at the final head reported in issue `#116`;
2. compare that head against `1290c4124df0626bba3f3715e469bb7cc70e93a6` and confirm that only the four authorised files differ;
3. compare the final head against `f03105e95dc2ec5595a931293f6ca951e4bc424a` and confirm the complete authorial-plus-repair ancestry;
4. read the original role packet, authorial return, independent audit, Director disposition and source-repair packet in full;
5. inspect the cited Davenport passages and verify the fixed-modulus specialisation and partial-summation statement;
6. compare the Sector III wording with `paper/e306-anchor-fibre-v1/manuscript/sections/07_decoded_skeleton.tex` at `9790763...`;
7. perform the mathematical-invariance diff described in `VALIDATION.md`.

## Explicit non-actions

Neither role modified or acted upon:

- `paper/**`;
- `lean/**`;
- any workflow;
- `main`;
- PR `#9`;
- any tag or GitHub Release;
- Zenodo or DOI records;
- `Yuren-Tang/mathematics`;
- any pull request;
- any AffineCDC surface.

## Current disposition

The independent audit found the theorem mathematically supported and required only this bounded documentary source repair.  The source record and authorised Sector III source-fidelity clarification are now complete.  The repaired dossier remains confined to the dedicated post-v1 research branch and awaits independent source-repair verification before any later manuscript, publication or corpus action.
