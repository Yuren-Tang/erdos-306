# Fixed-progression restricted squarefree-semiprime theorem

## Status and scope

This dossier gives the bounded post-v1 adaptation of the anchor–fibre proof at
`Yuren-Tang/erdos-306@9790763ab11a4406a7a15f79218e0d96efb81172`, read together with the source-preserving clarification candidate
`f03105e95dc2ec5595a931293f6ca951e4bc424a`.

It proves the concrete theorem for a fixed nonempty union of reduced residue classes.  It does **not** formulate a graph-transference theorem, and it makes no claim for varying moduli, Chebotarev sets, arbitrary positive-density prime sets, deletion resilience, or bipartite factor restrictions.

Throughout, `m >= 1` is fixed, `C` is a nonempty subset of `(Z/mZ)^×`,

`P_C = {p prime : p mod m lies in C}`,

and

`delta = |C|/phi(m) > 0`.

All implied constants may depend on `m`, `C`, the fixed target denominator `b`, and the fixed finite forbidden set, but never on the scale parameter `X`.

---

## Theorem

### Theorem A (fixed-progression restricted semiprimes)

Let `m >= 1` and let `C` be a nonempty subset of `(Z/mZ)^×`.  A positive rational number `q=a/b`, written in lowest terms, is a finite sum

`q = sum_{e in S} 1/e`

of reciprocals of pairwise distinct integers `e=pp'`, where `p != p'` and both primes `p,p'` belong to `P_C`, if and only if

1. `b` is squarefree; and
2. every prime divisor of `b` belongs to `P_C`.

Moreover, for every prescribed finite set `T` of positive integers, the representing denominators may be chosen outside `T`.

The proof is divided into necessity, an avoiding representation of `1/b`, and induction on the numerator.

---

## 1. Necessity: squarefreeness and prime support

Suppose

`a/b = sum_{j=1}^k 1/(p_j p'_j)`

with all denominators pairwise distinct, every `p_j != p'_j`, and every prime factor in `P_C`.  Let

`L = lcm_j(p_j p'_j)`.

Each denominator is squarefree, hence `L` is squarefree.  Every prime divisor of `L` lies in `P_C`.  Multiplying the displayed identity by `L` shows that `a/b` belongs to `L^{-1} Z`; since `(a,b)=1`, the reduced denominator `b` divides `L`.  Therefore `b` is squarefree and every prime divisor of `b` lies in `P_C`.

This proves both necessary conditions.  Notice that the support conclusion is stronger than the unrestricted squarefree-denominator obstruction: cancellation in the numerator can remove primes from the reduced denominator, but it cannot introduce a prime absent from the common denominator `L`.

---

## 2. Fixed-modulus prime input

The only distributional input is the prime number theorem in the fixed reduced residue classes comprising `C`.

### Proposition 2.1 (fixed-ratio supply)

For every fixed `0<u<v`,

`# {p in P_C : uy <= p < vy}`

`= (delta (v-u) + o(1)) y/log y`

as `y -> infinity`.  The error is tail-uniform for the finitely many fixed ratios used below.

### Justification

For each `c in C`, the fixed-modulus PNT in arithmetic progressions gives

`pi(x;m,c) = Li(x)/phi(m) + o(x/log x)`.

Summing over the fixed finite set `C` gives

`pi_C(x) = delta Li(x) + o(x/log x)`.

Evaluation at `uy` and `vy` yields the fixed-ratio assertion.  No short-interval theorem, Bombieri–Vinogradov estimate, Siegel–Walfisz uniformity in a growing modulus, or distribution modulo any moving prime is used.

### Proposition 2.2 (reciprocal and reciprocal-square estimates)

For fixed `A>1`,

`sum_{X <= p < X^A, p in P_C} 1/p = delta log A + o(1)`,

and

`sum_{X <= p < X^A, p in P_C} 1/p^2 = Theta_{m,C,A}(1/(X log X))`.

If

`B = P_C intersect [Z/2,Z)`,

