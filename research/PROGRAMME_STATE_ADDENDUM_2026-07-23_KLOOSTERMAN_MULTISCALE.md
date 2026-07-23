# Programme-state addendum — Kloosterman multiscale frontier

**Date:** 2026-07-23  
**Programme:** `E306-RL`  
**Controls:** `research/PROGRAMME_STATE.md` at blob `823756eeb36b1f0b0ff40bac0ea405df2a7030dd`  
**Authority:** research only; not independently reviewed

## Supersession

This addendum supersedes only the following current-frontier entries of the
controlling programme state:

1. the strongest GFF logarithmic factor;
2. the claim that `1/(log Z)^2` is the best current population input for every row
   scale;
3. the next-frontier wording around direct bipartite rigidity.

All authority, assurance, release, manuscript, Curator, Lean, DOI, arXiv, and
submission boundaries remain unchanged.

## Strongest GFF candidate

The strongest current argument-level candidate is now

```text
gamma_N << p_N^(-1/2)(log p_N)^(5/2).
```

Controlling source:

- `research/finite-prefix-crt/KLOOSTERMAN_MULTISCALE_SENSOR_GFF_V1.md`.

It consumes the unconditional external estimate of Garaev (2010) for prime-inverse
exponential sums.  This is a new analytic backend and is not part of the released
Erdős 306 authority or the PNT-only paper-first proof.

## Mechanism change

For a prime row modulus `r`, choose sensor primes at scale `r^kappa` with fixed
`kappa>3/4`.  Garaev's bound plus the Fourier series of `||x||^2` gives uniformly
for every nonzero multiplier

```text
(1/|B|) sum_(s in B)||d s^(-1)/r||^2=1/12+o(1).
```

Thus the population mean is constant rather than `1/(log Z)^2`.

A fixed four-band power cascade covers all prime rows between `Z^(1/1.9)` and `Z`.
Each band uses one common actual-prime sample of size

```text
O(log Z/q).
```

Because the number of bands is fixed, the whole conditioned quotient has entropy

```text
O((log Z)^2/q).
```

The complete top witness block synchronizes every scale sample and supplies weighted
floor

```text
qZ/(log Z)^3.
```

Balancing gives

```text
q^2Z>>(log Z)^5.
```

## Variance and terminal lanes

Use the complete target-denominator row

```text
E_2={2s:s prime,Z/2<s<=Z}.
```

It has reciprocal load `O(1/log Z)` and square load `asymp1/(Z log Z)`.  It supplies

```text
V asymp q/(Z log Z)
```

and annihilates both `r=2` residues throughout the full reciprocal-label outer
range.  Hence:

1. the major width is `o(Z/log Z)`;
2. lower rows reconstruct the common integer only where small-phase reconstruction
   is needed;
3. the outer lane is removed directly by the full `r=2` family.

## Direct-bipartite frontier correction

Naive direct bipartite rigidity is false.  The exact plaquette counterexample and
the arithmetic cycle-space analysis are recorded in:

- `research/paper-first-one-anchor/BIPARTITE_PLAQUETTE_METASTABILITY_COUNTEREXAMPLE_V1.md`;
- `research/paper-first-one-anchor/ARITHMETIC_CYCLE_SPACE_RIGIDITY_FRONTIER_V1.md`.

The graph-density consequences are recorded in:

- `research/finite-prefix-crt/C4_FREE_SENSOR_SQUARE_ROOT_BARRIER_V1.md`;
- `research/finite-prefix-crt/SHORT_CYCLE_SENSOR_GIRTH_BARRIER_V1.md`.

The robust exact-cold top witness remains load-bearing in the strongest routes.
The revised escape routes are:

```text
ARITHMETIC CYCLE-SPACE SPECTRAL GAP,
ARITHMETIC CHORD EXPANSION,
NON-ENUMERATIVE MULTIPLIER SPECTRAL PROFILES,
COMPLEX CYCLE-MODE CANCELLATION.
```

## Route hierarchy

```text
O(1/log p_N)                         global-control route
O(1/(log p_N)^2)                     two-anchor route
p_N^(-2/9) polylog                   critical sparse-Gibbs route
p_N^(-1/4)(log p_N)^(5/4)            one-anchor sparse-Gibbs route
p_N^(-1/2)(log p_N)^(7/2)            elementary common-top defect route
p_N^(-1/2)(log p_N)^(5/2)            Kloosterman multiscale defect route
```

Every GFF line remains an argument-level research candidate unless separately
accepted by proof development and independent audit.

## Assurance handoff recommendation

The Kloosterman multiscale route should be handed to PDL only as a distinct bounded
unit, with explicit verification of:

1. Garaev theorem statement and endpoint use;
2. Fourier-series conversion to constant quadratic energy;
3. four-band simultaneous samples;
4. top-witness amplification of all scale cores;
5. sensor reciprocal and square loads;
6. full `r=2` variance/outer-label role;
7. small-parameter defect expansion;
8. central-band and exactness closure.

No manuscript, Curator, Lean, release, DOI, arXiv, or canonical action is authorized
by this addendum.

## Next Research Lead frontier

1. adversarially attack the Kloosterman scale cascade and its small-parameter
   normalization;
2. seek a multiplier spectral-profile theorem which sums row siblings without a
   worst-case minimum distance;
3. improve or replace the top exact-cold floor `Z/(log Z)^3`;
4. investigate arithmetic cycle-mode cancellation capable of crossing the power
   `1/2` barrier;
5. receive only exact failed implications or structural obstructions from PDL.
