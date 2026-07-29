# Quantitative coefficient and multiplicity dossier

## 0. Scope and theorem boundary

This dossier works with the exact denominator family and Bernoulli Fourier coefficient of the article at `9790763ab11a4406a7a15f79218e0d96efb81172`.  The later head `f03105e95dc2ec5595a931293f6ca951e4bc424a` is used only as an independently audited, source-preserving clarification candidate.  Fix throughout a squarefree integer `b >= 3` and a fixed finite forbidden set `T`.

Put

- `Z=X^3`;
- `P={p prime: X <= p < X^3}`;
- `B={q prime: X^3/2 <= q < X^3}`;
- `E_X={pq:p,q in P,p<q} union {rq:r|b prime,q in B}`;
- `L_X=b prod_{p in P}p`;
- `M_X=|E_X|`;
- `Lambda_X=sum_{e in E_X}1/e`;
- `theta_X=1/(b Lambda_X)`;
- `sigma_X^2=theta_X(1-theta_X)sum_{e in E_X}e^{-2}`;
- `R_X(b)={A subset E_X: sum_{e in A}1/e=1/b}`.

Let `xi_e` be independent Bernoulli variables of parameter `theta_X`, let

`T_X=sum_{e in E_X} xi_e L_X/e`,

and let

`P_X=Pr(T_X=L_X/b mod L_X)`.

Since `Lambda_X<1`, the no-wrap argument identifies this modular event with exact equality, so

`P_X=sum_{A in R_X(b)} theta_X^{|A|}(1-theta_X)^{M_X-|A|}`.

The article proves

`Lambda_X -> lambda_0=(log 3)^2/2`,

`theta_X -> alpha_b=2/[b(log 3)^2] in (0,1)`,

`sigma_X^{-1} asymp_b X log X`.

The same prime-number-theorem input and partial summation give

`M_X=(1+o(1))X^6/(18 log^2 X)`,

`log L_X=(1+o(1))X^3=o(M_X)`,

and

`sigma_X^2 ~ alpha_b(1-alpha_b)/(2X^2 log^2 X)`.

No statement below is asserted for `b=1,2` except the separate closure statements in Section 6.

## 1. Quantitative target-coefficient lower bound

Define

`F_X(h)=exp(-2 pi i h/b) prod_{e in E_X}[(1-theta_X)+theta_X exp(2 pi i h/e)]`.

Character orthogonality gives the exact identity

`L_X P_X=sum_{h mod L_X}F_X(h)`.

The article partitions the frequencies into five sectors.  Its strict terminal allocation is quantitative:

1. Sector I has real part at least `c_maj(b)/sigma_X`.
2. After choosing the fixed Gaussian cutoff `C`, Sector II has absolute contribution at most `c_maj(b)/(8 sigma_X)`.
3. For that fixed `C` and sufficiently large `X`, Sectors III--V together have absolute contribution below `3c_maj(b)/(8 sigma_X)`.

Therefore, for all sufficiently large `X`,

`L_X P_X >= c_maj(b)/(2 sigma_X)`.                                      (1.1)

Indeed, the real part of the full sum is at least

`(1-1/8-3/8)c_maj(b)/sigma_X=c_maj(b)/(2 sigma_X)`.

The left side is real and nonnegative, so the same lower bound holds without taking real parts.  Consequently

`P_X >= c_maj(b)/(2L_X sigma_X)`.                                      (1.2)

This is already implicit in the article's strict five-sector budget; it does not require a new arithmetic estimate.

## 2. Weighted-to-unweighted exponential multiplicity

Put

`q_X=max(theta_X,1-theta_X)`,

`q_b=max(alpha_b,1-alpha_b)`.

For every `0<=k<=M_X`,

`theta_X^k(1-theta_X)^{M_X-k} <= q_X^{M_X}`.

Using the exact weighted expansion of `P_X`,

`P_X <= |R_X(b)| q_X^{M_X}`.

Combining with (1.2),

`|R_X(b)| >= [c_maj(b)/(2L_X sigma_X)] q_X^{-M_X}`.                    (2.1)

