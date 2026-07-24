# E306-PD-SAS-01 — sparse-anchor dependency and parameter ledger

**Controlling proof:** `proof-development/SPARSE-ANCHOR-HUMAN-PROOF.md`  
**Purpose:** record every external input, internal implication, quantitative scale, the closure of issue `#60` obligations, and the bounded `SAS-BR-1` repair.

## 1. External mathematical input

The sole asymptotic theorem used is the prime number theorem. It supplies fixed-ratio prime counts and, by Abel summation,

```text
sum_(X<=p<X^3)1/p=log3+o(1),
sum_(X<=p<X^3)1/p^2=O(1/(XlogX)),
#{Z/2<=p<Z}asymp Z/logZ.
```

No Lean declaration, released theorem, Curator corpus, manuscript assertion, or independent pass is used as correctness authority.

The repaired dense one-block packet is used only as a provider of the proof pattern that is fully restated in the robust exact-cold theorem.

## 2. Principal scales

```text
Z=X^3,
|B|asymp Z/logZ,
|S|asymp_A (logZ)^3,
N=|R|asymp Z/logZ,
F_sync=c_sync Z/log^3Z,
delta<=Z^(-K_0),
M_dec=XZ/log^2Z,
sigma_E^2asymp_b 1/(X^2log^2X),
1/sigma_Easymp_b XlogX.
```

Inside the robust-cold proof,

```text
R_0=Q_G(a),
B_0=A_0sqrt(R_0)Z^2/M,
R_0<c_wZ/log^3Z,
Masymp Z/logZ,
B_0/Z^2=O(1/sqrt(ZlogZ))=o(1).
```

The terminal arithmetic threshold is enlarged so that

```text
B_0<Z^2/16.
```

All relevant base-prime and dominant labels satisfy `|m|<=B_0`. The later quantitative cold-label range is

```text
|m|<<Z^(3/2)/(logZ)^(1/2),
```

which is also below `Z^2/16` for large `X` and contains `M_dec`. The values `X^2/4` in the fixed-`b` decoder and the Sector II/III split are separate, smaller thresholds and do not reuse the discarded `Z^2/4` robust-label allowance.

## 3. Dependency DAG

```text
PNT
 ├─ complete-pair load and variance
 ├─ top-block population size
 └─ adaptive interval prime count

multiplicity-sensitive cyclic packing
 └─ population floor for r<Z/2

near-top congruence counting
 └─ population floor for Z/2<=r<Z

uniform population floor
 └─ Bernoulli concentration and union bound
     └─ one deterministic common core S
         ├─ top-row code distances
         ├─ lower-prime row code distances
         └─ b-row size and distance

actual Bernoulli kernel
 + row code distance
 └─ nearest-decoder sibling factor delta

row sibling factors
 + retained internal complete-pair energy
 └─ decoder-defect expansion

cold threshold R_0<c_wZ/log^3Z
 + M asymp Z/logZ
 └─ B_0=o(Z^2)
     └─ terminal B_0<Z^2/16
         ├─ same-class centred lift equals its integer label
         ├─ distinct base-prime labels differ nontrivially mod target primes
         └─ dominant labels sharing two primes are unique

reciprocal dispersion
 + repaired label legality
 └─ repaired nondominant forcing
     └─ robust positive-density exact-cold theorem

robust exact-cold label bound
 + reciprocal dispersion from G to one s in S
 └─ core-defect amplification

robust exact-cold theorem
 + core-defect amplification
 └─ low retained energy = complete integer diagonal

integer diagonal
 + energetic-core enumeration
 + large-U binomial suppression
 + cold U!=emptyset suppression
 └─ top partition O(ZlogZ) and noncoherent top error

top partition
 + lower-row sibling sums
 + exact denominator-factor partition
 └─ weighted retained-skeleton compression

coherent core label
 + candidate-energy comparison
 └─ decoder identification through M_dec

load/variance
 + decoder identification
 + retained complete-pair skeleton
 ├─ direct major arc
 ├─ full-variance Gaussian tail
 ├─ adaptive complete-pair tail
 ├─ coherent top-label tail
 └─ synchronization/fibre error sector

five-sector budget
 └─ positive Fourier sum
     └─ target congruence
         └─ no-wrap equality
             └─ avoiding unit theorem
                 └─ headline theorem.
```

## 4. Issue #60 obligation matrix

### Obligation 1 — full-range population energy floor

**Closed in:** Human Proof, Proposition 4.2.

