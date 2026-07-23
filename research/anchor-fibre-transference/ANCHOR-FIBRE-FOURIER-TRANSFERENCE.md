# Anchor–fibre Fourier transference

**Workstream:** `E306-AFT-01`  
**Status:** `GENERAL TRANSFERENCE THEOREM / PROVED`  
**Dependence:** `WEIGHTED-DECODED-SKELETON-THEOREM.md`  
**Scope:** finite complex Fourier sums and exact finite-group subset-sum coefficients

## 1. The structural question

Many arithmetic Fourier arguments have the same hidden architecture:

1. a large frequency space is written as an anchor coordinate times many fibres;
2. each fibre is concentrated near a decoder depending on the anchor;
3. the decoded skeleton is organized by one coherent label;
4. a small major-label set contributes with positive real part;
5. residual factors damp intermediate and large labels;
6. a no-wrap or alias criterion turns a positive congruence coefficient into an
   exact equality.

The mechanism is independent of how the providers are proved.  Prime density,
Kloosterman sums, expander codes, deterministic packing, or a Gibbs theorem may
all supply the same interface.

## 2. Abstract finite Fourier sum

Let `Y` and `R` be finite, with finite nonempty coordinate sets `X_r`.  Put

```text
Omega=Y x product_(r in R)X_r.
```

Let `Phi:Omega->C`.  Suppose a decoder tuple `d(y)` is chosen for every anchor.
Write

```text
S(y)=Phi(y,d(y))
```

for the decoded-skeleton amplitude.

Assume the weighted decoded-skeleton theorem supplies a number `E_fib>=0` such
that

```text
sum_(y,x)Phi(y,x)=sum_y S(y)+E,
|E|<=E_fib.
```

Partition the anchor set as

```text
Y=Y_coh disjoint-union Y_eng.
```

On `Y_coh`, suppose there is a label map

```text
ell:Y_coh->L
```

into a finite or countable label set `L`, and define the aggregated skeleton
amplitude

```text
Psi(m)=sum_(y in Y_coh, ell(y)=m) S(y).
```

Only finitely many terms are nonzero.  Partition the labels as

```text
L=L_maj disjoint-union L_mid disjoint-union L_out.
```

The notation is structural: `mid` and `out` may themselves be unions of several
minor lanes.

## 3. Deterministic transference theorem

### Theorem 3.1 — anchor–fibre positivity

Assume the following bounds.

### Major provider

There is `M_maj>0` such that

```text
Re sum_(m in L_maj) Psi(m) >= M_maj.
```

### Coherent minor provider

There are `E_mid,E_out>=0` such that

```text
sum_(m in L_mid)|Psi(m)|<=E_mid,
sum_(m in L_out)|Psi(m)|<=E_out.
```

### Energetic-anchor provider

There is `E_eng>=0` such that

```text
sum_(y in Y_eng)|S(y)|<=E_eng.
```

### Strict budget

```text
M_maj>E_fib+E_mid+E_out+E_eng.
```

Then

```text
Re sum_(omega in Omega)Phi(omega)>0.
```

#### Proof

By decoded-skeleton compression,

```text
Re sum_Omega Phi
 >=Re sum_y S(y)-E_fib.
```

Split the skeleton into coherent and energetic anchors.  Aggregate coherent
anchors by their labels.  The major sum contributes at least `M_maj`; each
remaining sector costs at most its absolute bound.  Hence

```text
Re sum_Omega Phi
 >=M_maj-E_mid-E_out-E_eng-E_fib>0.
```

`square`

### Corollary 3.2 — asymptotic form

For a sequence of systems, suppose

```text
Re major_n >=c M_n
```

for fixed `c>0`, while

```text
E_fib,n+E_mid,n+E_out,n+E_eng,n=o(M_n).
```

Then the full Fourier sum has positive real part for all sufficiently large
`n`.

## 4. Provider hierarchy

The theorem separates six logically different inputs.

### P1. Anchor partition

The anchor provider gives a useful weighted partition scale and a coherent /
energetic decomposition.  It may be a Gibbs estimate, a level-set theorem, a
cluster expansion, or a direct finite computation.

### P2. Shift-uniform fibre decoding

For every relevant anchor, row kernels have chosen decoders and summable
nondecoder mass.  The exact tensorized expression, rather than a raw row count,
produces `E_fib`.

### P3. Uniform decoder identification

On the coherent anchor range, the chosen decoder tuple is identified with a
stated global label.  This must hold uniformly over the entire moving coherent
range used by the proof.

### P4. Residual skeleton damping

Factors not assigned to rows are retained on the decoded skeleton.  They supply
`E_mid` and `E_out`: Gaussian decay, arithmetic minor-arc damping, target
sensitivity, or another coherent-label estimate.

### P5. Positive major contribution

