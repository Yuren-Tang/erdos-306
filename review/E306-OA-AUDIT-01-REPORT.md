# E306-OA-AUDIT-01 — Independent One-Anchor Proof Audit Report

**Role:** Erdős 306 — Independent One-Anchor Proof Auditor  
**Controlling issue:** `Yuren-Tang/research-workbench#58`  
**Frozen candidate:** `review/e306-one-anchor-proof-audit-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`  
**Audited objects:** only the six `proof-development/ONE-ANCHOR-*` files named in issue #58  
**Audit type:** ordinary mathematical proof audit

## 1. Verdict

The candidate is mathematically complete as an ordinary proof. I found no false implication, unbounded missing case, hidden fibre multiplicity, unassigned denominator factor, or circular terminal choice.

```text
correctness: PASS
route classification: GENUINE STRICT SIMPLIFICATION
return: [PASS E306-OA-AUDIT-01]
```

This verdict is independent of Lean, v0.0.3, Research Lead assertions, self-audit, the prior multiblock pass, earlier manuscripts, and Curator material.

## 2. Arithmetic frame, complete-pair load, and full-top load

Write

```text
Z=X^3,
P={p prime:X<=p<Z},
B={q prime:Z/2<=q<Z},
S_b={r prime:r|b},
E_pair={pq:p,q in P,p<q},
E_b={rq:r in S_b,q in B}.
```

For large `X`, every prime divisor of the fixed squarefree `b` lies below `X`. Unique factorization therefore gives all of the following at once:

- every denominator is a product of two distinct primes;
- `E_pair` and `E_b` are disjoint;
- there are no repetitions within either family;
- every denominator divides `L=b product_(p in P)p`;
- choosing `X` beyond the finite forbidden set gives avoidance.

The PNT and Abel summation give

```text
S_X=sum_(p in P)1/p=log 3+o(1),
U_X=sum_(p in P)1/p^2=O(1/(X log X)).
```

Hence

```text
Lambda_pair=(S_X^2-U_X)/2 -> (log 3)^2/2.
```

The full-top auxiliary load is

```text
Lambda_b=(sum_(r|b)1/r)(sum_(q in B)1/q)=O_b(1/log Z)=o_b(1).
```

Thus fixed constants may be chosen with

```text
1/3<lambda_-<(log 3)^2/2<lambda_+<1,
Lambda in (lambda_-,lambda_+).
```

The common Bernoulli parameter

```text
theta=1/(b Lambda)
```

lies in a compact subinterval of `(0,1)` because `b>=3` and `lambda_->1/3`. The inverse-square load satisfies

```text
sum_(e in E)1/e^2 asymp 1/(X^2 log^2 X).
```

The lower bound comes from distinct pairs in `[X,2X)`, and the auxiliary square load is only `O_b(1/(Z log Z))`. Therefore

```text
sigma_E^2=theta(1-theta)sum_e1/e^2 asymp_b 1/(X^2 log^2 X),
1/sigma_E asymp_b X log X.
```

Finally `Lambda<1`, so the later congruence-to-equality step has genuine no-wrap room.

## 3. Repaired one-block theorem

### 3.1 Reciprocal dispersion

For `s>=16`, put `delta=s/(64Y)`. If

```text
||d p^(-1)/q||<=delta,
```

then a representative `v` satisfies `vp=d mod q` and `|v|<=s/16`. For each nonzero `v`, the interval `[Y,2Y)` contains at most two integers in the resulting residue class modulo `q`, since `q>=Y`. Fewer than `s/2` sensors are close, so at least `s/2` terms contribute at least `delta^2`. This yields

```text
sum_(p in F)||d p^(-1)/q||^2 >> s^3/Y^2.
```

### 3.2 Cross-label energy and nondominant forcing

The condition

```text
|C_m|>=max(16,128B_0/Y)
```

is sufficient for the subtraction of the `m/(pq)` term in the dispersion estimate. At most one prime in the opposite class divides `m'-m`; summing over the others gives the stated multiplicity-sensitive cross-label energy.

In the nondominant argument, the `R=0` case is correctly separated before defining a cutoff proportional to `sqrt(R)`. For `R>0`, the bad-degree average produces a base sensor with few bad neighbours. The remaining labels form at most `O(B_0/Y+1)` classes. The small-class case forces

```text
R >> N^3/Y^2 >> Y/log^3 Y.
```

In the substantial-class case, the exact identity

```text
sum_(j!=i)(n_j-1)=(S-n_i)-(t-1)
```

and the factor `1/2` for ordered-pair double counting are both present. The two size subcases again force the same lower scale. Choosing the fixed forcing constant below these bounds proves nondominant forcing.

### 3.3 Zero exceptions and fingerprint entropy

