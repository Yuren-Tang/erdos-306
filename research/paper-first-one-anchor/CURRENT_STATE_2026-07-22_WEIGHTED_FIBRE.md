# E306-RL paper-first one-anchor current state — weighted-fibre checkpoint

**Date:** 2026-07-22  
**Programme:** `E306-RL`  
**Authority:** research only; not independently reviewed

## Exact source sequence

1. `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_01.md`
   — all-coordinate strengthening and removal of the separate sibling sector;
2. `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_02.md`
   — controlling weighted-fibre correction and complete Fourier ledger;
3. `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_MAJOR_ARC_AND_TERMINAL_BUDGET.md`
   — direct full-family major arc and strict `C -> X` terminal budget.

## Current mathematical classification

```text
MATERIAL STRICTER ALTERNATIVE ROUTE CANDIDATE /
ROUTE-LEVEL FRONTIER AHEAD OF CURRENT RECORDED E306 PROOF DAGS /
WEIGHTED-FIBRE NORMALIZATION REPAIRED /
DIRECT FULL-FAMILY MAJOR ARC CLOSED /
NO PNT-IN-PROGRESSIONS INPUT NEEDED /
NOT INDEPENDENTLY REVIEWED.
```

## Correct route

Let

```text
P={p prime:X<=p<X^3},
Z=X^3,
B={q prime:Z/2<=q<Z},
E_pair={pq:p,q in P,p<q},
E_b={rq:r|b prime,q in B}.
```

The full top block serves simultaneously as:

1. the one-block Gibbs quotient controlling noncoherent top assignments;
2. a shift-uniform cyclic decoder for every coordinate in `P\B`;
3. an elementary cyclic decoder for every prime coordinate of squarefree `b`.

The central corrected inequality is

```text
sum_x |F(y,x)|
 <= |F(y,x^*(y))|
    + A_B(y)(exp(Delta)-1),
```

where `A_B(y)` is the internal top-block Gibbs weight.  Therefore

```text
sum_y fibre_error(y)
 <= Z_B(exp(Delta)-1),
Z_B=sum_y A_B(y)=O(1/sigma_B)=O(Z log Z),
Delta<=Z^2 exp(-c Z/(log Z)^3).
```

Hence the total non-decoder fibre mass is `o(1/sigma_E)`.

For fixed `r|b`, no prime-distribution theorem modulo `r` is required:

```text
D_r>=|B|/r^2>>_b Z/log Z.
```

## Direct actual-family major arc

Define

```text
sigma_E^2=theta(1-theta) sum_(e in E)1/e^2.
```

Then

```text
sigma_E^2 asymp_b 1/(X^2 (log X)^2),
1/sigma_E asymp_b X log X.
```

The full `E_b` square load is smaller than the pair square load by
`O_b(log X/X)`.  Since every denominator is at least `X^2`, uniformly for
`|m|<=C/sigma_E`,

```text
sum_e |m/e|^3 = O_(b,C)(log X/X)=o(1).
```

The exact identity `theta sum_e1/e=1/b` cancels the linear phase.  Therefore

```text
log F(m)=-2 pi^2 m^2 sigma_E^2+o_(b,C)(1),
Re sum_(|m|<=C/sigma_E)F(m)>=c_maj/sigma_E.
```

No scaffold variance, comparison constant `K_b`, or fixed reservoir size `G` is
needed.

## Exhaustive terminal lanes

1. genuine major frequencies `|m|<=C/sigma_E`;
2. full-variance Gaussian tail up to `X^2/4`;
3. adaptive complete-pair damping up to `M_dec=XZ/(log Z)^2`;
4. large cold exact top labels;
5. energetic/noncoherent top assignments;
6. all non-decoder lower fibres.

The route uses only the terminal order

```text
C -> X.
```

It removes the all-block chain, adjacent-label propagation, global encoding,
global level-set/localization theorem, separate sibling sector, `eta`, and fixed
reservoir size `G` from the proposed proof DAG.

## Remaining high-risk obligations

1. independent ordinary-mathematics verification of the one-block cold theorem;
2. independent verification of the one-block fingerprint entropy theorem with the
   exact Bernoulli exponent;
3. verification of the multiplicity-sensitive cyclic packing constant;
4. endpoint and quantifier audit of the complete assembled proof.

No manuscript, Curator, review, Lean, release, DOI, or canonical status changes follow
from this checkpoint.
