# E306-PD-SAS-01 — sparse-anchor manuscript handoff

**Status:** proof-development handoff after bounded `SAS-BR-1` repair; independent repair verification required.  
**Not authority for:** manuscript adoption, Curator integration, Lean correspondence, release, arXiv, journal, DOI, or submission.

## 1. Candidate theorem package

The packet supplies a complete ordinary-proof candidate for the squarefree-denominator characterization using a sparse synchronization interface:

```text
complete prime-pair denominator family
+ one polylogarithmic actual-prime core S
+ decoder-defect expansion
+ robust positive-density exact-cold witness theorem
  with repaired label-range legality
+ direct major arc and complete-pair tails.
```

The public theorem is unchanged:

> A positive rational in lowest terms is a finite sum of reciprocals of distinct squarefree semiprimes if and only if its denominator is squarefree.

## 2. Recommended manuscript spine after independent repair verification

A manuscript adopting this route should use the following order.

1. State the headline theorem and the avoiding unit theorem.
2. Define `P`, `B`, the sparse core `S`, `E_pair`, `E_b^S`, and the squarefree period `L`.
3. Prove reciprocal load, inverse-square mass, compactness of `theta`, and the exact Fourier formula.
4. Prove the full-range population floor and the deterministic common-core theorem.
5. Prove the shift-uniform row-tail lemma with the actual Bernoulli kernel.
6. Prove the robust positive-density exact-cold theorem, including all repaired constants and the `SAS-BR-1` label-legality lemmas.
7. Prove decoder-defect expansion and core-defect amplification.
8. State the exact coherent top-partition theorem, explicitly separating energetic assignments and cold `U!=emptyset` defects.
9. Give the exact denominator-factor partition and weighted retained-skeleton inequality.
10. Identify the decoders and prove the five exhaustive sectors.
11. Finish with positivity, no-wrap, avoidance, numerator induction, and `b=1,2`.

The robust exact-cold theorem should precede the cluster expansion in exposition if the manuscript values linear dependency order; the proof-development file places expansion first to motivate the retained witness quantity.

## 3. Main statements suitable for extraction

### Sparse actual-prime sensor theorem

For every fixed `A>0`, all large `Z` admit

```text
S subset {s prime:Z/2<=s<Z},
|S|asymp_A(logZ)^3,
```

such that every prime row `X<=r<Z` and every nonzero `d mod r` satisfy

```text
sum_(s in S,s!=r)||d s^(-1)/r||^2>=AlogZ.
```

### Robust exact-cold theorem

For every fixed positive density `c_*`, every prime subset `G` of `[Z/2,Z)` with `|G|>=c_*Z/logZ` has the property

```text
Q_G(a)<c_wZ/log^3Z
```

only for assignments represented by one integer label, with the stated quantitative label bound.

The proof-side cutoff must be displayed:

```text
B_0=A_0sqrt(Q_G(a))Z^2/|G|=o(Z^2),
B_0<Z^2/16
```

for the terminal arithmetic range. All base-prime and dominant labels are restricted to `|m|<=B_0`. Before class-energy or zero-exception arguments, the text must prove:

```text
same-class centred lift = integer label;
distinct base-prime labels differ nontrivially modulo each target prime;
two dominant labels sharing two witness primes are equal.
```

### Sparse arithmetic synchronization theorem

For the sparse core `S`, the absolute top partition is `O_b(ZlogZ)`, and the mass outside genuine globally coherent integer assignments is

```text
exp(-Omega_b(Z/log^3Z))+O(Z^2delta).
```

Here `delta<=Z^(-K_0)` is the uniform row sibling factor.

### Sparse target-denominator observability

The family

```text
E_b^S={rs:r|b prime,s in S}
```

has vanishing reciprocal and square load while giving row distance `>>_b(logZ)^3` for every prime divisor of `b`.

## 4. Mandatory cautions in exposition

A manuscript must not say merely that “all low-defect terms are diagonal.” It must distinguish:

```text
U=emptyset, low retained energy:
  genuine global integer diagonal;

U!=emptyset, low retained energy:
  retained witness is diagonal, but the original top assignment has defects;

T_U>=F_sync:
  energetic, regardless of any formal residue label.
```

Likewise, it must not write the Gaussian identity `T_U=m^2sigma^2` before the cold theorem has placed the label inside the repaired range—quantitatively, eventually `<Z^2/16`—and thereby identified every retained centred lift with the integer `m`.

A manuscript must not retain the former generic dominant-label allowance `|m|<Z^2/4`. The appearances of `X^2/4` in fixed-`b` decoding and in the Sector II/III split are different, smaller thresholds and should be labelled as such. The prime decoder range `M_dec`, major/minor estimates, adaptive interval, and terminal reciprocal no-wrap are unchanged and do not depend on the discarded robust-label range.

## 5. What may be removed relative to the dense one-anchor manuscript

After independent repair verification, the sparse manuscript need not include:

```text
fingerprint rigidity,
fingerprint entropy,
energy-level fingerprint counting,
full-top target-denominator rows.
```

It must retain:

```text
reciprocal dispersion,
repaired nondominant forcing,
SAS-BR-1 label-range and centred-lift legality,
zero-exception exact-cold rigidity,
complete internal witness edges,
weighted retained-skeleton compression,
direct major arc,
Gaussian and adaptive complete-pair tails.
```

## 6. Novelty and terminology boundary

The term “sparse anchor” should be used carefully. The sensor core has polylogarithmic size, but the retained witness block uses the dense complete graph already present in `E_pair`. A precise description is:

```text
sparse sensor interface with dense natural cold witness.
```

The packet does not establish a sparse-graph replacement for the complete internal witness energy.

## 7. Fingerprint statement

The manuscript may state, after independent repair verification:

```text
Fingerprint entropy is not load-bearing in this route.
```

It should immediately qualify this by saying that the proof still uses:

```text
a raw enumeration of all sparse-core assignments,
and deterministic exact-cold rigidity on a dense positive-density witness block.
```

The raw count has logarithm `O((logZ)^4)` and is dominated directly by the synchronization floor; it is not an energy-level entropy theorem.

## 8. Concision statement

The manuscript should not claim a shorter proof unless an actual edited page comparison supports it. The defensible statement is:

```text
The sparse route has a cleaner theorem hierarchy and removes fingerprint entropy,
but its standalone proof burden is comparable because it adds sampling,
defect expansion, amplification, and explicit top-defect bookkeeping.
```

`SAS-BR-1` is a bounded legality repair inside the existing exact-cold proof. It does not alter this route comparison.

## 9. Suggested independent repair-verification checkpoints

An independent verifier should recompute, rather than inherit:

1. the asymptotic implication `B_0=o(Z^2)` and the uniform terminal threshold `B_0<Z^2/16`;
2. uniqueness of dominant labels sharing two witness primes;
3. exact identification of a same-class centred lift with its integer label;
4. nonvanishing modulo a target prime of the difference of distinct base-prime labels;
5. use of those facts before class energy and zero-exception;
6. propagation through core-defect amplification and the exact top partition;
7. separation of the repaired robust-cold range from `X^2/4`, `M_dec`, all five sectors, and terminal no-wrap;
8. preservation of both population-floor ranges, concentration constants, the exact `D/4` row tail, denominator-factor partition, and `P_top(exp(Delta)-1)`.

## 10. Current gate

The repaired packet is ready for exactly one next action:

```text
independent bounded SAS repair verification.
```

It is not yet ready for manuscript replacement, formal correspondence, Curator promotion, release, or submission.