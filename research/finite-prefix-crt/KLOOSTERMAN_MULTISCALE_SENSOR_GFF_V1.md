# Kloosterman multis-scale sensing and the improved square-root GFF logarithm

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-KMS-01`  
**Status:** `ARGUMENT / MATERIAL FULL THEOREM CANDIDATE / NEW ANALYTIC BACKEND / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-23

## 1. Result and provenance

The elementary top-block reciprocal-dispersion lemma used in the preceding
small-parameter route has worst-test population mean `1/(log Z)^2`.  Consequently a
common sample with weighted distance `qD>>log Z` has size

```text
O((log Z)^3/q),
```

and explicit core entropy gives the candidate

```text
q >> Z^(-1/2)(log Z)^(7/2).
```

This note replaces that elementary population estimate by an unconditional
Kloosterman-sum estimate over primes, applied scale by scale.  The resulting
population mean is an absolute positive constant.  A fixed-depth power-scale
cascade then uses only

```text
O(log Z/q)
```

core primes in total, up to a constant depending on the fixed scale parameters.
The top witness block pays the entropy of all these cores simultaneously.  The new
balance is

```text
q^2 Z >> (log Z)^5,
```

and therefore the candidate improves to

```text
gamma_N << p_N^(-1/2)(log p_N)^(5/2).
```

This route uses a new analytic input and is not a PNT-only proof.  The input is:

M. Z. Garaev, *Estimation of Kloosterman Sums with Primes and Its Application*,
Math. Notes 88 (2010), 330--337, DOI `10.1134/S0001434610090051`.

In the notation below, Garaev proves uniformly for prime modulus `r`, `N<r`, and
`a!=0 mod r`,

```text
|sum_(s<=N, s prime) e_r(a s^(-1))|
 <=(N^(15/16)+N^(2/3)r^(1/4)) r^(o(1)).
```

No claim is made that this external theorem belongs to the released Erdős 306
trust boundary.

## 2. Uniform constant inverse energy from Garaev's estimate

Let `r` be prime, fix

```text
3/4<kappa<1,
```

and let `N` satisfy

```text
r^(kappa+o(1))<=N<r.
```

Fix constants `0<c_1<c_2<1` and put

```text
S(r,N)={s prime:c_1 N<s<=c_2 N}.
```

For `d!=0 mod r`, define

```text
E_(r,N)(d)=sum_(s in S(r,N)) ||d s^(-1)/r||^2.
```

### Proposition 2.1 — constant prime-inverse population energy

Uniformly for every `d!=0 mod r`,

```text
E_(r,N)(d)=(1/12+o(1)) |S(r,N)|.
```

The `o(1)` is uniform when `kappa` stays in a compact subinterval of `(3/4,1)`.
In particular, eventually

```text
E_(r,N)(d)>=c_K |S(r,N)|
```

for an absolute `c_K>0` depending only on the fixed interval constants and the
compact `kappa` range.

### Proof

Use the absolutely convergent Fourier series

```text
||x||^2
 =1/12+sum_(h>=1) (-1)^h/(pi^2 h^2) cos(2 pi h x).
```

For `1<=h<r`, the residue `hd` is nonzero modulo `r`.  Garaev's estimate, applied
at both endpoints and subtracted, gives uniformly in `h,d`

```text
|sum_(s in S(r,N)) e_r(hd s^(-1))|
 <=(N^(15/16)+N^(2/3)r^(1/4))r^(o(1)).
```

PNT gives

```text
|S(r,N)| asymp N/log N.
```

The first error divided by the population size is

```text
N^(-1/16) log N r^(o(1))=o(1),
```

and the second is

```text
r^(1/4)N^(-1/3)log N r^(o(1))=o(1)
```

precisely because `kappa>3/4` with fixed margin.  Summing the Fourier coefficients
for `h<r` costs only `sum h^(-2)<infinity`.  The tail `h>=r` is
`O(|S|/r)=o(|S|)`.  This proves the proposition.  `square`

### Remark 2.2

The constant `1/12` is not a heuristic.  It is the mean of `||x||^2` on the circle.
The theorem asserts uniform equidistribution at the level needed by the quadratic
energy, not merely average distribution over the multiplier `d`.

## 3. One common sample for a power band

Let row primes lie in a power band

```text
Z^a<=r<=Z^b,
```

and choose a sensor exponent `beta` satisfying

```text
kappa b<beta<a.
```

Take the actual-prime population

```text
B_beta={s prime:c_1 Z^beta<s<=c_2 Z^beta}.
```

For every row in the band, `Z^beta<r` and `Z^beta>r^kappa`, so Proposition 2.1
applies uniformly.

Choose uniformly without replacement a sample `S_beta subset B_beta` of size

```text
M=C log Z/q.
```

For one fixed test `(r,d)`, bounded-variable concentration and Proposition 2.1 give

```text
Pr(sum_(s in S_beta)||d s^(-1)/r||^2<cM)
 <=exp(-c'M).
```

There are fewer than `Z^2` tests over all prime rows and nonzero multipliers.
Taking `C` sufficiently large, with the constant also absorbing the small parameter
in the Bernoulli kernel, yields one deterministic sample satisfying

