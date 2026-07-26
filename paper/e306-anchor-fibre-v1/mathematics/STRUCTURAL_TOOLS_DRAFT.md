# Structural tools for the E306 article

**Status:** mathematical draft for `E306-PAPER-01-M1`; not yet independently repair-verified.

This file records the repaired theorem statements and complete deterministic proofs which will organize the article. It deliberately separates:

- genuine general structure;
- the final assembly inequality;
- application-specific arithmetic providers;
- quotient positivity from ambient exact equality.

## 1. Complete-family collision theorem

Let `I` be a finite set and let `u_i>=0` for `i in I`. Put

```text
U=sum_(i in I)u_i,
V=sum_(i in I)u_i^2.
```

For an integer `k>=0`, write

```text
e_k(u)=sum_(J subset I, |J|=k) product_(j in J)u_j,
```

with the usual conventions `e_0=1` and `e_k=0` when `k>|I|`.

### Theorem 1.1 — collision bound

For every integer `k>=2`,

```text
0 <= U^k/k! - e_k(u)
   <= U^(k-2)V / (2(k-2)!).
```

#### Proof

Expand

```text
U^k=sum_((i_1,...,i_k) in I^k) product_(a=1)^k u_(i_a).
```

The contribution of ordered tuples with pairwise distinct coordinates is exactly

```text
k! e_k(u).
```

Hence `U^k-k!e_k(u)` is the total weight of ordered tuples having at least one collision. It is nonnegative.

For every pair of positions `1<=a<b<=k`, the total weight of tuples satisfying `i_a=i_b` is

```text
V U^(k-2).
```

The union bound over the `binom(k,2)` pairs gives

```text
U^k-k!e_k(u)
 <=binom(k,2)VU^(k-2).
```

Division by `k!` proves the claim. `square`

### Corollary 1.2 — relative form

If `U>0`, then

```text
1-binom(k,2)V/U^2
 <= k!e_k(u)/U^k
 <=1.
```

If `U=0`, then every `u_i=0`, so both `U^k` and `e_k(u)` vanish for `k>=1`.

### Corollary 1.3 — fixed and moving uniformity

For a sequence of weighted families:

1. for fixed `k`, if `V/U^2 -> 0`, then
   ```text
   e_k(u)=U^k/k! (1+o(1));
   ```
2. for a moving integer `k=k_n`, if
   ```text
   k^2 V/U^2 -> 0,
   ```
   then the same asymptotic holds uniformly along that sequence.

The condition is the natural collision-free regime detected by the first two power sums.

### Corollary 1.4 — pair identity

For `k=2`, the exact identity is

```text
e_2(u)=(U^2-V)/2.
```

This is the only complete-family identity needed for the dense E306 denominator family. The higher-uniformity statement is adjacent general structure, not a rigidity theorem.

---

## 2. Weighted product-fibre compression

Let `Y` be finite and let `R` be a finite, possibly empty, coordinate set. For every `r in R`, let `X_r` be finite and nonempty, and put

```text
X=product_(r in R)X_r.
```

For every `y in Y`, suppose that:

- `W_y>=0`;
- `a_(r,y):X_r->[0,infinity)`;
- a decoder `d_r(y) in X_r` has been chosen;
- `H_y:X->C` satisfies `|H_y(x)|<=1`.

Define

```text
F(y,x)=W_y product_(r in R)a_(r,y)(x_r) H_y(x),
```

and

```text
alpha_(r,y)=a_(r,y)(d_r(y)),
beta_(r,y)=sum_(x_r != d_r(y))a_(r,y)(x_r),
d(y)=(d_r(y))_(r in R).
```

Empty products equal `1`.

### Theorem 2.1 — exact weighted product-fibre compression

One has

```text
sum_(y in Y)sum_(x in X)F(y,x)
 =sum_(y in Y)F(y,d(y))+E_fib,
```

where

```text
|E_fib|
 <=sum_(y in Y)W_y {
     product_(r in R)(alpha_(r,y)+beta_(r,y))
     -product_(r in R)alpha_(r,y)
   }.
```

The bound is sharp among deterministic bounds which use only the displayed values `W_y`, `alpha_(r,y)` and `beta_(r,y)`.

#### Proof

Fix `y`. Separate the decoder tuple `d(y)` from all other tuples. Since `|H_y(x)|<=1`,