Since `q_X->q_b`, `log L_X=o(M_X)`, and `log sigma_X=O_b(log X)=o(M_X)`,

`log |R_X(b)| >= [-log q_b+o_b(1)]M_X`.                               (2.2)

This argument is valid because it divides the total target mass by the largest Bernoulli atom.  It makes no equal-cardinality assumption.  The exponent `-log q_b` is exactly what this maximum-atom argument yields without cardinality localisation.

## 3. Two-stage local-limit asymptotic

### Theorem

For fixed squarefree `b>=3` and fixed finite `T`,

`L_X P_X ~ 1/(sqrt(2 pi) sigma_X)` as `X->infinity`.                   (3.1)

Equivalently,

`P_X ~ 1/[L_X sqrt(2 pi) sigma_X]`.                                   (3.2)

With the variance asymptotic,

`L_X P_X ~ X log X / sqrt[pi alpha_b(1-alpha_b)]`.                    (3.3)

### Proof

Fix `C>=1`; throughout this paragraph `C` is held fixed while `X->infinity`.  Put `N=floor(C/sigma_X)`.  In Sector I the article's uniform complex Taylor expansion gives

`F_X(m)=exp(-2 pi^2 m^2 sigma_X^2+epsilon_{X,m})`,

with

`max_{|m|<=C/sigma_X}|epsilon_{X,m}|->0`.                              (3.4)

The aggregate cubic remainder is bounded by

`sum_{e in E_X}|m/e|^3 <<_b C^3 log X/X=o_{b,C}(1)`,

uniformly in this range.  Hence, with `u=m sigma_X`,

`sigma_X sum_{|m|<=C/sigma_X}F_X(m)
 -> int_{-C}^{C} exp(-2 pi^2 u^2)du`.                                 (3.5)

The Sector II Gaussian tail estimate is uniform in the form

`limsup_{X->infinity} sigma_X sum_{Sector II}|F_X(h)|
 <= K_b exp(-c_b C^2/2)`.                                             (3.6)

For every fixed `C`, the article's Sector III--V estimates, with their `C`-dependent thresholds respected, give

`sigma_X sum_{Sectors III--V}|F_X(h)| ->0`.                           (3.7)

Thus, first taking `X->infinity` at fixed `C`,

`limsup_X |sigma_X L_X P_X-int_{-C}^{C}e^{-2 pi^2u^2}du|
 <= K_b e^{-c_bC^2/2}`.                                               (3.8)

Only now let `C->infinity`.  Since

`int_R exp(-2 pi^2u^2)du=1/sqrt(2 pi)`,

(3.1) follows.

The order of limits is essential:

`X -> infinity at fixed C`, and only then `C -> infinity`.

No growing diagonal `C=C(X)` is needed or claimed.  In particular, this proof does not establish a natural-scale conditional central limit theorem, a joint two-frequency theorem, or a bivariate local limit theorem.

## 4. Mesoscopic typical-cardinality entropy theorem

Let

`K_X=sum_{e in E_X}xi_e ~ Bin(M_X,theta_X)`

and define

`w_X=ceil(2 sqrt(M_X log L_X))`.

Because `log L_X=o(M_X)`,

`sqrt(M_X)<<w_X=o(M_X)`.

Hoeffding's inequality yields

`Pr(|K_X-theta_XM_X|>w_X)
 <=2 exp(-2w_X^2/M_X)
 <=2L_X^{-8}`.                                                        (4.1)

By (1.2), `P_X >>_b 1/(L_X sigma_X)`, while `2L_X^{-8}=o(P_X)`.  Therefore

`Pr(T_X=L_X/b and |K_X-theta_XM_X|<=w_X)=(1-o(1))P_X`.                (4.2)

Let

`H(t)=-t log t-(1-t)log(1-t)`.

For every integer `k` in the window `|k-theta_XM_X|<=w_X`,

`theta_X^k(1-theta_X)^{M_X-k}
 <= exp[-M_XH(theta_X)+O_b(w_X)]`.                                   (4.3)

