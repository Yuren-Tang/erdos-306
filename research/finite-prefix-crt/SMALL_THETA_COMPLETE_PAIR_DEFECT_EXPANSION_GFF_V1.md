# Small-parameter complete-pair defect expansion and a square-root GFF candidate

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-STCP-01`  
**Status:** `ARGUMENT / MATERIAL FULL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-23

## 1. Main conclusion

The sparse arithmetic synchronization theorem from

`paper-first-one-anchor/SPARSE_ARITHMETIC_SYNCHRONIZATION_CLUSTER_EXPANSION_V1.md`

has a stronger consequence when the Bernoulli parameter is allowed to tend to
zero with the target.  Use the entire complete-pair family on one fixed power
interval as both reciprocal mass and witness rigidity, and use one target-adaptive
actual-prime core for all CRT and outer-label tests.

The natural balance is

```text
q * Z/(log Z)^3
 >> (log Z)^4/q,
```

or

```text
q^2 Z >> (log Z)^7.
```

This gives the candidate finite-prefix floor

```text
q_0(Z)=C Z^(-1/2)(log Z)^(7/2).
```

Consequently the argument-level GFF rate improves from

```text
Z^(-1/4)(log Z)^(5/4)
```

to

```text
Z^(-1/2)(log Z)^(7/2).
```

No sparse-Gibbs anchor or moving fingerprint-entropy coefficient is used.

## 2. Fixed power interval and complete-pair load

Let

```text
Z=p_N,
4/3<tau<2,
Y=Z^(1/tau),
P={p prime:Y<=p<=Z}.
```

For definiteness one may take `tau=3/2`, so `Y=Z^(2/3)`.

Let

```text
E_pair={pq:p,q in P,p<q}.
```

By PNT and Abel summation,

```text
sum_(p in P)1/p=log tau+o(1),
```

and therefore

```text
Lambda_pair
 =sum_(p<q)1/(pq)
 ->lambda_tau=(log tau)^2/2.
```

Fix constants

```text
0<lambda_-<lambda_tau<lambda_+<1.
```

The reciprocal-square and reciprocal-cube sums satisfy

```text
W2_pair=sum_(p<q)1/(p^2q^2)
asymp 1/(Y^2(log Y)^2),
```

```text
W3_pair=sum_(p<q)1/(p^3q^3)
asymp 1/(Y^4(log Y)^2).
```

Since `tau<2`,

```text
Y^2>Z.
```

Thus every complete-pair denominator already lies above the prime-prefix alias
scale.

## 3. Prefix Fourier target

Let

```text
Pi(Z)=product_(p<=Z)p,
q=t/Pi(Z)
```

be a grid target.  Fix a small constant `q_*<lambda_-/4` and consider

```text
q_0(Z)<=q<=q_*.
```

After adding the sparse sensor family below, let

```text
Lambda=sum_(e in E)1/e=lambda_tau+o(1)
```

and set

```text
theta=q/Lambda.
```

Then

```text
theta asymp_tau q,
0<theta<=theta_*<1,
theta Lambda=q.
```

The Bernoulli kernel satisfies

```text
|1-theta+theta e(u)|
 <=exp(-kappa theta ||u||^2)
```

with an absolute `kappa>0` for `theta<=theta_*`.

## 4. Target-adaptive sparse top core

Put

```text
B={s prime:Z/2<s<=Z}.
```

The full-top population estimates give, uniformly for every prime `r<Z` and every
nonzero `d mod r`,

```text
sum_(s in B,s!=r)||d s^(-1)/r||^2
 >>Z/(log Z)^3.
```

The reciprocal-label interval argument also gives, uniformly for

```text
Z/log Z<=|m|<=c Z^2/log Z,
x in {0,1},
```

```text
(1/|B|)sum_(s in B)
 ||m/(2s)+x/2||^2
 >>1/(log Z)^2.
```

Choose every `s in B` with probability

```text
rho=C (log Z)^4/(qZ).
```

For `q>=q_0(Z)`, one has `rho=o(1)`.  A Chernoff/union-bound argument over fewer
than `Z^2` row and label tests yields one deterministic set

```text
S subset B,
|S|<=C (log Z)^3/q,
```

such that simultaneously

```text
D_r(S)
 :=min_(d!=0 mod r)
   sum_(s in S,s!=r)||d s^(-1)/r||^2
 >=A log Z/q
```

for every prime `r<Z`, and

```text
sum_(s in S)||m/(2s)+x/2||^2
 >=A log Z/q
```

for every outer label in the displayed range and both `x=0,1`.

The constant `A` is chosen so large that

```text
Z exp(-kappa theta D_r(S)/4)<=Z^(-K)
```