```text
|sum_(x!=d(y))F(y,x)|
 <=W_y sum_(x!=d(y))product_r a_(r,y)(x_r).
```

The full pure product sum factorizes exactly:

```text
sum_(x in X)product_r a_(r,y)(x_r)
 =product_r sum_(x_r in X_r)a_(r,y)(x_r)
 =product_r(alpha_(r,y)+beta_(r,y)).
```

The pure product weight of the decoder tuple is `product_r alpha_(r,y)`. Therefore the off-decoder product mass is exactly their difference. Sum over `y` and apply the triangle inequality to the complex off-decoder remainder.

For sharpness, choose all off-decoder values of `H_y` to have one common unit phase. The complex off-decoder remainder then attains the entire off-decoder product mass. `square`

### Boundary cases

1. If `W_y=0`, that anchor contributes zero.
2. If some `alpha_(r,y)=0`, Theorem 2.1 remains valid; no normalization by `alpha_(r,y)` is permitted.
3. If `R` is empty, `X` is a singleton and `E_fib=0`.
4. Decoder uniqueness is not assumed. Any other minimizer or maximizer remains in `beta` and is charged as off-decoder mass.
5. Complex row kernels are handled by placing their magnitudes in `a_(r,y)` and all phases in `H_y`.
6. Every factor not assigned to a row remains in `H_y`; its value on the decoded skeleton is not discarded.

### Corollary 2.2 — normalized anchor-dependent average

Assume every `alpha_(r,y)>0`, and define

```text
epsilon_(r,y)=beta_(r,y)/alpha_(r,y),
A_y=W_y product_r alpha_(r,y),
Delta_y=sum_r epsilon_(r,y).
```

Then

```text
|E_fib|
 <=sum_y A_y {product_r(1+epsilon_(r,y))-1}
 <=sum_y A_y(exp(Delta_y)-1).
```

This is an anchor-dependent weighted average. It is stronger than replacing every `Delta_y` by one worst-anchor bound.

The phrase “conditional row errors” is not used: no sequential conditional kernel is asserted.

---

## 3. Finite-group syndrome separation

Let `H` be a finite abelian group. Let `J` be a finite sensor set and let

```text
psi_j in Hom(H,R/Z),  j in J.
```

For `t in R/Z`, let `||t||` denote its distance to `0`.

When `H` is nontrivial, define

```text
delta^2=min_(0!=h in H)sum_(j in J)||psi_j(h)||^2.
```

For shifts `a_j in R/Z`, put

```text
E_a(h)=sum_(j in J)||a_j+psi_j(h)||^2.
```

### Theorem 3.1 — nearest-syndrome separation

Assume `H` is nontrivial, and choose a minimizer `h_a` of `E_a`. Then for every `h!=h_a`,

```text
E_a(h)>=delta^2/4.
```

#### Proof

For every `j`, the circle metric and homomorphism property give

```text
||psi_j(h-h_a)||
 <=||a_j+psi_j(h)||+||a_j+psi_j(h_a)||.
```

After squaring and using `(u+v)^2<=2u^2+2v^2`,

```text
delta^2
 <=sum_j||psi_j(h-h_a)||^2
 <=2E_a(h)+2E_a(h_a).
```

Since `h_a` minimizes `E_a`, one has `E_a(h_a)<=E_a(h)`. Hence

```text
delta^2<=4E_a(h).
```

This proves the claim. `square`

### Corollary 3.2 — Gaussian-modulus decoder tail

Suppose kernels `K_j:R/Z->C` satisfy

```text
|K_j(t)|<=exp(-kappa||t||^2)
```

for some `kappa>0`. Then

```text
sum_(h!=h_a) product_j |K_j(a_j+psi_j(h))|
 <=(|H|-1)exp(-kappa delta^2/4).
```

### Proposition 3.3 — qualitative observability

The following are equivalent:

1. `delta>0`;
2. the syndrome map
   ```text
   Sigma:H->(R/Z)^J,
   Sigma(h)=(psi_j(h))_j
   ```
   is injective;
3. the common kernel `intersection_j ker psi_j` is trivial.

#### Proof

The equivalence of injectivity and trivial common kernel is immediate. Since `H` is finite, injectivity implies every nonzero syndrome has positive squared norm and the minimum is positive. Conversely, `delta=0` means that some nonzero `h` lies in every kernel. `square`

### Scope

