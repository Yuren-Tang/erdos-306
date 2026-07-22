# Prime-block sensor reservoirs are load--distance optimal

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / MATERIAL GENERAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

This note sharpens the prime-block realization in
`PRODUCT_CODE_PEIERLS_TRANSFER_THEOREM_V1.md`.  It proves that, within the natural
common-column scale model, the complete prime block is optimal up to absolute
constant factors simultaneously for reciprocal load and inverse-square load.

The universal lower bounds are elementary.  The matching prime-block
construction uses the prime number theorem and Brun--Titchmarsh.

## 1. Common-column sensor model

Let `R` be a nonempty finite set of primes.  Let `Y>=2`, and let `S` be a finite
multiset of `M` integers in `[Y,2Y]`, every member of which is coprime to every
`r in R`.

For `r in R`, define the cyclic energy

\[
 D_r(S)
 :=\min_{d\in(\mathbb Z/r\mathbb Z)^\times}
      \sum_{s\in S}\left\|\frac{d s^{-1}}r\right\|^2,
 \tag{1.1}
\]

where inverses and multiplication are modulo `r`.  Put

\[
 D_*(S;\mathcal R):=\min_{r\in\mathcal R}D_r(S).
 \tag{1.2}
\]

The complete bipartite reservoir `R x S` has reciprocal and square loads

\[
 \Lambda(\mathcal R,S)
 =\sum_{r\in\mathcal R}\sum_{s\in S}\frac1{rs},
 \qquad
 W_2(\mathcal R,S)
 =\sum_{r\in\mathcal R}\sum_{s\in S}\frac1{r^2s^2}.
 \tag{1.3}
\]

Write

\[
 H_1(\mathcal R)=\sum_{r\in\mathcal R}\frac1r,
 \qquad
 H_2(\mathcal R)=\sum_{r\in\mathcal R}\frac1{r^2}.
 \tag{1.4}
\]

## 2. Exact average-energy ceiling

### Lemma 2.1

For an odd prime `r` and any unit `u mod r`,

\[
 \frac1{r-1}\sum_{d\ne0\bmod r}
 \left\|\frac{du}{r}\right\|^2
 =\frac{r+1}{12r}.
 \tag{2.1}
\]

For `r=2`, the corresponding value is `1/4`.

#### Proof

For odd `r=2m+1`, multiplication by `u` permutes the nonzero residues.  Their
centered absolute representatives are

\[
 1,1,2,2,\ldots,m,m.
\]

Hence

\[
 \sum_{a=1}^{r-1}\left\|\frac ar\right\|^2
 =\frac2{r^2}\sum_{j=1}^{m}j^2
 =\frac{r^2-1}{12r}.
\]

Divide by `r-1`.  The case `r=2` is immediate.  `square`

### Corollary 2.2 — universal column bound

For every `r in R`,

\[
 D_r(S)\le
 \begin{cases}
  \dfrac{r+1}{12r}M,&r\text{ odd},\\[4pt]
  \dfrac14M,&r=2.
 \end{cases}
 \tag{2.2}
\]

In particular,

\[
 \boxed{D_*(S;\mathcal R)\le\frac M4.}
 \tag{2.3}
\]

Thus no common-column design can have cyclic energy superlinear in the number
of columns.  Energy density is absolutely bounded.

## 3. Universal load lower bounds

Since every `s in S` lies in `[Y,2Y]`,

\[
 \frac{M}{2Y}\le\sum_{s\in S}\frac1s\le\frac MY,
 \tag{3.1}
\]

and

\[
 \frac{M}{4Y^2}\le\sum_{s\in S}\frac1{s^2}\le\frac M{Y^2}.
 \tag{3.2}
\]

Consequently,

\[
 \frac{M H_1(\mathcal R)}{2Y}
 \le\Lambda(\mathcal R,S)
 \le\frac{M H_1(\mathcal R)}Y,
 \tag{3.3}
\]

and

\[
 \frac{M H_2(\mathcal R)}{4Y^2}
 \le W_2(\mathcal R,S)
 \le\frac{M H_2(\mathcal R)}{Y^2}.
 \tag{3.4}
\]

Combining these inequalities with (2.3) gives the main universal obstruction.

### Theorem 3.1 — load--distance lower bound

Every common-column scale-`Y` sensor reservoir satisfies

\[
 \boxed{
 \Lambda(\mathcal R,S)
 \ge \frac{2H_1(\mathcal R)}Y D_*(S;\mathcal R),
 }
 \tag{3.5}
\]

and

\[
 \boxed{
 W_2(\mathcal R,S)
 \ge \frac{H_2(\mathcal R)}{Y^2}D_*(S;\mathcal R).
 }
 \tag{3.6}
\]

Equivalently,

\[
 D_*(S;\mathcal R)
 \le\frac{Y}{2H_1(\mathcal R)}\Lambda(\mathcal R,S),
 \tag{3.7}
\]

and

\[
 D_*(S;\mathcal R)
 \le\frac{Y^2}{H_2(\mathcal R)}W_2(\mathcal R,S).
 \tag{3.8}
\]