for a fixed large `K`.

## 5. Lower-coordinate sensor family

The complete-pair family already contains all sensor edges `rs` with `r in P\S`
and `s in S`.  Add only the missing lower-prime edges

```text
E_low={rs:r<Y prime,s in S}.
```

All these denominators satisfy

```text
rs>=2*(Z/2)=Z.
```

Their reciprocal load is

```text
Lambda_low
 <=(sum_(r<Y)1/r)(sum_(s in S)1/s)
 <<(log log Z)(log Z)^3/(qZ)
 =o(1)
```

uniformly for `q>=q_0(Z)`.

Their square and cube loads are

```text
W2_low<<|S|/Z^2<<(log Z)^3/(qZ^2),
W3_low<<|S|/Z^3<<(log Z)^3/(qZ^3).
```

For every fixed `tau>4/3`, at the threshold `q_0(Z)` these are lower order than
the complete-pair variance and are harmless in the Taylor remainder.

Set

```text
E=E_pair disjoint-union E_low.
```

Then

```text
Lambda=lambda_tau+o(1)<1.
```

## 6. Small-theta sparse synchronization

Let `R=B\S`.  Apply the decoder-defect expansion to the `S x R` row kernels and
retain all complete-pair factors on `R\U`.

The row sibling factor is

```text
delta<=Z^(-K).
```

For `|U|<=|R|/2`, the retained witness block has positive top-block density.
The deterministic robust exact-cold theorem has unweighted forcing floor

```text
F_sync=c Z/(log Z)^3.
```

The kernel exponent is now `asymp q`, so every off-diagonal small-defect term pays

```text
exp(-c q Z/(log Z)^3).
```

The sparse-core entropy is

```text
log product_(s in S)s
 <=|S|log Z
 <<(log Z)^4/q.
```

Therefore the small-defect off-diagonal sector is negligible whenever

```text
q Z/(log Z)^3
 >> (log Z)^4/q,
```

i.e.

```text
q^2Z>> (log Z)^7.
```

Large defect sets are killed by

```text
delta^|U|=exp(-Omega(KZ)).
```

### Theorem 6.1 — moving sparse synchronization

For

```text
q>=C Z^(-1/2)(log Z)^(7/2),
```

the entire top-coordinate Fourier partition outside one short integer diagonal is

```text
exp(-Omega(qZ/(log Z)^3)).
```

The synchronized top diagonal has partition scale

```text
O(Z log Z/sqrt(q)).
```

This theorem replaces the moving sparse-Gibbs/fingerprint-entropy anchor.

## 7. Elimination of all remaining prime coordinates

Condition on the synchronized top assignment.  The same set `S` gives every lower
prime row effective kernel distance

```text
theta D_r(S)>>log Z.
```

Hence all prime coordinates below `Z/2`, including those below `Y`, compress with
summed sibling factor `Z^(-K+O(1))`.  Multiplication by the polynomial synchronized
top partition remains negligible.

For a coherent integer label `m`, the expected lower residue `m mod r` has
unweighted sensor energy

```text
E_r(m)
 <<m^2|S|/(r^2Z^2).
```

For small primes the row distance is actually `>>|S|/r^2`; for primes in the power
interval it is `>>|S|/(log Z)^2`.  Consequently every lower coordinate decodes to
`m` uniformly throughout

```text
|m|<Z/log Z.
```

Beyond this range exact decoding is unnecessary because the `r=2` row directly
suppresses both possible residues by the reciprocal-label test.

## 8. Variance and the major arc

The total variance is

```text
V=theta(1-theta)sum_(e in E)1/e^2
 asymp_tau q/(Y^2(log Y)^2).
```

At the threshold,

```text
V^(-1/2)
 asymp Y log Y/sqrt(q).
```

The condition `tau>4/3` is exactly what gives

```text
V^(-1/2)=o(Z/log Z)
```

uniformly for `q>=q_0(Z)`.

For `|z|` small and `theta<=theta_*`,

```text
log(1-theta+theta e(z))
 =2pi i theta z
  -2pi^2theta(1-theta)z^2
  +O(theta|z|^3).
```

The complete-pair cubic ratio is

```text
W3_pair/(sqrt(theta) W2_pair^(3/2))
 <<log Y/(Y sqrt(q))=o(1).
```

The lower-sensor cubic contribution at the main width is also `o(1)` for every
fixed `tau>4/3`.

Since

```text
theta sum_(e in E)1/e=q,
```

the linear phase cancels exactly.  Thus, for fixed large `C_0`,

```text
Re sum_(|m|<=C_0/sqrt(V))F(m)
 >=c/sqrt(V).
```