then

`M:=|B| = Theta(delta Z/log Z)`,

`V_B:=sum_{q in B}1/q = Theta(delta/log Z)`,

and

`W_B:=sum_{q in B}1/q^2 = Theta(delta/(Z log Z))`.

### Proof

Partial summation applied to `pi_C(t)=delta Li(t)+o(t/log t)` gives

`sum 1/p = int_X^{X^A} dt/(t log t) * delta + o(1)`

`= delta(log log X^A-log log X)+o(1)`

`= delta log A+o(1)`.

The upper reciprocal-square estimate follows by dyadic decomposition and the fixed-ratio upper count.  The interval `[X,2X)` supplies the matching lower bound.  On `[Z/2,Z)`, the count estimate gives `M`; multiplication by the pointwise bounds `1/Z <= 1/q <= 2/Z` and `1/Z^2 <= 1/q^2 <= 4/Z^2` gives the stated orders for `V_B` and `W_B`.

---

## 3. Load calibration and denominator family

Fix the target pair load

`lambda_* = 3/4`

and define

`A = exp(sqrt(2 lambda_*)/delta) = exp(sqrt(3/2)/delta)`.

Then `A>exp(sqrt(3/2))>3.4>2`.  Put

`Z=X^A`,

`P = P_C intersect [X,Z)`,

`B = P_C intersect [Z/2,Z)`,

and let

`S_b = {r prime : r divides b}`.

For the sufficiency proof we assume that `b` is squarefree and `S_b subset P_C`.  Choose `X` larger than every prime divisor of `b`, and so large that every denominator constructed below exceeds every member of the prescribed finite forbidden set `T`.

Define

`E_pair = {pq : p,q in P, p<q}`,

`E_b = {rq : r in S_b, q in B}`,

and

`E = E_pair disjoint_union E_b`.

All members of `E` are pairwise distinct squarefree semiprimes with both prime factors in `P_C`; unique factorisation and `X>max S_b` separate `E_pair` from `E_b`.

Let

`S_1=sum_{p in P}1/p`, `S_2=sum_{p in P}1/p^2`,

and

`Lambda=sum_{e in E}1/e`.

The complete-pair identity gives

`Lambda_pair = (S_1^2-S_2)/2 = 3/4+o(1)`.

The target-row load is

`Lambda_b = (sum_{r|b}1/r)V_B = O_{b,m,C}(1/log Z)=o(1)`.

Hence one may fix constants

`1/2 < lambda_- < 3/4 < lambda_+ < 1`

such that, for all sufficiently large `X`,

`lambda_- < Lambda < lambda_+`.

This is the reason for calibrating `A` from the reciprocal load.  Merely taking `A` “large” would be invalid because the upper no-wrap inequality `Lambda<1` would eventually fail.

The reciprocal-square load satisfies

`sum_{e in E_pair}1/e^2 = Theta(delta^2/(X^2 log^2 X))`.

Indeed, the upper bound follows from `S_2^2/2`, and pairs from `P_C intersect [X,2X)` give the lower bound.  The target-row square load is

`sum_{r|b}sum_{q in B}1/(r^2q^2)`

`= O_{b,m,C}(delta/(Z log Z))`

`= o(1/(X^2 log^2 X))`

because `A>2`.  Thus

`sum_{e in E}1/e^2 = Theta_{b,m,C}(1/(X^2 log^2 X))`.

Set

`theta = 1/(b Lambda)`.

For every fixed `b>=2`, `theta` remains in a compact subinterval of `(0,1)` because `Lambda in [lambda_-,lambda_+]` and `lambda_->1/2>=1/b`.  The exact centring identity is

`theta sum_{e in E}1/e = 1/b`.

With

`sigma_E^2 = theta(1-theta)sum_{e in E}1/e^2`,

we have

`sigma_E^2 = Theta_{b,m,C}(1/(X^2 log^2 X))`,

`sigma_E^{-1} = Theta_{b,m,C}(X log X)`.