```text
min_(d!=0 mod r)
 sum_(s in S_beta)||d s^(-1)/r||^2
 >=C_1 log Z/q
```

simultaneously for all rows in the band.

Consequently, for `theta asymp q`, the weighted sibling factor obeys

```text
sum_(x!=x_r^*) weight(x)<=Z^(-K)
```

for any prescribed fixed `K`, after increasing `C`.

## 4. An explicit four-band cascade

Fix

```text
tau=1.9,
a_*=1/tau=0.526315...,
kappa=0.8.
```

The complete-pair mass interval is

```text
P={p prime:Z^a_*<=p<=Z}.
```

Retain the top witness block

```text
G={r prime:Z/2<r<=Z}.
```

Partition the remaining prime coordinates into four power bands and use the
following sensor exponents:

| band of row exponents | sensor exponent |
|---|---:|
| `[0.90,1]` (below the fixed-ratio top witness endpoint) | `0.85` |
| `[0.75,0.90]` | `0.735` |
| `[0.63,0.75]` | `0.615` |
| `[a_*,0.63]` | `0.520` |

At each line,

```text
0.8*(upper row exponent)<sensor exponent<lower row exponent.
```

Thus the sensor population lies below every row modulus in the band but above the
`r^0.8` threshold required by Proposition 2.1.

Let `S_j` be the deterministic sample supplied by Section 3 and put

```text
S_tot=union_j S_j.
```

The number of bands is fixed, so

```text
|S_tot|=O(log Z/q),
log product_(s in S_tot)s=O((log Z)^2/q).
```

The final sensor population at exponent `0.520` is large enough at the proposed
floor: if

```text
q>=C Z^(-1/2)(log Z)^(5/2),
```

then

```text
|S_j|<<Z^(1/2)/(log Z)^(3/2)
      =o(Z^0.520/log Z).
```

Hence sampling without replacement is feasible in every band.

The precise decimal exponents are not canonical.  They only exhibit one open
parameter region.  Any finite sequence with the same strict inequalities works.

## 5. Top witness synchronization of every scale core

Condition on the assignments on `S_tot`.  Use the selected sensor edges to decode
all prime coordinates outside `G union S_tot`, retaining every unused complete-pair
factor on the decoded skeleton.

The top witness block `G` is decoded from the first scale sample and retains its
complete internal pair energy.  Apply the decoder-defect expansion from
`SPARSE_ARITHMETIC_SYNCHRONIZATION_CLUSTER_EXPANSION_V1.md`.

The robust exact-cold theorem on `G` gives the deterministic floor

```text
F_top asymp Z/(log Z)^3.
```

Every defect of a sample coordinate `s in S_tot` relative to the top witness label
is amplified by `G`.  Indeed, the multiplicity of one residue among top primes
modulo `s` is `O(Z/s)`.  The multiplicity-sensitive packing theorem gives

```text
sum_(r in G)||d r^(-1)/s||^2
 >> |G|^3/((Z/s)^2 s^2)
 >> Z/(log Z)^3.
```

The harmless top-label term is uniformly smaller than the dispersion threshold.
At the exact-cold cutoff the label has size

```text
|m|<<Z^(3/2)/(log Z)^(1/2),
```

whereas every top--sample denominator has size at least

```text
Z*Z^0.520=Z^1.520.
```

Thus all scale samples are forced to the same short integer label by the one top
witness block.  No separate exact-cold theorem is needed at the lower scales.

## 6. Entropy--witness balance

The total explicit core entropy is

```text
H_core=O((log Z)^2/q).
```

The small-parameter kernel supplies weighted witness damping

```text
qF_top >> qZ/(log Z)^3.
```

Therefore the off-diagonal synchronized partition is negligible provided

```text
qZ/(log Z)^3 >> (log Z)^2/q,
```

that is,

```text
boxed: q^2Z>>(log Z)^5.
```

This yields the candidate floor

```text
boxed: q>>Z^(-1/2)(log Z)^(5/2).
```

Large decoder-defect sets are still killed by the product of row sibling factors;
small defect sets retain the top witness floor.  The normalization argument is
unchanged except that the quotient now consists of a fixed number of
Kloosterman-sampled scale cores.

## 7. Reciprocal and square-load ledger

The complete-pair family on `[Z^a_*,Z]` has limiting load

```text
lambda_tau=(log tau)^2/2=0.205...,
```

which exceeds Li's central threshold `0.181...` and is below one.

The sensor scaffold is selected from existing complete pairs whenever both endpoints
lie in `P`; the lowest sample lies just below `P` and is added sparsely.  For one
band,

```text
Lambda_sens,j
 <=(sum_(r in band)1/r)(sum_(s in S_j)1/s)
 <<(log Z/q)Z^(-beta_j).
```

At the proposed floor and `beta_j>1/2`, this is `o(1)`.  Summing the fixed number of
bands remains `o(1)`, so total reciprocal load stays below one.

For the inverse-square load,

```text
W2_sens,j
 <<q^(-1) Z^(-a_j-2beta_j),
```

where `a_j` is the lower row exponent of the band.  The complete-pair baseline is

