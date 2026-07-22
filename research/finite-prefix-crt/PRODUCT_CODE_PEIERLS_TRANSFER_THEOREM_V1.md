# Product-code fibre compression and quantitative Peierls transfer

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / GENERAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

This note extracts the reusable mathematics behind the finite-prefix argument.  The statements do not depend on Erdős 306, semiprimes, primorials, or Li's gap-free-floor problem.  They isolate two independent mechanisms:

1. arbitrary-shift compression of large product fibres by a metric code;
2. conversion of a level-set entropy estimate and a growing energy floor into an explicit moving Fourier error.

A prime-block complete bipartite reservoir is then given as an arithmetic realization with vanishing reciprocal load and exponentially strong fibre compression.

## 1. Weighted phase codes

Let `T=R/Z`, with distance

\[
 \|t\|=\min_{n\in\mathbb Z}|t-n|.
\]

Let `X` be a finite set and let

\[
 \psi_j:X\to T,\qquad \lambda_j>0\quad(j\in J)
\]

be a finite weighted phase code.  Its squared minimum distance is

\[
 D(X,\psi,\lambda)
 :=\min_{x\ne x'}\sum_{j\in J}\lambda_j
       \|\psi_j(x)-\psi_j(x')\|^2.
 \tag{1.1}
\]

For arbitrary shifts `alpha_j in T`, define

\[
 E_\alpha(x)=\sum_j\lambda_j\|\alpha_j+\psi_j(x)\|^2.
 \tag{1.2}
\]

### Lemma 1.1 — shifted energy separation

For every `x,x' in X`,

\[
 \sqrt D\le \sqrt{E_\alpha(x)}+\sqrt{E_\alpha(x')}.
 \tag{1.3}
\]

Consequently:

1. at most one `x` satisfies `E_alpha(x)<D/4`;
2. if a distinguished point `x_*` satisfies `E_alpha(x_*)<=eta D`, where `0<=eta<1`, then every `x!=x_*` satisfies

\[
 E_\alpha(x)\ge(1-\sqrt\eta)^2D.
 \tag{1.4}
\]

#### Proof

For every coordinate,

\[
 \|\psi_j(x)-\psi_j(x')\|
 \le \|\alpha_j+\psi_j(x)\|+
      \|\alpha_j+\psi_j(x')\|.
\]

Apply the triangle inequality in the weighted Euclidean product.  The two consequences are immediate.  `square`

## 2. Arbitrary-shift fibre compression

Let kernels `K_j:T->C` satisfy

\[
 |K_j(t)|\le \exp(-\lambda_j\|t\|^2).
 \tag{2.1}
\]

Put

\[
 W_\alpha(x)=\prod_j|K_j(\alpha_j+\psi_j(x))|.
\]

### Theorem 2.1 — one-fibre partition bound

\[
 \boxed{
 \sum_{x\in X}W_\alpha(x)
 \le 1+(|X|-1)e^{-D/4}.
 }
 \tag{2.2}
\]

The estimate is uniform in every shift `alpha`.

If `x_*` is distinguished and `E_alpha(x_*)<=eta D`, then the sibling mass obeys

\[
 \boxed{
 \sum_{x\ne x_*}W_\alpha(x)
 \le(|X|-1)e^{-(1-\sqrt\eta)^2D}.
 }
 \tag{2.3}
\]

#### Proof

The kernel bound gives `W_alpha(x)<=exp(-E_alpha(x))`.  By Lemma 1.1, at most one point can have energy below `D/4`; every other point contributes at most `e^{-D/4}`.  The distinguished form follows from (1.4).  `square`

### Sharpness remark

The fraction `1/4` cannot be improved for arbitrary shifts without additional information.  For a two-point code, place the shift at the metric midpoint of the two codewords; both energies equal `D/4`.

## 3. Product fibres and decoded skeletons

Let

\[
 X=\prod_{i\in I}X_i.
\]

For each `i`, let `W_{i,y}(x_i)` be a shifted code weight depending on external data `y`, with distance `D_i`.  Suppose a Fourier-type amplitude satisfies

\[
 |F(y,x)|\le A(y)\prod_iW_{i,y}(x_i),
 \qquad A(y)\ge0.
 \tag{3.1}
\]

No factorization of the discarded part of the amplitude is required; (3.1) is enough.

Define

\[
 \delta_i=(|X_i|-1)e^{-D_i/4}.
\]

### Theorem 3.1 — product-fibre compression

Uniformly in `y`,

\[
 \boxed{
 \sum_{x\in X}|F(y,x)|
 \le A(y)\prod_i(1+\delta_i)
 \le A(y)\exp\!\left(\sum_i\delta_i\right).
 }
 \tag{3.2}
\]

Thus, if `sum_i delta_i=o(1)`, an arbitrarily large product fibre costs only a factor `1+o(1)`.

Now suppose that for a coherent external datum `y` there is a distinguished decoded point

\[
 x_*(y)=(x_{i,*}(y))_i
\]

with `E_{i,y}(x_{i,*})<=eta_iD_i`, `eta_i<1`.  Put

\[
 \tau_i=(|X_i|-1)
       \exp(-(1-\sqrt{\eta_i})^2D_i).
\]

Then

\[
 \boxed{
 \sum_{x\ne x_*(y)}|F(y,x)|
 \le A(y)\left(\prod_i(1+\tau_i)-1\right)
 \le A(y)\left(e^{\sum_i\tau_i}-1\right).
 }
 \tag{3.3}
\]

This identifies a decoded skeleton `y -> x_*(y)` and bounds the entire complement in `L^1`.

## 4. Quantitative Peierls extraction

Let `Y_k` be finite assignment spaces with nonnegative energy `Q_k`, scale `sigma_k in (0,1]`, and complexity count `J_k`.  Assume that for every `R>=1`,

\[
 \#\{y\in Y_k:Q_k(y)\le R\}
 \le e^{AJ_k}e^{\alpha R}
      \left(1+\frac{\sqrt R}{\sigma_k}\right),
 \tag{4.1}
\]

where `A,alpha` are fixed.  Let `c>c'>alpha`, and suppose a sector `B_k subset Y_k` lies above a floor

\[
 Q_k(y)\ge F_k\ge1\qquad(y\in B_k).
 \tag{4.2}
\]

### Theorem 4.1 — entropy–floor transfer

There is a constant `C=C(alpha,c')` such that

\[
 \boxed{
 \sum_{y\in B_k}e^{-cQ_k(y)}
 \le \frac{C}{\sigma_k}
       \exp\bigl(AJ_k-(c-c')F_k\bigr).
 }
 \tag{4.3}
\]

#### Proof

For `y in B_k`,

\[
 e^{-cQ_k(y)}
 \le e^{-(c-c')F_k}e^{-c'Q_k(y)}.
\]

Partition `Y_k` into shells `n<=Q_k<n+1`.  From (4.1),

\[
 \sum_{y\in Y_k}e^{-c'Q_k(y)}
 \le e^{AJ_k}\sum_{n\ge0}
 e^{-c'n}e^{\alpha(n+1)}
 \left(1+\frac{\sqrt{n+1}}{\sigma_k}\right).
\]

The series converges because `c'>alpha`; since `sigma_k<=1`, it is at most `C e^{AJ_k}/sigma_k`.  Multiply by the extracted floor factor.  `square`

### Corollary 4.2 — moving rates

If

\[
 F_k/J_k\to\infty,
\]

then the normalized floor-sector error

\[
 \varepsilon_k:=C\exp(AJ_k-(c-c')F_k)
\]

tends to zero.  If `F_k` grows exponentially while `J_k` grows polynomially, then `epsilon_k` beats every inverse power of `k`.

This is stronger than a terminal statement of the form

> for every fixed `eta>0`, the sector is eventually at most `eta/sigma_k`.

The moving rate is already latent in the proof whenever the level-set and floor estimates remain quantitative.

## 5. A combined quotient/fibre bound

Suppose frequencies decompose as

\[
 (y,x)\in Y_k\times\prod_iX_{k,i},
\]

and

\[
 |F_k(y,x)|
 \le e^{-cQ_k(y)}\prod_iW_{k,i,y}(x_i).
 \tag{5.1}
\]

Assume the local code excess satisfies

\[
 \Delta_k:=\sum_i(|X_{k,i}|-1)e^{-D_{k,i}/4}=o(1).
 \tag{5.2}
\]

If a quotient sector lies above `F_k`, then Theorems 3.1 and 4.1 give

\[
 \boxed{
 \sum_{y\in B_k}\sum_x|F_k(y,x)|
 \le(1+o(1))\frac C{\sigma_k}
   \exp\bigl(AJ_k-(c-c')F_k\bigr).
 }
 \tag{5.3}
\]

This is the basic **product-code/Peierls transfer theorem**: local metric separation removes the product fibre, while quotient entropy and a Peierls floor remove the remaining high-dimensional sector.

Neither step needs cancellation.

## 6. Bernoulli kernels

For

\[
 K_\theta(t)=(1-\theta)+\theta e^{2\pi it},
\]

one has

\[
 |K_\theta(t)|^2
 =1-4\theta(1-\theta)\sin^2(\pi t).
\]

Using `sin(pi||t||)>=2||t||` for `||t||<=1/2`,

\[
 |K_\theta(t)|
 \le\exp(-8\theta(1-\theta)\|t\|^2).
 \tag{6.1}
\]

Thus every compact interval `theta in [theta_-,theta_+] subset (0,1)` supplies a uniform code weight.  In particular, for `theta in [1/3,2/3]`, one may take

\[
 \lambda=16/9.
 \tag{6.2}
\]

## 7. Prime-block complete bipartite sensors

Let `Y->infinity`, let

\[
 \mathcal S_Y=\{s\text{ prime}:Y<s\le2Y\},
\]

and let `r` be prime with `r<=sqrt(Y)`.  Use the multiset

\[
 U_r=\{s^{-1}\bmod r:s\in\mathcal S_Y\}
\]

as a code on `Z/rZ`.

### Lemma 7.1 — multiplicity energy

If a multiset `U` of `M` nonzero residues modulo the prime `r` has maximum multiplicity `mu`, then

\[
 \min_{d\ne0}\sum_{u\in U}\left\|\frac{du}{r}\right\|^2
 \ge\frac{M^3}{12\mu^2r^2}.
 \tag{7.1}
\]

This is the centered-order argument: after multiplication by `d`, every positive absolute residue occurs at most `2mu` times.

### Theorem 7.2 — prime-block code distance

Assume the prime number theorem and Brun--Titchmarsh.  Uniformly for every prime `r<=sqrt(Y)`,

\[
 \boxed{
 D_r:=\min_{d\ne0}\sum_{s\in\mathcal S_Y}
       \left\|\frac{d s^{-1}}r\right\|^2
 \gg\frac Y{\log Y}.
 }
 \tag{7.2}
\]

Indeed,

\[
 |\mathcal S_Y|\gg\frac Y{\log Y},
 \qquad
 \mu_r\ll\frac{Y}{(r-1)\log(Y/r)},
\]

and `log(Y/r)>=1/2 log Y` in the stated range.  Substitute in (7.1).

### Corollary 7.3 — asymptotically free CRT elimination

Let

\[
 \mathcal R_X=\{r\le X:r\text{ prime}\},
 \qquad X\le\sqrt Y,
\]

and use every bipartite edge `rs` with `r in R_X`, `s in S_Y`.  For arbitrary high-coordinate shifts, Bernoulli kernels with `theta in [1/3,2/3]` satisfy

\[
 \prod_{r\in\mathcal R_X}
 \sum_{x\bmod r}\prod_{s\in\mathcal S_Y}
 |K_\theta(\alpha_{r,s}+xs^{-1}/r)|
 =1+o(1).
 \tag{7.3}
\]

A sufficient estimate is

\[
 \sum_{r\le X}r\exp(-cY/\log Y)=o(1).
\]

At the same time the reciprocal and square loads of the complete bipartite reservoir are

\[
 \Lambda_{X,Y}
 =\left(\sum_{r\le X}\frac1r\right)
  \left(\sum_{Y<s\le2Y}\frac1s\right)
 =O\!\left(\frac{\log\log X}{\log Y}\right),
 \tag{7.4}
\]

and

\[
 W_{2;X,Y}
 =\left(\sum_{r\le X}\frac1{r^2}\right)
  \left(\sum_{Y<s\le2Y}\frac1{s^2}\right)
 \asymp\frac1{Y\log Y}.
 \tag{7.5}
\]

Hence, whenever `log log X=o(log Y)`, a growing product of low CRT coordinates can be eliminated with:

- vanishing reciprocal load;
- vanishing inverse-square load;
- exponentially strong arbitrary-shift Fourier compression.

This is an **asymptotically free dimension-elimination principle**.  The reservoir is dense and canonical; no prescribed prime residue classes or sparse small-bias realization theorem is needed.

## 8. Decoded coherent skeletons

Suppose an external coherent parameter `m` determines shifts for which the expected local point `x_{r,*}=m mod r` has energy `E_r(m)`.  If

\[
 \sup_{r\le X}\frac{E_r(m)}{D_r}=o(1)
\]

uniformly in a parameter range, then Theorem 2.1 identifies `m mod r` as the unique decoded point throughout that range.  The product of all distinguished residues reconstructs a single global character, while every sibling has total mass

\[
 \le\exp(-\Omega(Y/\log Y)).
\]

This is the bridge from a quotient-level coherent label to a genuine one-dimensional Fourier skeleton.

## 9. Research significance

The extracted mechanism separates four logically different tasks:

1. **metric code design** in each local fibre;
2. **product-fibre elimination** by arbitrary-shift partition bounds;
3. **quotient-sector elimination** by entropy plus an energy floor;
4. **analysis on the decoded skeleton**, usually one-dimensional Gaussian analysis.

The first three are absolute-value arguments.  Oscillatory cancellation is needed only, if at all, on the final low-dimensional skeleton.

This architecture applies beyond prime reciprocals whenever one can supply:

- a finite phase code with large minimum distance;
- a low-load realization of its coordinates;
- a quotient energy with controlled level-set entropy;
- a localization theorem identifying coherent low-energy configurations.

Potential consumers include Bernoulli subset sums on finite abelian groups, arithmetic product graphs, sparse modular sensing, and local-limit problems with a large CRT or direct-product dual fibre.

## 10. Current boundary

Theorems 1.1--5.1 are abstract elementary consequences of their stated assumptions.  The prime-block realization uses PNT and Brun--Titchmarsh as external inputs.  No claim is made here that the combined architecture is new in every possible coding-theoretic language; a literature comparison against small-bias spaces, expander codes, polymer/cluster methods, and conditional local-limit theorems remains a separate research task.

No Lean, proof-development, corpus, manuscript, review, release, DOI, or publication status changes through this note.