The complex phases on `L_maj` must be controlled, not merely their magnitudes.
A Taylor expansion with exact linear centering is one provider; any direct
positive-real estimate is allowed.

### P6. Exactness / alias removal

Theorem 3.1 proves positivity of a finite Fourier sum.  An application must
separately identify the coefficient and, if the finite group is a quotient of a
larger exact problem, exclude unwanted aliases.

No one provider silently supplies another.

## 5. Finite abelian group coefficient

Let `A` be a finite abelian group and `Ahat` its character group.  Let `T` be an
`A`-valued random variable and `t in A`.  Character orthogonality gives

```text
Pr(T=t)
 =1/|A| sum_(chi in Ahat) conjugate(chi(t)) E[chi(T)].
```

Suppose the numerator Fourier sum is placed in the anchor–fibre framework and
the hypotheses of Theorem 3.1 hold.  Then its real part is positive.  Since the
orthogonality expression equals the real nonnegative number `|A|Pr(T=t)`,

```text
Pr(T=t)>0.
```

Therefore at least one outcome realizes `t`.

### Corollary 5.1 — independent subset sums

Let `v_j in A` and let `xi_j` be independent Bernoulli variables with arbitrary
parameters in `[0,1]`.  Put

```text
T=sum_j xi_j v_j.
```

Then

```text
E[chi(T)]=product_j((1-theta_j)+theta_j chi(v_j)).
```

Any anchor–fibre factorization of the character group for which Theorem 3.1
closes proves existence of a subset whose sum is `t`.

The theorem does not require equal Bernoulli parameters.

## 6. Exact ambient equality and no-wrap

Often the finite group is a quotient.  Let `M` be an abelian group, let

```text
pi:M->A
```

be a homomorphism, and let `T_M` be an `M`-valued random variable.  Fourier
positivity on `A` proves

```text
Pr(pi(T_M)=pi(t_M))>0.
```

This implies the exact equality `T_M=t_M` under any one of the following
criteria.

### Injective support criterion

There is a set `C subset M` containing `t_M` and the support of `T_M` such that
`pi|_C` is injective.

### Fundamental-domain / no-wrap criterion

When `M` is ordered or embedded in a real vector space, the support and target
lie in one fundamental domain for `ker pi`.

### Quantitative alias criterion

The positive congruence probability exceeds the total probability of all
nonzero aliases:

```text
Pr(pi(T_M)=pi(t_M))
 >sum_(k in ker pi, k!=0)Pr(T_M=t_M+k).
```

Then `Pr(T_M=t_M)>0`.

The first two criteria are deterministic.  The third allows probabilistic alias
removal.

## 7. Target observability is part of P2/P3

If the target has a hidden finite coordinate, it must occur in the frequency
factorization.  Either:

- it is included among the decoded fibres;
- it is fixed by the anchor;
- or residual characters separate it on the skeleton.

A quotient coordinate which is never sensed can contribute an exact cancelling
character and invalidate positivity.  Thus target sensitivity is not an
optional arithmetic afterthought; it is an observability provider required
before Theorem 3.1 can be applied.

## 8. Averaged transference

The fibre error need not be uniform in the anchor.  In the notation of the
weighted decoded-skeleton theorem, one may take

```text
E_fib
 =sum_y A_y {product_r(1+epsilon_(r,y))-1}.
```

Likewise, energetic and coherent minor estimates may be weighted averages.  The
proof of Theorem 3.1 uses only their total numerical budgets.  This permits:

- exceptional anchors of small Gibbs mass;
- a small number of nonuniform rows;
- exact summation over a finite bad coordinate set;
- different decoder strengths in different anchor sectors.

## 9. Why this is a mechanism rather than a proof template

The theorem identifies an invariant implication:

```text
weighted product-fibre concentration
+ coherent skeleton identification
+ residual minor damping
+ positive major phase
+ exact alias control
=> positive exact Fourier coefficient.
```

Replacing one analytic estimate by another changes only a provider.  It does
not change the transference proof.  In particular, an elementary packing
bound, a prime-inverse exponential-sum theorem, or a spectral code estimate can
all serve P2 without altering P1 or P4--P6.

## 10. Honest limitations

The theorem does not provide:

- an anchor partition estimate;
- row-code separation;
- uniqueness or identification of decoders;
- coherent-label damping;
- a Taylor major arc;
- alias removal.

It says exactly how these providers combine and prevents hidden transfer errors.
It also does not create cancellation inside the absolute fibre estimate.  A
proof seeking cancellation among fibres needs a stronger, genuinely complex
provider.

## 11. Classification

```text
GENERAL FINITE FOURIER TRANSFERENCE THEOREM — PROVED
FINITE-ABELIAN SUBSET-SUM COROLLARY — PROVED
EXACT-ALIAS INTERFACES — STATED AND PROVED
ARITHMETIC PROVIDERS — SEPARATE OBLIGATIONS.
```