Finally set

`L = b product_{p in P} p`.

Because `b` is squarefree and its prime factors are below and disjoint from `P`, the modulus `L` is squarefree and every denominator in `E` divides `L`.

---

## 4. Fourier selection and exact factor partition

Choose each denominator `e in E` independently with Bernoulli parameter `theta`.  Character orthogonality in `Z/LZ` reduces the existence of a subset with reciprocal sum congruent to `1/b mod 1` to positivity of

`sum_{h mod L} F(h)`,

where

`F(h)=exp(-2 pi i h/b) product_{e in E}((1-theta)+theta exp(2 pi i h/e))`.

The Bernoulli modulus estimate, uniform because `theta` lies in a fixed compact subinterval of `(0,1)`, is

`|F(h)| <= exp(-kappa Q_E(h))`,

`Q_E(h)=sum_{e in E} ||h/e||^2`.

Chinese-remainder coordinates split the factors exactly into:

1. internal anchor edges `qq'` with `q,q' in B`;
2. lower-prime rows `rq` with `r in P\B`, `q in B`;
3. target rows `rq` with `r|b`, `q in B`;
4. retained residual edges `pp'` with `p,p' in P\B`.

Every denominator belongs to exactly one class.  No factor is deleted, duplicated, or introduced.  The target character and all phases not absorbed into row kernels remain in the residual factor.

The independent-product formula, exact weighted product-fibre compression, finite Fourier coefficient identity, and final no-wrap step are unchanged from the source article.

---

## 5. Anchor rigidity: explicit density losses

The source anchor argument is combinatorial after the size of the prime block is supplied.  It applies to any set of distinct primes in `[Y,2Y)` of cardinality comparable to `delta Y/log Y`.

Take `Y=Z/2` and `Q=B`.  Then

`N=|B|=Theta(delta Z/log Z)`.

The reciprocal-dispersion lemma is unchanged: for any `s` distinct primes in the interval, the proof uses only that a residue class modulo a prime has at most two representatives in an interval of length at most that prime.  It has no density loss.

Density first enters when the cardinality `N` is inserted into the nondominant-forcing argument.  The source floor `N^3/Y^2` becomes

`Theta(delta^3 Z/log^3 Z)`.

Consequently there is a constant `c_delta>0`, with polynomial deterioration `c_delta` of order at worst `delta^3` up to fixed absolute factors, such that anchor energy below

`F_B = c_delta Z/log^3 Z`

forces a unique dominant label.  The zero-exception step uses the same cross-energy estimate and the integer exceptional count; after taking the absolute threshold small enough depending on `delta`, it gives exact coherence of every anchor coordinate.

The fingerprint-rigidity lemma itself is density-free once the fingerprint size is specified.  In the entropy count, the available vertex count is reduced to `N=Theta(delta Z/log Z)`.  Since `delta>0` is fixed, the same choice of fingerprint and the same two energy regimes give, uniformly for `R>=F_B`,

`#{anchor assignments with energy <=R} <= exp(epsilon R)`

for every fixed `epsilon>0` and all sufficiently large `X`.  Constants depend on `delta`, but the exponential entropy remains `o(R)`.

For the anchor-only Bernoulli weight,

`sigma_{B,0}^2`

`= theta(1-theta) sum_{q<q', q,q' in B}1/(q^2q'^2)`

`= Theta(delta^2/(Z^2 log^2 Z))`.

The anchor partition estimate therefore becomes

`P_anc = O_delta(Z log Z)`,

while the total weight of noncoherent anchor assignments is

`<= exp(-c_delta Z/log^3 Z)`.

These are the only anchor and fingerprint density losses needed later.

---

## 6. Row separation and the absence of moving-modulus distribution

For a row prime `r` and its anchor neighbours `q in B`, define the cyclic distance

`D_r = min_{d not=0 mod r} sum_{q in B} ||d q^{-1}/r||^2`.

