# Errata and supersession notice for `GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`

**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Date:** 2026-07-22  
**Status:** `CORRECTION / SUPERSESSION MAP`

The current controlling successor is

`research/finite-prefix-crt/HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`.

The earlier file remains in Git history and in the branch as a recoverable
research checkpoint, but the following claims are withdrawn or superseded.

## 1. Alias-removal detour withdrawn

Sections 3 and 10 of the earlier note used Hoeffding to show that a solution
modulo the primorial is probably not a nonzero alias.

For the actual construction the total reciprocal load satisfies

```text
Lambda < 0.41 < 1.
```

Hence every subset reciprocal sum `T` lies in `[0,Lambda] subset [0,1)`, while
the target `q` lies in `[0,1/5]`.  Therefore

```text
P_N T congruent P_N q (mod P_N)  =>  T=q.
```

No probabilistic alias estimate is required.

## 2. Linnik exponent obstruction withdrawn

Section 12 claimed that a least-prime-only sparse route needs a Linnik exponent
`L<2` in order to beat the primorial Fourier normalization.  That conclusion
relied entirely on the unnecessary alias estimate and is false as a stated
method obstruction.

Sparse realization remains unresolved for different reasons: prefix placement,
coverage of nonsensor primes, and compatibility of the high-control block range
with its lowest energy floor.  No numerical Linnik-exponent obstruction is now
claimed.

## 3. “Diagonal assignment” terminology corrected

The earlier `HC-RATE` formulation described a diagonal high assignment as one
“induced by an integer label”.  Every finite CRT assignment has an integer
representative, so that wording is not discriminating.

The accepted localization theorem uses the correct split:

1. a high-energy floor sector;
2. a coherent-label sector with controlled common label and exact quadratic
   energy `Qctrl=m^2 sigmaCtrl^2`.

The quantitative Peierls rate applies to the floor sector; the coherent-label
sector is a one-dimensional Gaussian lane.

## 4. Conditional frontier superseded

The earlier note isolated `HC-RATE(z)` as open.  The successor extracts the
explicit rate

```text
epsilon_k <= C exp(A(2k+1)-c 2^k/(k+1)^3),
```

from the accepted PDL level-set and localization architecture.  Complete
dyadic prefixes plus Li's summable floor recurrence then produce a full GFF
theorem candidate.

No release, proof-development, corpus, manuscript, formalization, review, DOI,
or publication status changes through this correction.