- For one finite system, `delta>0` is qualitative injectivity.
- For a sequence of systems, an explicit scale-dependent lower bound for `delta` is the quantitative input.
- The theorem gives a sufficient absolute-value decoder estimate. It does not classify Fourier arguments which exploit cancellation inside fibres.
- Observability alone does not identify a preassigned decoder. An application must compare the candidate energy to the competing separation scale.
- If `H` is trivial, there is no hidden-coordinate obligation and no minimum over a nonzero set is defined.

### Coverage principle

In an application, every hidden quotient direction must be at least one of:

1. fixed by the anchor;
2. resolved by a decoded fibre in the lane under consideration;
3. detected by a retained residual factor which damps that lane.

Thus observability is a separate coverage obligation. Depending on the lane, it may enter row separation, decoder identification, or residual damping.

---

## 4. Decoded-skeleton positivity

Retain the notation of Theorem 2.1. Partition the anchor set into a major set and finitely many minor lanes:

```text
Y=Y_maj disjoint-union Y_1 disjoint-union ... disjoint-union Y_s.
```

No abstract distinction between `mid`, `out`, or `energetic` is imposed.

### Proposition 4.1 — exact deterministic positivity interface

One has

```text
Re sum_(y,x)F(y,x)
 >= Re sum_(y in Y_maj)F(y,d(y))
    -sum_(j=1)^s |sum_(y in Y_j)F(y,d(y))|
    -E_prod,
```

where

```text
E_prod=
 sum_y W_y {
   product_r(alpha_(r,y)+beta_(r,y))
   -product_r alpha_(r,y)
 }.
```

Consequently the full sum has positive real part whenever

```text
Re sum_(y in Y_maj)F(y,d(y))
 >sum_j |sum_(y in Y_j)F(y,d(y))|+E_prod.
```

#### Proof

Theorem 2.1 gives

```text
sum_(y,x)F(y,x)=sum_yF(y,d(y))+E_fib,
|E_fib|<=E_prod.
```

Split the skeleton sum according to the displayed partition. Bound each minor-lane sum in absolute value and the fibre remainder by `E_prod`. `square`

### Asymptotic form

For a sequence of systems, let `M_n>0` for all sufficiently large `n`. If

```text
Re major_n >=c M_n
```

for some fixed `c>0`, while the sum of all minor-lane and product-fibre errors is `o(M_n)`, then the full sum has positive real part for all sufficiently large `n`.

### Labels and providers

A coherent label map is optional in Proposition 4.1. It is introduced only when it improves the estimation of the skeleton lanes.

Provider obligations must be verified separately, but one underlying application theorem may discharge more than one obligation on disjoint lanes. In particular, an anchor theorem may provide both a weighted partition and a large-label tail without double-counting.

### Quotient coefficient and exact ambient equality

Proposition 4.1 proves positivity of the finite Fourier sum to which it is applied. If that sum is the numerator of a finite-group coefficient, positivity gives a realized quotient target.

Ambient exact equality is a subsequent step. For a homomorphism `pi:M->A`, quotient realization can be upgraded by, for example:

1. injectivity of `pi` on the support and target;
2. support and target lying in one fundamental domain for `ker pi`;
3. the measurable alias inequality
   ```text
   Pr(pi(T)=pi(t))
    >Pr(T in (t+ker pi) setminus {t}).
   ```

The third formulation makes no countability assumption. A sum over aliases may be used only when the relevant fibre is discrete and countable.

In E306, only the fundamental-domain/no-wrap criterion is used, after Fourier positivity.

---

## 5. E306 adoption boundary

The article will use these tools as follows:

- Theorem 1.1 explains complete-family capacity; Corollary 1.4 supplies the exact pair mass.
- Theorem 2.1 is the load-bearing compression statement. E306 uses its unnormalized form.
- Theorem 3.1 describes hidden target-row separation, but decoder identification is proved only on the exact ranges required by each frequency lane.
- Proposition 4.1 assembles the positive major and the finite collection of E306 minor lanes.
- No-wrap is invoked only after quotient coefficient positivity.

The difficult E306 providers remain separate mathematical results:

- top-block reciprocal rigidity;
- zero-exception and fingerprint entropy;
- multiplicity-sensitive cyclic row separation;
- sector-dependent decoder identification;
- adaptive retained-pair damping;
- actual-family Taylor major and terminal parameter budget.

No theorem in this file is permitted to hide or assume those providers.