```text
W2_pair asymp Z^(-2a_*)/(log Z)^2.
```

The tightest line is the last band.  Its parameters satisfy

```text
2*0.520>a_*+1/2.
```

Hence every sensor square load is `o(W2_pair)` at the proposed floor.

## 8. Full top row for the outer-label and variance lanes

Do not sample the `r=2` reciprocal-label family.  Use all denominators

```text
E_2={2s:s prime,Z/2<s<=Z}.
```

Its reciprocal load is `O(1/log Z)`, while

```text
W2(E_2) asymp1/(Z log Z).
```

This family performs two tasks.

1. The full-range reciprocal-label population theorem suppresses both residues of
   the `r=2` coordinate for

   ```text
   Z/log Z<=|m|<=cZ^2/log Z.
   ```

   The weighted exponent is `qZ/(log Z)^3`, more than sufficient at the new floor.

2. It supplies the leading variance scale

   ```text
   V asymp q/(Z log Z).
   ```

   Therefore the positive major width is

   ```text
   V^(-1/2)
    asymp sqrt(Z log Z/q)
    =Z^(3/4)(log Z)^(-3/4)
   ```

   at the lowest target, which is `o(Z/log Z)`.

Every row decoder is therefore exactly the common integer residue throughout the
major arc and the small-phase Gaussian tail.  Beyond `Z/log Z`, the full `r=2`
family suppresses the label without requiring lower-coordinate reconstruction.

## 9. Taylor and terminal Fourier checks

All complete-pair and scale-sensor denominators are at least `Z^(1+epsilon)` for a
fixed positive `epsilon`, except the full `2s` family, whose denominators are
`asymp Z`.  At the major width,

```text
V^(-1/2)/Z=Z^(-1/4)(log Z)^(-3/4)->0.
```

Thus the Taylor expansion is uniform.  Since `V=theta W2` and
`theta asymp q`, the aggregate cubic remainder on a fixed major window is bounded
by the maximum phase and tends to zero.

The terminal lanes are:

1. positive Gaussian main arc of width `C/sqrt(V)`;
2. full-variance Gaussian tail up to `Z/log Z`;
3. full-`r=2` reciprocal-label minor arc;
4. synchronized top labels beyond the chosen cutoff;
5. noncoherent top witness assignments and all decoder-defect sectors.

The top witness synchronization estimate controls lanes 4 and 5 after paying the
core entropy in Section 6.  These lanes are exhaustive.

## 10. Central band and exactness

With `tau=1.9`,

```text
lambda_tau=(log 1.9)^2/2>0.181... .
```

Choose one fixed `q_*` strictly between Li's central threshold and `lambda_tau`.
The lower-band realization therefore overlaps the known central band.

The complete-pair load, full `r=2` load, and all sensor loads sum to a quantity
strictly below one.  Hence every subset sum lies in `[0,1)`, and modular Fourier
positivity implies exact equality by no-wrap.

The same all-prefix setup is available at every `Z=p_N`; no dyadic recurrence is
needed for the lower-band theorem.  The previously recorded Li bridge then gives
the full gap-free-floor consequence.

### Theorem 10.1 — Kloosterman multis-scale GFF candidate

Assuming the cited Garaev prime-inverse exponential-sum theorem and the existing
argument-level robust exact-cold/decoder-defect providers, for all sufficiently
large `N`,

```text
boxed:
gamma_N<<p_N^(-1/2)(log p_N)^(5/2).
```

## 11. Comparison with the preceding square-root route

The power `1/2` is unchanged.  The improvement is

```text
(log Z)^(7/2)  ->  (log Z)^(5/2).
```

Mechanism:

```text
elementary all-scale top population mean 1/(log Z)^2
 -> Kloosterman scale-local population mean 1;
common top core size (log Z)^3/q
 -> fixed-depth multiscale core size log Z/q;
core entropy (log Z)^4/q
 -> core entropy (log Z)^2/q.
```

This exactly realizes the `b=0` case of the conditional method-class balance

```text
q^2Z>>(log Z)^(a+b+2)
```

with witness exponent `a=3`.

## 12. Assurance boundary and next frontier

PDL or an independent auditor must verify:

1. the exact form and uniformity of Garaev's theorem consumed in Proposition 2.1;
2. Fourier-series truncation and interval subtraction;
3. simultaneous sampling in every power band;
4. the four-band incidence and endpoint conventions;
5. top-witness amplification for every lower-scale core prime;
6. reciprocal and square-load calculations, especially the last band;
7. the full `r=2` variance and outer-label integration;
8. the complete small-`theta` defect expansion and terminal Fourier ledger;
9. the corrected Li central-band bridge.

A failure of any mathematical implication returns as one exact `BLOCKED-FRONTIER`.

The exact next research questions are:

```text
Can the top exact-cold floor Z/(log Z)^3 be improved?
Can the explicit core enumeration be replaced non-enumeratively?
Can complex cycle-mode cancellation cross the power 1/2 barrier?
```

No proof-development, review, manuscript, Curator, Lean, release, DOI, arXiv, or
canonical status changes through this research candidate.