A dominant label controls its own energy and hence its magnitude. Every exceptional sensor then pays a disjoint cross-energy star of size `>>N^3/Y^2`; the resulting integer bound is strictly below one after the forcing constant is fixed. Thus there are no exceptions.

For fingerprint entropy, the chosen fingerprint size

```text
s=ceil(A(RY^2)^(1/4))
```

lies in `[16,N/2]` throughout the lower energy range. All but `O(RY^2/s^3)` vertices have at most one admissible residue. The logarithmic count is

```text
O((RY^2)^(1/4)log Y)=o(R)
```

uniformly from the forcing floor upward. Above the split point, the trivial total assignment count has logarithm `O(Y)=o(R)`. There is no uncovered energy interval.

## 4. Top partition

Applying the one-block theorem to `B` gives a forcing floor

```text
F_B asymp Z/log^3 Z.
```

Below it, each top assignment is exactly one integer label `m`; the label bound is `o(Z^2)`, so two distinct labels cannot agree modulo two distinct top primes. Moreover

```text
Q_B=m^2 sigma_B0^2,
sigma_B0^2 asymp 1/(Z^2 log^2 Z).
```

The low-energy weighted sum is therefore bounded by the complete Gaussian sum `O(1/sigma_B0)=O(Z log Z)`. Above the floor, uniform fingerprint entropy with exponent smaller than the Fourier damping exponent gives `O(exp(-cF_B))`. Consequently

```text
P_top=sum_(a_B)T_B(a_B)=O(Z log Z).
```

This is a weighted partition, not a raw count of top assignments.

## 5. Multiplicity-sensitive cyclic energy and row distance

Let `c_1,...,c_M` be nonzero residues modulo a prime `r`, with multiplicity at most `mu`. Necessarily

```text
M<=mu(r-1).
```

Thus, for `t=floor(M/(4mu))`, the large-`M/mu` hypothesis implies

```text
1<=M/(8mu)<=t<r/4.
```

Fewer than `2mu t<=M/2` terms can lie at circle distance below `t/r`; at least `M/2` terms have distance at least `M/(8mu r)`. Hence

```text
sum_j||dc_j/r||^2 >> M^3/(mu^2r^2).
```

For `r in P\B`, one inverse residue is assumed by at most

```text
mu_r<=Z/(2r)+1=O(Z/r)
```

top primes. Since `M=|B|asymp Z/log Z` and `M/mu_r>>r/log Z`, the largeness hypothesis is uniform down to `r=X`, and

```text
D_r>>Z/log^3 Z.
```

For each fixed prime `r|b`, no PNT in progressions is needed: every nonzero `dq^(-1) mod r` has circle distance at least `1/r`, so

```text
D_r>=|B|/r^2>>_b Z/log Z.
```

## 6. Row tails, denominator partition, and retained skeleton

For any top assignment, row-code differences are independent of the top shift. If `x_r^*` minimizes the row phase energy, then for `x!=x_r^*`

```text
D_r<=2E_r(x)+2E_r(x_r^*)<=4E_r(x).
```

Therefore

```text
delta_r=sum_(x!=x_r^*)A_r(x)<=r exp(-c_bD_r),
Delta=sum_r delta_r<=Z^2 exp(-cZ/log^3 Z).
```

The denominator-factor partition is exact:

```text
B-B                 -> T_B,
(P\B)-B             -> lower-prime row kernels,
S_b-B               -> b-row kernels,
(P\B)-(P\B)         -> retained residual G.
```

No factor is omitted or reused. After absolute values, `0<=G<=1`. Separating the single decoder tuple and factoring the pure row product gives

```text
sum_(x_R) product_r A_r(x_r)G(x_R)
 <= product_rA_r(x_r^*)G(x^*)
    +product_r(A_r(x_r^*)+delta_r)-product_rA_r(x_r^*).
```

The difference is monotone in each `A_r(x_r^*) in [0,1]`, so it is at most

```text
product_r(1+delta_r)-1<=exp(Delta)-1.
```

The empty and singleton row cases obey the same formula under the empty-product convention. Summing over top assignments multiplies this error by the weighted top partition and gives exactly

```text
P_top(exp(Delta)-1)=O(Z log Z * Delta)=o(1).
```

No exponential coordinate-count factor survives.

## 7. Decoder identification and observability

For a coherent top label `m`, the candidate row residue `m mod r` has energy

```text
E_r(m)<=m^2W_B/r^2,
W_B=O(1/(Z log Z)).
```

If this is below `D_r/8`, the cyclic distance inequality makes it the unique energy minimizer.

For every `r in P\B`, at

```text
M_dec=XZ/(log Z)^2
```

the worst candidate energy occurs at `r=X` and is `O(Z/log^5 Z)=o(D_r)`. Thus all prime coordinates in `P` decode to `m` for `|m|<=M_dec`.