#### Proof

By (2.3), `M>=4D_*`.  Substitute this in the lower bounds (3.3)--(3.4).
`square`

### Interpretation

For a common high-column reservoir at physical scale `Y`, every unit of uniform
cyclic separation has unavoidable costs

\[
 \frac{H_1(\mathcal R)}Y
 \quad\text{and}\quad
 \frac{H_2(\mathcal R)}{Y^2}
\]

in reciprocal and inverse-square load respectively.

This obstruction is independent of how cleverly the residues are selected.

## 4. Prime blocks attain the obstruction

Let

\[
 \mathcal S_Y=\{s\text{ prime}:Y<s\le2Y\},
 \qquad M_Y=|\mathcal S_Y|,
 \tag{4.1}
\]

and let

\[
 \mathcal R_X=\{r\le X:r\text{ prime}\},
 \qquad 2\le X\le\sqrt Y.
 \tag{4.2}
\]

The prime number theorem gives

\[
 M_Y\asymp\frac Y{\log Y}.
 \tag{4.3}
\]

The multiplicity-energy argument plus Brun--Titchmarsh gives, uniformly for
`r in R_X`,

\[
 D_r(\mathcal S_Y)\gg\frac Y{\log Y}\asymp M_Y.
 \tag{4.4}
\]

The universal average-energy ceiling gives the reverse bound.  Therefore

\[
 \boxed{
 D_*(\mathcal S_Y;\mathcal R_X)\asymp M_Y
 \asymp\frac Y{\log Y}.
 }
 \tag{4.5}
\]

On the other hand, (3.3)--(3.4) give

\[
 \Lambda(\mathcal R_X,\mathcal S_Y)
 \asymp\frac{H_1(\mathcal R_X)}{\log Y},
 \tag{4.6}
\]

and

\[
 W_2(\mathcal R_X,\mathcal S_Y)
 \asymp\frac{H_2(\mathcal R_X)}{Y\log Y}.
 \tag{4.7}
\]

Combining (4.5)--(4.7):

### Theorem 4.1 — simultaneous constant-factor optimality

Uniformly for `2<=X<=sqrt(Y)`,

\[
 \boxed{
 D_*(\mathcal S_Y;\mathcal R_X)
 \asymp
 \frac{Y}{H_1(\mathcal R_X)}
 \Lambda(\mathcal R_X,\mathcal S_Y)
 }
 \tag{4.8}
\]

and

\[
 \boxed{
 D_*(\mathcal S_Y;\mathcal R_X)
 \asymp
 \frac{Y^2}{H_2(\mathcal R_X)}
 W_2(\mathcal R_X,\mathcal S_Y).
 }
 \tag{4.9}
\]

Thus the complete prime block attains both universal load--distance lower bounds
up to absolute constant factors.

It is simultaneously optimal for:

1. cyclic energy per high column;
2. cyclic energy per unit reciprocal load;
3. cyclic energy per unit inverse-square load.

## 5. Natural asymptotic form

For `X->infinity`, Mertens' theorem for reciprocal primes gives

\[
 H_1(\mathcal R_X)=\log\log X+O(1),
 \tag{5.1}
\]

while

\[
 H_2(\mathcal R_X)\asymp1.
 \tag{5.2}
\]

Therefore the prime-block reservoir has

\[
 D_*\asymp\frac Y{\log Y},
 \qquad
 \Lambda\asymp\frac{\log\log X}{\log Y},
 \qquad
 W_2\asymp\frac1{Y\log Y}.
 \tag{5.3}
\]

The first quantity diverges, while both costs vanish whenever

\[
 \log\log X=o(\log Y).
\]

Theorem 3.1 shows that these costs cannot be improved in order within the
common-column scale-`Y` model while retaining the same uniform cyclic distance.

## 6. What is and is not optimized

The theorem is an optimality result inside a precise model:

- one common multiset of high columns;
- every column lies in one dyadic scale `[Y,2Y]`;
- the reservoir uses all edges `r x s`;
- performance is measured by the worst cyclic energy over `r in R`.

It does not rule out improvements obtained by:

- using different columns for different low moduli;
- mixing many physical scales;
- replacing complete bipartite incidence by an irregular sparse graph;
- exploiting cancellation rather than absolute-value compression;
- weakening uniformity in the low modulus.

Those variants define a larger design problem.  The result nevertheless shows
that the canonical dense prime block is not wasteful merely because it is dense:
within its natural common-reservoir class, its load is already best possible up
to constants.

## 7. Research significance

The lower bound and the matching construction turn the earlier qualitative
phrase “asymptotically free dimension elimination” into a sharp trade-off:

\[
 \text{uniform distance}
 \asymp
 \frac{Y}{H_1}\times\text{reciprocal load}
 \asymp
 \frac{Y^2}{H_2}\times\text{square load}.
\]

This is independent of the semiprime application.  It is a finite harmonic
sensing theorem for a family of cyclic groups realized by arithmetic columns.

No Lean, proof-development, corpus, manuscript, review, release, DOI, or
publication status changes through this note.