The multiplicity-sensitive cyclic-energy lemma says that if each residue class modulo `r` is represented at most `mu_r` times among the neighbours, then

`D_r >= c M^3/(mu_r^2 r^2)`.

### Lower-prime rows

For `r in P\B`, every allowed anchor prime is joined to `r`; hence the row has `M=Theta(delta Z/log Z)` neighbours.  We do **not** use any equidistribution of `P_C` modulo `r`.  We bound multiplicity in the ambient interval:

`mu_r <= Z/(2r)+1 <= 2Z/r`.

Substitution gives

`D_r >= c_delta Z/log^3 Z`,

with the explicit density factor `delta^3` inherited from `M^3`.

### Target rows and exact observability

For every `r|b`, the hypothesis `r in P_C` ensures that every edge `rq`, `q in B`, is an allowed restricted semiprime.  Since `X>r`, one has `q != r`.  Multiplication by `q^{-1}` is invertible modulo `r`.  If a target-coordinate shift `d mod r` produces zero syndrome on every target-row edge, then

`d q^{-1}=0 mod r`

for every `q in B`, hence `d=0 mod r`.  Thus the target sensor map has trivial kernel: the target coordinate is exactly observable.

Quantitatively, for `d !=0 mod r`, every nonzero residue has distance at least `1/r`, so

`D_r >= M/r^2 = Omega_{b,m,C}(delta Z/log Z)`.

No AP theorem modulo the target prime is used either.

### Global row error

The shift-uniform row tail is unchanged.  Summing over all lower and target rows gives

`Delta <= Z^2 exp(-c_{b,delta} Z/log^3 Z)=o(1/(Z log Z))`,

and hence an error negligible compared with the positive major contribution.  The polynomial prefactor absorbs the number and sizes of all row moduli.

---

## 7. Decoder ranges and density losses

Choose

`M_dec = c_0 delta XZ/(log Z)^2`

with `c_0>0` sufficiently small depending only on the fixed compact Bernoulli range and the constants in the lower-row distance.

For a lower row `r`, a candidate integer label `n` produces anchor-cross energy bounded by

`n^2 W_B/r^2`.

At the worst lower row `r=X` and `|n|<=M_dec`,

`M_dec^2 W_B/X^2`

`= O(delta^3 Z/log^5 Z)`

`= o(delta^3 Z/log^3 Z)`

`= o(D_r)`.

Therefore every lower-prime coordinate is uniquely identified throughout `|n|<=M_dec`.

For a target row `r|b`, Sector II only needs identification through `|n|<=X^2/4`.  The candidate energy is

`O_b(X^4 W_B)=O_{b,m,C}(delta X^4/(Z log Z))`,

whereas

`D_r=Omega_{b,m,C}(delta Z/log Z)`.

Their ratio is `O_b(X^4/Z^2)=o(1)` because `A>2`.  Thus every target coordinate is identified through the entire actual-variance Gaussian range and through the end of Sector II.

The scale inequalities now read

`sigma_E^{-1} ~ X log X = o(X^2)`,

`X^2 = o(M_dec)`,

`M_dec = o(Z^2)`,

and

`M_dec^2 sigma_{B,0}^2`

`= Theta(delta^4 X^2/log^6 Z) -> infinity`.

All hold because `delta` and `A` are fixed and `A>2`.

---

## 8. Retained-pair damping and the five sectors

After exact anchor coherence and row decoding, the residual product retains every pair `pp'` with both endpoints in `P\B`.  This completeness is what supplies adaptive damping.

For `X^2/4<|n|<=M_dec`, put `y=sqrt(|n|)`.  The scale choice gives

`[2y,3y] subset [X,Z/2)`

for all sufficiently large `X`, because

`3 sqrt(M_dec) = O(sqrt(delta XZ)/log Z)=o(Z)`.

The fixed-modulus PNT gives

`K_n := # (P_C intersect [2y,3y]) = Theta(delta y/log y)`.

