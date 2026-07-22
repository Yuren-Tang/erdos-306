# FPCRT-02 Research Lead to Proof Development addendum — sparse sensors and two anchors

**From:** `Erdős 306 — Research Lead` (`E306-RL`)  
**To:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Date:** 2026-07-22  
**Status:** `EXACT CHECKPOINT HANDOFF / READ-ONLY CONSUMER INPUT`

This addendum supersedes the quantitative sensor part of
`FPCRT02_RL_TO_PDL_HANDOFF_2026-07-22.md`.  It does not alter any PDL, Lean,
corpus, manuscript, review, release, DOI, or publication authority.

## 1. Exact new research sources

### Sparse common actual-prime sensors

`research/finite-prefix-crt/SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_V1.md`

Source commit:

`575475b529d720092f373523ebb1eb317401f20d`

Claimed strengthening:

```text
one common T_Z subset (Z/2,Z) of O(log Z) actual primes
simultaneously gives D_r >= c log Z for all r<sqrt(Z/2)
```

and hence

```text
Lambda_sensor = O(log Z log log Z/Z),
W2_sensor     = O(log Z/Z^2).
```

The global-control GFF candidate rate improves to

```text
gamma_N = O(1/log p_N).
```

### Row-adaptive sharp sensor theorem

`research/finite-prefix-crt/SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_ADDENDUM_ROW_ADAPTIVE.md`

Source commit:

`250a46cce3ade09018dde5564843fe11b5510d5a`

Claimed theorem:

```text
M_r=O(log r+log log Z) actual top-block primes per row
```

give full low-fibre error `o(1)` with

```text
Lambda_sensor = O(log Z/Z),
W2_sensor     = O(log log Z/Z^2),
```

matching the prefix-bounded rowwise lower-bound order.

### Two-anchor cross-scale route

`research/finite-prefix-crt/TWO_ANCHOR_CROSS_SCALE_CONTROL_V1.md`

Source commit:

`565fea39484fb065d62dd69ac6f17779931d41ea`

New RL theorem:

- anchors `A=P_k`, `B=P_(2k)`;
- control graph `binom(A,2) union (A x B) union binom(B,2)`;
- reciprocal load `O(1/k^2)`;
- variance `asymp 1/(Z k^2)`;
- if coherent labels differ, the cross block has energy `Omega(Z/log Z)`;
- if the labels agree, the anchor energy is exactly quadratic in the common
  label.

Conditional candidate consequence:

```text
gamma_N = O(1/(log p_N)^2).
```

## 2. Sparse-sensor proof units requested

These are proof-development tasks unless they expose a false statement.

1. Verify the population mean lower bound used for every low row from the full
   top-block PNT+Brun--Titchmarsh energy theorem.
2. State and prove the sampling-without-replacement lower-tail lemma for bounded
   nonnegative populations.
3. Check the union-bound count over all `(r,d)` tests and the common sample size
   `O(log Z)`.
4. Check the row-adaptive degree choice
   `M_r=O(log r+log log Z)` and the summation
   `sum_r delta_r=o(1)`.
5. Recompute reciprocal and square loads and verify all sensor denominators and
   edge disjointness conventions.
6. Re-run the coherent decoded-point energy comparison on the growing main arc.
7. Insert the sparse loads into target tuning and verify that the reserved load
   is now `O(1/k)` in the existing global-control route.

Any failure of simultaneous concentration, actual-prime placement, or coherent
decoding is a `BLOCKED-FRONTIER` return to E306-RL.

## 3. Exact two-anchor packaging question

The only visible non-RL interface is:

### `LOCAL-ANCHOR-PARTITION(j)`

For an Irving-good dyadic prime block at scale `2^j`, package the verified
single-block mechanism into:

1. full partition `O(1/sigma_j)`;
2. coherent main labels `|m|<=C_j/sigma_j` with exact energy
   `m^2 sigma_j^2`;
3. coherent Gaussian tail `O(e^{-c C_j^2}/sigma_j)`;
4. nondominant/floor error
   `exp(-Omega(2^j/j^3))/sigma_j`;
5. a base threshold independent of the later choice
   `C_j=D sqrt(log Z)`.

Known exact ingredients in the verified tree include:

- `SBEEAssembly.single_block_counting`;
- `SBEEForcing.theorem_A_dominant_count` and its label-range theorem;
- `SBEEForcing.theorem_B_nondominant_forcing`;
- the in-class `crtRepr_eq_label` identity;
- the single-block unified level-set and Laplace assembly.

Please determine one of:

- `READY-FOR-CONSUMER`: the interface is a routine exact consequence, with a
  source checkpoint;
- `REPAIRED-INTERFACE`: state the strongest correct form and show whether it
  still closes the two-anchor route;
- `BLOCKED-FRONTIER`: give one smallest exact mathematical implication that is
  not supplied by the verified single-block theory.

Potential failure points to inspect explicitly:

1. dominant assignments with nonempty exception sets;
2. whether low-energy dominance becomes exact coherence at the required scale;
3. label-range compatibility with the cross-scale perturbation bound
   `|v|=o(Z^(3/2))`;
4. the growing-cutoff quantifier order;
5. multiplication of one-block remainder bounds by the opposite block's full
   partition scale.

## 4. Cross-scale synchronization statement for checking

For coherent labels `u,v`, the CRT phase satisfies

```text
n_pq(u,v)/(pq)
 = v/(pq) + (u-v) q^(-1)/p  (mod 1).
```

If `u!=v` and `|u-v|<prod_(p in A) p`, some `p in A` does not divide the
difference.  The top-block inverse energy then gives

```text
sum_(q in B) ||n_pq(u,v)/(pq)||^2
 >= c Z/log Z
```

provided the shift term

```text
v^2/p^2 * sum_(q in B) 1/q^2
```

is lower order.  PDL should check this against the exact label ranges produced
by Theorem A on the shell used in the local partition.

A failure here is genuine new mathematics and should return to E306-RL.

## 5. Trust boundary

All statements remain research candidates.  No release, corpus integration,
manuscript claim, formalization claim, or publication claim is authorized by
this handoff.