## 9. Complete Fourier lanes

The synchronized integer labels are divided as follows.

### Lane A — positive Gaussian main arc

```text
|m|<=C_0/sqrt(V).
```

This contributes `>>1/sqrt(V)`.

### Lane B — full-frequency Gaussian tail

```text
C_0/sqrt(V)<|m|<Z/log Z.
```

All prime coordinates decode to the genuine integer frequency `m`, and

```text
|F(m)|<=exp(-cVm^2).
```

Choose `C_0` so the lane is a small fraction of the major contribution.

### Lane C — reciprocal-label outer sector

```text
Z/log Z<=|m|<=M_sync,
```

where one may take

```text
M_sync<<Z^(3/2)/(log Z)^(1/2)
```

from the robust exact-cold label bound.  The row `r=2` and the simultaneous core
sample give

```text
sum_(x mod 2) product_(s in S)|K_(2s)(m,x)|
 <=Z^(-K).
```

Thus this entire lane is negligible after the polynomial diagonal partition is
included.

### Lane D — large synchronized labels

For `|m|>M_sync`, the unweighted top witness energy is at least
`cZ/(log Z)^3`; hence the weighted contribution has factor

```text
exp(-c qZ/(log Z)^3).
```

Its Gaussian prefactor is dominated by the synchronization margin.

### Lane E — off-diagonal and nondecoder sectors

These are controlled by Theorem 6.1 and the lower-row fibre factors.

The five lanes are disjoint and exhaustive.

## 10. Alias removal and exact subset sums

Every denominator in `E` is at least `Z`, and

```text
Lambda<lambda_+<1.
```

Hence

```text
W2(E)<=Lambda/Z.
```

Hoeffding gives

```text
Pr(|T-q|>=1)<=2exp(-2Z/Lambda).
```

Because `2/Lambda>1` and

```text
log Pi(Z)=Z+o(Z),
```

the alias probability is negligible relative to the positive Fourier main term
divided by `Pi(Z)`.  Therefore some subset `A subset E` satisfies

```text
sum_(e in A)1/e=q
```

exactly.

## 11. Finite-prefix theorem candidate

### Theorem 11.1 — lower-band realization

Fix `tau in (4/3,2)` and a sufficiently small constant `q_*>0`.  For all
sufficiently large prime prefixes `Z=p_N`, every grid target

```text
q=t/Pi(Z)
in[C Z^(-1/2)(log Z)^(7/2),q_*]
```

has an exact representation as a sum of reciprocals of distinct squarefree
semiprimes `pq` whose prime factors are at most `Z`.

Using the same central-band overlap/complement input as the preceding GFF route,
this yields the candidate bound

```text
boxed:
gamma_N<<p_N^(-1/2)(log p_N)^(7/2).
```

## 12. Why the exponent changes from 1/4 to 1/2

The sparse-Gibbs route paid a moving full-block entropy coefficient before the
small target parameter was introduced.  The defect-expansion route instead uses a
core whose size adapts to the weak kernel:

```text
core size M~(log Z)^3/q,
core entropy ~ (log Z)^4/q,
witness damping ~qZ/(log Z)^3.
```

Balancing entropy and damping gives

```text
q~Z^(-1/2)(log Z)^(7/2).
```

The exponent `1/2` is therefore the natural current barrier for this
sampled-core/complete-witness architecture.  Improving it requires at least one of:

1. a sensor population mean better than `1/(log Z)^2` at top-scale moduli;
2. a synchronization proof whose entropy cost is sublinear in `|S|log Z`;
3. a weighted or multiscale core with more energy per reciprocal load;
4. cancellation beyond absolute Gibbs partition estimates.

## 13. Assurance boundary

This is a full argument-level theorem candidate, not an accepted theorem.
Proof-development must verify:

1. the target-dependent sampling quantifiers and the generalized outer-label
   interval count up to `M_sync`;
2. the small-`theta` decoder-defect expansion with exact kernel constants;
3. the robust exact-cold witness theorem after deleting the defect set;
4. the lower-sensor load, variance, and cubic-remainder comparisons uniformly in
   `q`;
5. the five-lane Fourier partition and alias comparison;
6. the exact bridge to Li's central-band definition of `gamma_N`.

Only a failed mathematical implication returns to RL.

Current classification:

```text
SQUARE-ROOT GFF RATE — MATERIAL FULL THEOREM CANDIDATE
SPARSE-GIBBS 1/4 RATE — QUANTITATIVELY SUPERSEDED IF THIS ROUTE SURVIVES
NOT INDEPENDENTLY REVIEWED
RELEASED ERDOS 306 STATUS UNCHANGED.
```