All unordered pairs of these primes are retained residual edges.  For such an edge `e=pp'`, one has `e` comparable to `|n|`, and the source residual-energy lemma gives a fixed positive contribution per nontrivial phase after excluding only the bounded collision multiplicity already handled there.  Consequently

`Q_pair(n) >= c delta^2 |n|/log^2|n|`.

This is the sole Sector III density loss: two independently counted allowed endpoints produce `delta^2`.

The five-sector budget is then:

### Sector I: `|n|<=N=floor(C/sigma_E)`

Exact centring cancels the linear phase.  The quadratic term gives the positive Gaussian major.  Since

`N=Theta_{b,delta,C}(X log X)`

and

`sum_e 1/e^3 = o((sum_e1/e^2)^{3/2})`,

the cubic remainder is

`O_{b,delta}(C^3 log X/X)=o(1)`.

Choose `C` first so that the limiting Gaussian major has a strict positive reserve.

### Sector II: `N<|n|<=X^2/4`

All lower and target coordinates decode.  The actual variance `sigma_E^2`, not an anchor surrogate, yields the ordinary Gaussian tail.  Taking `C` large makes this smaller than a fixed fraction of the Sector I reserve.

### Sector III: `X^2/4<|n|<=M_dec`

Lower rows remain decoded.  The retained adaptive interval supplies

`|F(n)| <= exp(-c delta^2 |n|/log^2|n|)`.

Thus the whole sector is bounded by

`O(M_dec) exp(-c delta^2 X^2/log^2 X)=o(sigma_E^{-1})`.

No moving-modulus prime theorem is involved; only the fixed-ratio count in `[2sqrt|n|,3sqrt|n|]` is used.

### Sector IV: coherent anchor labels beyond `M_dec`

The internal anchor Gaussian gives

`sigma_{B,0}^{-1} exp(-c M_dec^2 sigma_{B,0}^2)`

`= o(sigma_E^{-1})`

because `M_dec^2 sigma_{B,0}^2 ~ delta^4 X^2/log^6 Z -> infinity`.

### Sector V: noncoherent anchors and fibre error

The noncoherent anchor tail is

`exp(-c_delta Z/log^3 Z)`,

and the summed row-compression error is bounded by `Delta`.  After multiplication by the anchor partition `O_delta(Z log Z)`, both are `o(sigma_E^{-1})`.

The strict major-minus-minors budget therefore closes exactly as in the source article.  The finite Fourier coefficient at `L/b` is positive.

---

## 9. From congruence to an avoiding representation of `1/b`

Positivity gives a subset `S subset E` satisfying

`sum_{e in S}1/e = 1/b mod 1`.

Every subset sum lies in `[0,Lambda]`, and `Lambda<1`; the target `1/b` also lies in `[0,1)`.  Therefore the congruence is the exact equality

`sum_{e in S}1/e = 1/b`.

All denominators lie outside `T` by the initial choice of `X`.  They are pairwise distinct squarefree semiprimes, and both prime factors lie in `P_C`.

This proves the avoiding unit-fraction statement for every supported squarefree `b>=2`, including `b=2` when `2 in P_C`.  Nothing singular occurs at `b=2`: the calibrated load interval has `Lambda>1/2`, so `theta=1/(2Lambda)` lies strictly below `1`, while `Lambda<1` still supplies no-wrap.

---

## 10. Numerator induction and the case `b=1`

### Lemma 10.1 (avoidance induction)

Assume that for a fixed denominator `b` and every finite forbidden set `T`, there is a representation of `1/b` by pairwise distinct allowed denominators outside `T`.  Then every positive integer multiple `a/b` has such a representation outside any prescribed finite set.

### Proof

Induct on `a`.  The case `a=1` is the avoiding theorem.  Given a representation of `(a-1)/b`, enlarge the forbidden set by all denominators already used and apply the avoiding theorem again to `1/b`.  The union is disjoint and represents `a/b`.

For `b>=2` this proves sufficiency for every positive numerator.