To verify (4.3), write `k=theta_XM_X+d`, `|d|<=w_X`; then the logarithm of the atom is

`M_X[theta_X log theta_X+(1-theta_X)log(1-theta_X)]
 +d log[theta_X/(1-theta_X)]`,

and `theta_X` remains in a fixed compact subinterval of `(0,1)`.

Divide (4.2) by the maximum atom in (4.3).  Using (1.2), `log L_X=o(M_X)`, `log sigma_X=o(M_X)`, `w_X=o(M_X)`, and `H(theta_X)->H(alpha_b)`, one obtains

`#{A in R_X(b): ||A|-theta_XM_X|<=w_X}
 >= exp([H(alpha_b)-o_b(1)]M_X)`.                                    (4.4)

The total number of all subsets in the same window is at most

`exp([H(alpha_b)+o_b(1)]M_X)`,

by the usual binomial-coefficient entropy estimate, uniformly for `k/M_X=theta_X+o(1)`.  Hence (4.4) has the optimal exponential rate for this mesoscopic window.

This is a typical-cardinality entropy theorem on a window wider than the binomial standard deviation by a factor of order `sqrt(log L_X)`.  It is not a conditional CLT and gives no Gaussian profile inside the window.

## 5. One exact cardinality with the same exponent

The window in Section 4 contains at most `2w_X+1=exp(o(M_X))` integers.  Partition the representations counted in (4.4) by cardinality.  By the pigeonhole principle, there is an integer `k_X` with

`k_X=theta_XM_X+O(w_X)`

such that

`#{A in R_X(b): |A|=k_X}
 >= exp([H(alpha_b)-o_b(1)]M_X)`.                                    (5.1)

No asymptotic is claimed for every prescribed cardinality, nor for a cardinality fixed in advance.

## 6. Exact status of b=1,2

The one-family quantitative theory above is proved only for the article's direct family with squarefree `b>=3`.

For `b=2`, the article constructs an avoiding representation of `1/2` as the disjoint union of a separately chosen representation of `1/3` and a separately chosen representation of `1/6`:

`1/2=1/3+1/6`.

For `b=1`, it first uses numerator induction at denominator `3` to represent `3/3=1`, and then uses the resulting avoiding representation of `1` for further numerator induction.

These closure arguments prove existence and finite avoidance for `b=1,2`, but they do not place those representations in one family `E_X` with a single parameter `theta_X`.  Therefore none of (1.1)--(5.1), including their constants or entropy exponents, is transferred to `b=1,2` in this dossier.

## 7. Counterexample to arbitrary o(M_X) in-family deletion resilience

Fix a prime divisor `r|b` and delete the entire target row

`D_{r,X}={rq:q in B}`.

Then

`|D_{r,X}|=|B|~X^3/(6 log X)=o(M_X)`.

For every remaining denominator `e`, one has `r not| e`: the only denominators containing the prime `r` were precisely the deleted row.  Since `r|L_X`, it follows that

`L_X/e == 0 (mod r)`

for every remaining denominator.  Hence every remaining subset sum of the integer weights is `0 mod r`.

But

`L_X/b=prod_{p in P}p`

is nonzero modulo `r`, because all primes in `P` exceed and are distinct from the fixed prime divisors of `b`.  Thus no subset of `E_X\D_{r,X}` reaches the target even modulo `r`, and therefore no exact representation of `1/b` survives.

Consequently, arbitrary adversarial deletion of `o(M_X)` members of the in-family denominator set is not resilient.  This counterexample does not rule out resilience under additional structural hypotheses preserving every target row, the anchor system, and the lower-pair dispersion, but no such structural resilience theorem is proved here.

## 8. Explicit exclusions

This dossier proves only the statements above.  It does not claim:

- a conditional CLT for `K_X` given the exact target at scale `sqrt(M_X)`;
- a bivariate or joint local limit theorem;
- a Gaussian asymptotic for each prescribed exact cardinality;
- arbitrary or structural in-family deletion resilience;
- quantitative multiplicity statements for `b=1,2`;
- any manuscript, Lean, publication, release, DOI, or repository-integration result.