Two disjoint ranges are proved:

```text
r<Z/2:
  inverse-residue multiplicity mu_r<=Z/(2r)+1,
  M/mu_r>>r/logZ,
  cyclic packing gives cZ/log^3Z.

Z/2<=r<Z:
  phases below M'/(64Z) yield a short nonzero v,
  each v permits at most two interval representatives,
  at least M'/2 phases are separated.
```

Uniformity includes every prime row and every nonzero residue.

### Obligation 2 — one deterministic common core

**Closed in:** Human Proof, Theorem 5.1.

Sampling probability is

```text
rho=K(logZ)^4/Z.
```

For every test `(r,d)`, the expected weighted energy is at least `c_0KlogZ`. Scaling the summands into `[0,1]` gives a lower-tail bound `Z^(-cK)`. There are fewer than `Z^2` tests. The same sample has, by two-sided Chernoff,

```text
c_Alog^3Z<=|S|<=C_Alog^3Z.
```

The lower size bound is retained because it is needed for the fixed `r|b` tails.

### Obligation 3 — actual row-tail estimate

**Closed in:** Human Proof, Section 6.

The kernel is the exact Bernoulli factor

```text
|(1-theta)+theta e(t)|<=exp(-kappa_b||t||^2).
```

Torus triangle inequality shows that at most one row value can have energy below `D_r/4`. Hence

```text
sum_(x!=x_r^*)exp(-kappa_bE_r(x))
 <=r exp(-kappa_bD_r/4).
```

Choose `A=A(b,K_0)` so the uniform prime-row bound is `delta<=Z^(-K_0)`, with `K_0>=20`.

### Obligation 4 — decoder-defect expansion

**Closed in:** Human Proof, Lemma 7.1.

For fixed defect set `U`, only factors incident to `U` are discarded. They are bounded by one. Star-row sums then factor because the retained internal factors no longer depend on the defective variables. No independence of the original Gibbs factors is assumed.

### Obligation 5 — robust positive-density exact-cold theorem

**Closed in:** Human Proof, Propositions 8.2 and 8.3, with `SAS-BR-1`.

The proof is written for arbitrary

```text
G subset [Z/2,Z),
|G|>=c_*Z/logZ.
```

It includes all prior local repairs:

```text
source class size >=16,
R_0=0 separated before sqrt(R_0),
substantial-class sum=(S_0-n_i)-(t-1),
ordered-pair double count divided by two,
s_0 chosen large enough to absorb (t-1) and Z/2 endpoints.
```

The repaired label ledger is:

```text
B_0=A_0sqrt(R_0)Z^2/M=o(Z^2),
terminal B_0<Z^2/16,
all base-prime/dominant labels |m|<=B_0.
```

Before class energy and zero-exception, the proof establishes:

1. if `p,q` are in one label class, then `|m|<pq/2`, so `H_(pq)=m`;
2. if distinct base-prime labels `m_i,m_j` are compared at `q!=p_0`, then `p_0|(m_i-m_j)` and `0<|m_i-m_j|<p_0q`, so their difference is nonzero modulo `q`;
3. if two dominant labels share two primes, their difference is divisible by the product and has smaller absolute value, so the labels are equal.

These are the only new logical consequences required by `SAS-BR-1`; the subsequent quantitative label estimate and zero-exception count are unchanged.

### Obligation 6 — core-defect amplification

**Closed in:** Human Proof, Section 9.

A core mismatch `d mod s` has reciprocal-dispersion norm `>>sqrt(Z/log^3Z)` across `G`. The repaired range first legalizes the retained centred lifts. The exact-cold quantitative label contributes an `l^2` perturbation only `O(1/logZ)`. Thus the actual star phases cost `c_defZ/log^3Z`.

### Obligation 7 — complete integer diagonal for small defects

**Closed in:** Human Proof, Theorem 10.1.

For `|U|<=N/2`, low `T_U` first labels all decoder rows in `G`, then core-defect amplification forces every `s in S` to carry the same label. The quantitative label bound is eventually below `Z^2/16`; since every retained witness product is at least `Z^2/4`, every retained centred lift equals the integer label.

### Obligation 8 — small-defect off-diagonal sum

**Closed in:** Human Proof, Section 10.

The exact bound is

```text
Y_S exp(-kappa_bF_sync)(1+delta)^N,
Y_S<=exp(O((logZ)^4)).
```

Since `F_syncasymp Z/log^3Z` and `Ndelta=o(1)`, the sum is `exp(-Omega_b(Z/log^3Z))`.