For `b=1`, choose any allowed prime `r_0 in P_C`; such a prime exists by the fixed-modulus PNT.  Apply the already proved avoiding theorem to `1/r_0`, then the induction lemma with denominator `r_0` and numerator `r_0`.  This gives

`1 = r_0/r_0`

as a sum of reciprocals of pairwise distinct allowed squarefree semiprimes, avoiding the prescribed finite set.  A second induction on the integer numerator gives every positive integer.

This also covers the possibility `r_0=2`; alternatively one may choose an allowed prime `r_0>=3`, since every nonempty reduced residue class contains infinitely many primes.

---

## 11. Proposition-by-proposition source comparison

| Source component | Restricted adaptation | New loss or condition |
|---|---|---|
| Finite Fourier selection | unchanged | none |
| Exactness interfaces / no-wrap | unchanged | load calibrated so `1/b<Lambda<1` |
| Complete-pair identity | unchanged on selected allowed vertices | `S_1 -> delta log A` |
| Fixed-ratio prime supply | PNT in fixed union of APs | density `delta` |
| Reciprocal estimates | Abel summation | first moment `delta`, square moment `delta` |
| Arithmetic capacity | same family restricted to `P_C` | choose `A=exp(sqrt(3/2)/delta)` |
| Anchor reciprocal dispersion | unchanged for arbitrary subsets | none |
| Nondominant forcing | same proof | floor `~delta^3 Z/log^3 Z` |
| Exact anchor rigidity | same integer-exception argument | constants depend on `delta` |
| Fingerprint rigidity | unchanged | none locally |
| Fingerprint entropy | same count with fewer vertices | constants depend on `delta`; still `exp(o(R))` |
| Anchor partition | unchanged | `P_anc=O_delta(ZlogZ)`; tail exponent `c_delta` |
| Lower-row cyclic energy | same multiplicity lemma | `D_r~delta^3 Z/log^3 Z` |
| Target-row observability | full allowed star `r-B` | requires every `r|b` to lie in `P_C` |
| Target-row distance | elementary nonzero residue bound | `D_r~delta Z/log Z` |
| Weighted fibre compression | unchanged exact partition | none |
| Decoder identification | unchanged comparison | `M_dec~delta XZ/log^2Z` |
| Adaptive retained pairs | complete allowed residual graph | energy `~delta^2|n|/log^2|n|` |
| Five-sector exhaustion | unchanged | density constants as displayed |
| Gaussian major | unchanged | `sigma_E^{-1}~_{delta}XlogX` |
| Avoidance | choose `X` beyond finite set | unchanged |
| Numerator induction | unchanged | none |
| Small-denominator closure | auxiliary allowed prime | covers `b=1`; direct calibrated proof covers `b=2` |
| Necessity | LCM argument | adds prime-support obstruction |

---

## 12. What is not being claimed

The proof fixes `m` and `C` before `X` tends to infinity.  It does not give uniformity for `m=m(X)`.  It uses the complete graph on the selected allowed primes and therefore proves no resilience under edge deletion.  It does not treat a merely positive-density prime set lacking a fixed-ratio asymptotic.  It does not establish a Chebotarev version, though the same feasibility pattern may apply with separately audited input.  It does not treat a bipartite restriction, because the present anchor mechanism uses an internal complete anchor graph.  No general graph-transference theorem is stated or implied.

---

## Conclusion

The source proof survives the fixed-progression restriction after one essential recalibration: the exponent in `Z=X^A` is determined by the reciprocal load, not chosen generically.  Every other change is quantitative.  The anchor and lower-row floors lose `delta^3`, adaptive retained-pair damping loses `delta^2`, target rows lose `delta`, and the decoder cutoff gains a factor `delta`; all remain asymptotically decisive for fixed `delta>0`.  Exact target-coordinate observability uses the full allowed target stars and explains precisely why every prime divisor of the reduced denominator must belong to the allowed prime set.  Together with the LCM necessity argument, finite avoidance, numerator induction, and the `b=1,2` closure, this proves Theorem A.