For fixed `r|b` and `|m|<=X^2/4`, the candidate energy is `O_b(X/log X)`, whereas `D_r>>_bX^3/log X`. Hence every prime coordinate of `b` also decodes. Since `b` is squarefree, agreement at all its prime coordinates is agreement modulo `b`. This proves target-coordinate observability and identifies the true frequency `h=m mod L` throughout the major and full-variance Gaussian ranges.

## 8. Adaptive retained-skeleton damping

For

```text
X^2/4<|m|<=M_dec,
```

put `y=sqrt(|m|)`. Then

```text
2y>X,
3y<=3sqrt(XZ)/log Z=3X^2/log Z<Z/2
```

for large `X`; hence `[2y,3y]` lies in `P\B`. Tail-uniform PNT supplies `>>y/log y` primes, uniformly because `y>=X/2`. Rounding changes the count by at most two, and diagonal exclusion leaves `>>y^2/log^2 y` distinct pairs.

For each such pair,

```text
1/9<=|m|/(pq)<=1/4,
```

so its circle-distance square is bounded below by an absolute constant. Therefore

```text
Q_pair(m)>>|m|/(log|m|)^2.
```

Both signs are covered, and overlap of adaptive intervals for different labels is irrelevant because this is a pointwise frequency estimate.

## 9. Exact CRT partition and the five sectors

Because `b` is squarefree and its prime support is disjoint from `P`,

```text
L=product_(r|b)r * product_(p in P)p
```

is squarefree. The complete prime-coordinate map is a bijection, with no residual factor `b` and no hidden lift multiplicity.

Every top assignment is either noncoherent or has one exact label. For a coherent assignment, one and only one of the following ranges holds:

```text
I.   |m|<=N,
II.  N<|m|<=X^2/4,
III. X^2/4<|m|<=M_dec,
IV.  |m|>M_dec.
```

For each top assignment the lower-coordinate product is split disjointly into its decoder tuple and all nondecoder tuples. Hence the five sectors—four coherent ranges plus the noncoherent/nondecoder sector—are disjoint and exhaustive. Energetic top assignments and nondecoder fibres are separately bounded, so grouping them in Sector V loses no frequency or multiplicity.

## 10. Actual-family Taylor expansion and terminal budget

For `|m|<=C/sigma_E`, every denominator is at least `X^2`, and

```text
max_e|m/e|=O_C(log X/X)->0.
```

The aggregate cubic remainder satisfies

```text
sum_e|m/e|^3
 <=|m|^3X^-2sum_e1/e^2
 =O_b(C^3/(sigma_EX^2))
 =O_b(C^3log X/X)->0.
```

The linear term cancels exactly because `theta sum_e1/e=1/b`. Thus the major terms have uniformly positive real part comparable to

```text
exp(-2pi^2m^2sigma_E^2),
```

and their real sum is `>=c_maj/sigma_E`.

Sector II is a full-variance Gaussian tail and is made smaller than a fixed fraction of the major term by choosing `C` first. Sectors III–V satisfy, respectively,

```text
O(X^4 exp(-cX^2/log^2 X)),
O(Z log Z exp(-cX^2/log^6 Z)),
O(exp(-cZ/log^3 Z))+O(Z log Z * Z^2 exp(-cZ/log^3 Z)).
```

Each is `o(1/sigma_E)`. All constants in these bounds are fixed before the terminal scale. The order is genuinely

```text
C -> X.
```

There is no hidden later parameter.

## 11. Arithmetic closure

The positive Fourier sum gives positive Bernoulli weight and therefore an actual subset. The target congruence implies that

```text
sum_(e in A)1/e-1/b
```

is an integer. Since the subset sum lies in `[0,Lambda]` with `Lambda<1`, the integer lies strictly between `-1` and `1` and is zero. Distinctness and avoidance were already built into `E`.

Numerator induction enlarges the forbidden set at each stage, preventing collisions. The cases `b=1,2` close using repeated avoiding representations with squarefree denominators at least three. No endpoint remains open.

## 12. Route classification

The one-anchor route proves the same headline theorem; it is not a stronger public theorem. Its simplification is in the proof DAG.

The row code, top partition, and retained skeleton do carry real replacement work, but they do not reconstruct the multiblock machinery under new names:

- the top partition invokes entropy on one block only;
- every lower row is treated by the same shift-uniform cyclic lemma, with no cross-row propagation, shell vector, segment label, or global level-set count;
- the retained skeleton is a direct product inequality plus pointwise damping from unused lower-lower factors;
- the `b`-sensitive family resolves the former sibling freedom coordinatewise and introduces no reservoir parameter.

Thus the discarded multiblock complexity is not merely hidden in a provider. The correct classification is

```text
GENUINE STRICT SIMPLIFICATION.
```