A separate correction handles cold `U!=emptyset` terms:

```text
O(ZlogZ)((1+delta)^N-1)=O(Z^2delta).
```

They are not silently included in the genuine diagonal.

### Obligation 9 — large-defect sum

**Closed in:** Human Proof, Section 10.

For `|U|>N/2`,

```text
sum_y sum_U delta^|U|
 <=Y_S2^Ndelta^(N/2).
```

Its logarithm is

```text
O(log^4Z)+O(Z/logZ)-(K_0/2)(Z/logZ)logZ
 =-Omega(Z).
```

### Obligation 10 — diagonal partition and lower weighted fibres

**Closed in:** Human Proof, Sections 10 and 11.

For cold `U=emptyset`,

```text
T_emptyset(m)=m^2sigma_(R,S)^2,
sigma_(R,S)^2asymp1/(Z^2log^2Z),
```

so the diagonal sum is `O(ZlogZ)`.

The lower compression error is not unweighted. The exact factor is

```text
P_top(exp(Delta)-1),
P_top=O(ZlogZ).
```

The denominator-factor partition is written explicitly and includes the retained `S-S`, `R-P_low`, and `P_low-P_low` skeleton.

### Obligation 11 — sparse b-sensitive family and analytic closure

**Closed in:** Human Proof, Sections 2, 6, 12, and 13.

```text
E_b^S={rs:r|b,s in S},
Lambda_b^S=O_b(log^3Z/Z),
W2_b^S=O_b(log^3Z/Z^2),
D_r^b(S)>=|S|/r^2>>_b log^3Z.
```

The actual variance remains complete-pair dominated. The major arc uses the actual family and has cubic remainder `o(1)`. Gaussian, adaptive, coherent-label, synchronization, fibre, no-wrap, and arithmetic closure are all stated with their exact ranges. The fixed-`b` threshold `X^2/4`, the prime decoder threshold `M_dec`, and the final load-based no-wrap use no part of the old `|m|<Z^2/4` dominant-label range.

### Obligation 12 — route burden and fingerprint verdict

**Closed in:** Route Comparison and Human Proof, Section 15.

Fingerprint entropy is genuinely absent as a load-bearing theorem. Core enumeration is a raw count with logarithm `O(log^4Z)`, and robust cold rigidity is a low-energy structural theorem, not an energetic level-set bound.

The route is structurally cleaner but not demonstrably shorter in standalone prose.

## 5. Exact factor partition

Let `P_low=P\B` and `B=S disjoint-union R`. Then `E_pair` decomposes into

```text
S-S,
S-R,
R-R,
S-P_low,
R-P_low,
P_low-P_low.
```

The proof assigns

```text
S-R,R-R        -> top synchronization,
S-P_low        -> lower row kernels,
S_b-S          -> target-denominator row kernels,
S-S,R-P_low,
P_low-P_low    -> retained skeleton.
```

No factor is omitted or used twice.

## 6. Error budget

With `K_0>=20`:

```text
energetic small-U top
 =exp(-Omega_b(Z/log^3Z));

large-U top
 =exp(-Omega(Z));

cold top with U!=emptyset
 =O(Z^2delta);

lower and b-row siblings
 =O_b(ZlogZ)(exp(Delta)-1),
 Delta<=Zdelta+exp(-Omega_b(log^3Z));

adaptive tail
 =exp(-Omega(X^2/log^2X));

coherent top-label tail
 =O(ZlogZ exp(-cX^2/log^6Z)).
```

Every term is `o(1/sigma_E)`.

## 7. Parameter order

For fixed `b` and forbidden set `T`:

1. fix the compact Bernoulli interval from the load margins;
2. fix the positive-density exact-cold constants, including `A_0`, `rho_0`, and `c_w`;
3. fix `K_0>=20`;
4. choose sensor strength `A=A(b,K_0)`;
5. fix sampling constants `K(A),c_A,C_A`;
6. choose `C` for the Gaussian tail;
7. choose `X` above the finite maximum of all remaining thresholds, including the uniform robust-cold inequality `B_0<Z^2/16`.

The terminal order is exactly

```text
C -> X.
```

There is no `eta`, reservoir size, moving Research Lead input, or hidden limit interchange.

## 8. Assurance boundary

This ledger records the bounded `SAS-BR-1` repair of the complete proof-development candidate. It does not assert independent repair verification, manuscript fitness, Lean correspondence, Curator integration, or publication readiness.