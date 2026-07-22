# E306-PD-PAPER-FIRST-01 — standalone Lean-independent human proof

**State:** `READY-FOR-PAPER-FIRST-MANUSCRIPT`  
**Scope:** complete proof of Erdős Problem 306, with no appeal to a formal
certificate or a previous manuscript  
**External input:** the prime number theorem

## 1. Statement and elementary reductions

A **squarefree semiprime** is an integer `pq`, where `p` and `q` are distinct
primes.

### Theorem 1

Let `q=a/b>0` be in lowest terms. Then `q` is a finite sum of reciprocals of
distinct squarefree semiprimes if and only if `b` is squarefree.

### Necessity

If `A` is a finite set of squarefree integers and `M=lcm(A)`, then

\[
 \sum_{n\in A}\frac1n=
 \frac{\sum_{n\in A}M/n}{M}.
\]

The reduced denominator divides `M`. An lcm of squarefree integers is
squarefree, and every divisor of a squarefree integer is squarefree. This proves
necessity.

For sufficiency we use an avoiding form. For a finite set `T`, write
`Rep_T(r)` when there is a finite set `A` of squarefree semiprimes, disjoint from
`T`, whose reciprocal sum is `r`.

### Lemma 2 — numerator induction

If `Rep_T(1/b)` holds for every finite `T`, then `Rep_T(a/b)` holds for every
integer `a>=1` and every finite `T`.

**Proof.** Induct on `a`. Having represented `a/b` by `A`, apply the unit
statement with forbidden set `T union A`. The new representation is disjoint
from the old one, and the reciprocal sums add. ∎

### Lemma 3 — the cases `b=1,2`

It is enough to prove the avoiding unit statement for squarefree `b>=3`.

**Proof.** Construct the representations successively, enlarging the forbidden
set after every step. The identities

\[
 \frac12=\frac13+\frac16,
 \qquad
 1=\frac12+\frac13+\frac16
\]

reduce `b=2` and `b=1` to squarefree denominators at least `3`. ∎

It remains to prove the following theorem.

### Theorem 4 — avoiding unit representation

Let `b>=3` be squarefree and let `T` be finite. Then `Rep_T(1/b)` holds.

The rest of the file proves Theorem 4.

## 2. Prime supply on one fixed power interval

Put `X=2^n`, where `n` will be chosen at the end, and define

\[
 P_k=\{p\text{ prime}:2^k\le p<2^{k+1}\}
 \quad(n\le k<3n),
\]

\[
 \mathcal P=\bigcup_{k=n}^{3n-1}P_k
            =\{p\text{ prime}:X\le p<X^3\}.
\]

All limits below are taken as `n`, equivalently `X`, tends to infinity.

### Lemma 5 — uniform block density

There are absolute constants `c_0,C_0>0` such that, for all sufficiently large
`n` and every `n<=k<3n`,

\[
 c_0\frac{2^k}{k}
 \le |P_k|\le
 C_0\frac{2^k}{k}.
\]

**Proof.** The PNT gives

\[
 \pi(2x)-\pi(x)=\frac{x}{\log x}(1+o(1)).
\]

Use the tail-uniform error

\[
 \varepsilon(Y)=\sup_{x\ge Y}
 \left|\frac{(\pi(2x)-\pi(x))\log x}{x}-1\right|.
\]

It tends to zero. Taking `Y=2^n`, the same two-sided estimate therefore holds
for every `x=2^k` with `k>=n`. Since `log(2^k)=k log2`, fixed constants
`c_0,C_0` work simultaneously for all the required blocks. ∎

### Lemma 6 — reciprocal load of the power interval

Let

\[
 S_X=\sum_{p\in\mathcal P}\frac1p,
 \qquad U_X=\sum_{p\in\mathcal P}\frac1{p^2}.
\]

Then

\[
 S_X=\log3+o(1),
 \qquad U_X=O\!\left(\frac1{X\log X}\right).
\]

**Proof.** Abel summation gives, for `Y=X^3`,

\[
 \sum_{X\le p<Y}\frac1p
 =\frac{\pi(Y)}Y-\frac{\pi(X)}X
  +\int_X^Y\frac{\pi(t)}{t^2}\,dt+o(1).
\]

The endpoint convention changes at most two terms and is immaterial. Write

\[
 \pi(t)=\frac{t}{\log t}(1+\delta_X(t)),
 \qquad
 \sup_{t\ge X}|\delta_X(t)|\longrightarrow0.
\]

The two boundary terms are `O(1/log X)`. Uniformly on `[X,X^3]`, the error in
the integral is at most

\[
 o(1)\int_X^{X^3}\frac{dt}{t\log t}=o(1).
\]

The main integral is

\[
 \int_X^{X^3}\frac{dt}{t\log t}
 =\log\log(X^3)-\log\log X=\log3.
\]

This proves the first assertion.

For the second, Lemma 5 gives

\[
 \sum_{p\in P_k}\frac1{p^2}
 \le |P_k|2^{-2k}
 \le \frac{C_0}{k2^k}.
\]

The ratio of consecutive terms is eventually below `3/4`, so summing from
`k=n` gives

\[
 U_X\le\frac{C}{n2^n}
      =O\!\left(\frac1{X\log X}\right).
\]
∎

## 3. The denominator family

Let

\[
 E_{\rm pair}=\{pq:p,q\in\mathcal P,\ p<q\}.
\]

Later we shall choose an integer `G` and a set `\mathcal G` of exactly `G`
primes in the top block `P_{3n-1}`. Define

\[
 E_{\rm aux}=\{rs:r\mid b\text{ prime},\ s\in\mathcal G\},
 \qquad E=E_{\rm pair}\mathbin{\dot\cup}E_{\rm aux}.
\]

Choose `n` large enough that every prime in `mathcal P` is larger than every
prime divisor of `b` and that `X^2>max(T)`. Unique factorization then shows:

- every member of `E` is a squarefree semiprime;
- all members of `E` are distinct;
- `E` is disjoint from `T`;
- every `e in E` divides
  \[
   L=b\prod_{p\in\mathcal P}p.
  \]

The reciprocal load of the pair family is exactly

\[
 \Lambda_{\rm pair}
 =\sum_{p<q}\frac1{pq}
 =\frac{S_X^2-U_X}{2}
 \longrightarrow \lambda_0:=\frac{(\log3)^2}{2}.
\]

Since `1/3<lambda_0<1`, fix once and for all

\[
 \frac13<\lambda_-<\lambda_0<\lambda_+<1.
\]

For fixed `b` and `G`, the auxiliary load tends to zero, because

\[
 \sum_{rs\in E_{\rm aux}}\frac1{rs}
 =\left(\sum_{r\mid b\atop r\ {m prime}}\frac1r\right)
  \left(\sum_{s\in\mathcal G}\frac1s\right)
 \le C_bG2^{-(3n-1)}.
\]

Thus, after increasing `n`,

\[
 \lambda_-<\Lambda:=\sum_{e\in E}\frac1e<\lambda_+.
\]

Set

\[
 \theta=\frac1{b\Lambda}.
\]

Because `b>=3`, `lambda_->1/3`, and `lambda_+<1`, the parameter `theta` belongs
to the compact interval

\[
 I_b=\left[\frac1{b\lambda_+},\frac1{b\lambda_-}\right]
 \Subset(0,1).
\]

In particular

\[
 \sum_{e\in E}\frac{\theta}{e}=\frac1b,
 \qquad
 \sum_{e\in E}\frac1e<1.
\]

Define

\[
 \nu_b=\min_{t\in I_b}t(1-t)>0.
\]

## 4. Finite Fourier inversion

Give each subset `A subset E` the product weight

\[
 w(A)=\theta^{|A|}(1-\theta)^{|E\setminus A|}.
\]

Let `W` be the total weight of subsets satisfying

\[
 \sum_{e\in A}\frac Le\equiv\frac Lb\pmod L.
\]

Character orthogonality on `Z/LZ` gives

\[
 LW=\sum_{h\bmod L}F(h),
\]

where

\[
 F(h)=
 \prod_{e\in E}\left((1-\theta)+\theta e^{2\pi ih/e}\right)
 e^{-2\pi ih/b}.
\]

For every real `t`,

\[
 |(1-\theta)+\theta e^{2\pi it}|^2
 =1-4\theta(1-\theta)\sin^2(\pi t).
\]

Since `sin(pi x)>=2x` for `0<=x<=1/2`,

\[
 \sin^2(\pi t)\ge4\|t\|_{\mathbb R/\mathbb Z}^2.
\]

Using `1-u<=e^{-u}` and taking square roots yields

\[
 |F(h)|\le
 \exp\left(-c_bQ_E(h)\right),
 \qquad
 c_b=8\nu_b,
\]

where

\[
 Q_E(h)=\sum_{e\in E}\|h/e\|_{\mathbb R/\mathbb Z}^2.
\]

The remaining task is to find a real collection of major frequencies whose sum
is larger than the absolute sum over all other frequencies.

## 5. The centred-CRT scaffold

For each block assignment

\[
 a=(a_p)_{p\in\mathcal P},\qquad a_p\in\mathbb Z/p\mathbb Z,
\]

and distinct primes `p,q`, let `H_{pq}(a)` be the unique integer satisfying

\[
 H_{pq}\equiv a_p\pmod p,
 \quad H_{pq}\equiv a_q\pmod q,
 \quad -pq/2<H_{pq}\le pq/2.
\]

Use the graph

\[
 \mathcal C=
 \bigcup_{k=n}^{3n-1}\{(p,q):p,q\in P_k,p<q\}
 \cup
 \bigcup_{k=n}^{3n-2}(P_k\times P_{k+1}).
\]

Define

\[
 Q(a)=\sum_{(p,q)\in\mathcal C}
       \left(\frac{H_{pq}(a)}{pq}\right)^2,
 \qquad
 \sigma^2=\sum_{(p,q)\in\mathcal C}\frac1{p^2q^2}.
\]

If `a(h)_p=h mod p`, then the centred representative of `h mod pq` is
`H_{pq}(a(h))`; hence

\[
 Q(a(h))\le Q_E(h).
\]

For later use, write `sigma_k^2` for the internal contribution of block `P_k`.
Lemma 5 and the dyadic location of its primes give constants `c_1,C_1>0` such
that

\[
 \frac{c_1}{k^2 2^{2k}}
 \le\sigma_k^2\le
 \frac{C_1}{k^2 2^{2k}}.
\]

Indeed, the lower bound uses `binom(|P_k|,2)` pairs, each with `pq<2^{2k+2}`;
the upper bound uses at most `|P_k|^2/2` pairs, each with `pq>=2^{2k}`.
The adjacent-block contributions have the same upper order. A geometric sum
therefore gives

\[
 \sigma^2\le C_2\sigma_n^2,
 \qquad
 \sigma\ge\frac{c_2}{nX},
 \qquad \sigma\longrightarrow0.
\]

## 6. Deterministic reciprocal dispersion

The next lemma is the arithmetic engine behind every rigidity statement.

### Lemma 7 — dispersion in one block

Let `q` be prime with `X<=q<4X`, and let `F` be a set of `s>=16` primes in
`[X,2X)`, none equal to `q`. Let `d` be nonzero modulo `q`. For every `p in F`,
let `pbar` denote the inverse of `p modulo q`, and put

\[
 \phi_p=\left\|\frac{d\bar p}{q}\right\|.
\]

Then

\[
 \sum_{p\in F}\phi_p^2\ge c_D\frac{s^3}{X^2}
\]

for an absolute constant `c_D>0`.

**Proof.** Put `delta=s/(64X)`. If `phi_p<=delta`, there is an integer `ell` for
which

\[
 v=d\bar p-\ell q,
 \qquad |v|\le\delta q\le4\delta X=s/16,
\]

and `vp congruent d mod q`. For a fixed integer `v`, the congruence determines
one residue class for `p modulo q`, because `q` does not divide `v` (otherwise it
would divide `d`). An interval of length `X<=q` contains at most two integers in
one residue class modulo `q`. There are at most `2(s/16)+1` possible values of
`v`. Thus fewer than `s/2` primes can satisfy `phi_p<=delta`. At least `s/2`
terms are larger than `delta`, and therefore

\[
 \sum_{p\in F}\phi_p^2
 \ge\frac s2\left(\frac{s}{64X}\right)^2.
\]

Take `c_D=1/(2*64^2)`. ∎

## 7. Rigidity inside one block

Let `P subset [X,2X)` be a prime block of size `N`, with
`cX/logX<=N<=CX/logX`. Define

\[
 Q_P(a)=\sum_{p<q\in P}(H_{pq}(a)/(pq))^2.
\]

Fix `0<rho<1/4`. A label `m` is dominant if

\[
 |m|\le X^2/2,
 \qquad
 |\{p\in P:a_p\equiv m\pmod p\}|\ge(1-\rho)N.
\]

Two dominant labels are equal. Their agreement classes intersect in more than
`N/2` vertices, hence contain two distinct primes `p,q`. Their product divides
the difference of the labels, while its absolute value is at most `X^2` and
`pq>X^2` for large dyadic `X`.

### Lemma 8 — cross-label energy

Let `C_m,C_{m'}` be two disjoint label classes with `m!=m'`, each label of
absolute value at most `B`. Suppose

\[
 |C_m|\ge128B/X,
 \qquad |C_{m'}|\ge2,
 \qquad B<X^2/4.
\]

Then

\[
 \sum_{p\in C_m}\sum_{q\in C_{m'}}
 \left(\frac{H_{pq}}{pq}\right)^2
 \ge c_E\frac{|C_m|^3(|C_{m'}|-1)}{X^2}
\]

for an absolute constant `c_E>0`.

**Proof.** Put `d=m'-m`. At most one prime `q in C_{m'}` divides `d`: two such
primes would have product greater than `X^2`, while `0<|d|<X^2/2`.
Fix a remaining `q`. For `p in C_m`, write `H_{pq}=m+jp`. Reducing modulo `q`
gives `jp congruent d mod q`, so

\[
 \left\|\frac{d\bar p}{q}\right\|
 =\left\|\frac{H_{pq}-m}{pq}\right\|
 \le\frac{|H_{pq}|}{pq}+\frac{|m|}{pq}.
\]

Apply Lemma 7 to `F=C_m`. With `delta=|C_m|/(64X)`, at least half the `p` have
left side greater than `delta`. The size assumption gives

\[
 \frac{|m|}{pq}\le\frac{B}{X^2}
 \le\frac{|C_m|}{128X}=\frac\delta2.
\]

For those primes, `|H_{pq}|/(pq)>=delta/2`. The energy for this `q` is therefore
at least

\[
 \frac{|C_m|}{2}\left(\frac{|C_m|}{128X}\right)^2.
\]

Sum over all but at most one `q`. ∎

### Proposition 9 — nondominance has a forcing cost

There is `c_w>0` such that, for all sufficiently large `X`,

\[
 Q_P(a)<c_w\frac{X}{\log^3X}
\]

implies that `a` has a unique dominant label.

**Proof.** Suppose `Q_P(a)<=R` and no dominant label exists. Choose

\[
 B=A_\rho\sqrt R\frac{X^2}{N},
\]

where `A_rho` is a sufficiently large fixed constant. Call a pair bad when
`|H_{pq}|>B`. Since `pq<4X^2`, every bad pair contributes more than
`B^2/(16X^4)`. Hence

\[
 \#\{\text{bad pairs}\}\le\frac{16RX^4}{B^2}.
\]

The sum of bad degrees is twice this number. Some base prime `p_0` therefore has
bad degree at most

\[
 \frac{32RX^4}{B^2N}
 =\frac{32}{A_\rho^2}N.
\]

Choose `A_rho` so this is at most `rho N/8`.

For every nonbad neighbour `q`, set `ell(q)=H_{p_0q}`. Then

\[
 |\ell(q)|\le B,
 \qquad a_q\equiv\ell(q)\pmod q,
 \qquad \ell(q)\equiv a_{p_0}\pmod{p_0}.
\]

All the labels lie in one residue class modulo `p_0`, so the number `M` of
possible labels is at most

\[
 M\le 2B/X+2.
\]

Apart from `p_0` and at most `rho N/8` bad neighbours, the vertices are
partitioned into these label classes.

Assume for contradiction that

\[
 R<c\frac{X}{\log^3X}
\]

with `c` sufficiently small. Then `B<X^2/4` for large `X`, so any class of size
at least `(1-rho)N` would be dominant. No such class exists.

Call a class small when its size is less than

\[
 s_0=256(B/X+1).
\]

There are two cases.

**Case 1: small classes contain at least `rho N/4` vertices.** Since there are at
most `M` classes,

\[
 \rho N/4\le Ms_0\le C_\rho(B/X+1)^2.
\]

If `B/X<1`, the right side is bounded while `N` tends to infinity, impossible.
Otherwise substitute `B=A_rho sqrt(R)X^2/N` to obtain

\[
 N\le C_\rho\frac{RX^2}{N^2},
 \qquad
 R\ge c_\rho\frac{N^3}{X^2}
 \ge c'_\rho\frac{X}{\log^3X}.
\]

**Case 2: small classes contain less than `rho N/4` vertices.** The substantial
classes contain at least `(1-rho/2)N` vertices after the uncovered vertices are
also deducted. Their largest class has size at most `(1-rho)N`, so a fixed
positive proportion of their mass lies outside a largest class.

For distinct substantial classes, Lemma 8 applies. If their sizes are
`n_1,...,n_t` and `S=sum n_i`, summing its conclusion gives

\[
 R\ge\frac{c_E}{X^2}\sum_i n_i^3(S-n_i-O(1)).
\]

For large `N`, the `O(1)` is absorbed. If the largest class is at least `S/2`,
its term alone is at least `c_rho S^4/X^2`. Otherwise every
`S-n_i>=S/2`, and power mean gives

\[
 \sum_i n_i^3\ge\frac{S^3}{t^2}\ge\frac{S^3}{M^2}.
\]

In either case,

\[
 R\ge c_\rho\frac{N^4}{M^2X^2}.
\]

If `B/X<1`, this is much larger than `X/log^3X`. Otherwise
`M^2<=C_rho RX^2/N^2`, and hence

\[
 R^2\ge c_\rho\frac{N^6}{X^4},
 \qquad
 R\ge c_\rho\frac{N^3}{X^2}
 \ge c'_\rho\frac{X}{\log^3X}.
\]

Both cases contradict the assumed strict upper bound when `c` is smaller than
the constants just obtained. Choose such a `c` as `c_w`. ∎

### Proposition 10 — cold blocks are exactly labelled

After decreasing `c_w` if necessary and increasing the scale threshold, every
assignment with

\[
 Q_P(a)<c_wX/\log^3X
\]

has an integer `m` such that

\[
 a_p\equiv m\pmod p\quad\text{for every }p\in P,
\]

and

\[
 |m|\le C_\rho\frac{\sqrt{Q_P(a)}}{\sigma_P},
 \qquad \sigma_P^2=\sum_{p<q\in P}\frac1{p^2q^2}.
\]

**Proof.** Proposition 9 gives a dominant label `m` and a class `C` of size at
least `(1-rho)N`. For `p,q in C`, the size condition in the definition of
dominance gives `2|m|<pq`; hence the centred CRT lift is exactly `m`. Therefore

\[
 Q_P(a)\ge m^2\sum_{p<q\in C}\frac1{p^2q^2}.
\]

Because all primes lie in `[X,2X)` and `|C|>=(1-rho)N`, the sum over `C` is at
least a fixed `rho`-dependent multiple of `sigma_P^2`. This proves the label
bound.

Let `E=P\setminus C`. For `q in E`, the residue difference between `a_q` and `m`
is nonzero modulo `q`. The preceding label bound and the cold upper bound imply,
for sufficiently large `X`,

\[
 |m|\le |C|X/128.
\]

Apply Lemma 7 to `F=C` and argue exactly as in Lemma 8. The cross energy from
`q` to `C` is at least `c|C|^3/X^2`. These edge sets are disjoint for distinct
`q`, so

\[
 |E|\,c\frac{|C|^3}{X^2}\le Q_P(a).
\]

Using `|C|>=cN` and `N>=cX/logX`,

\[
 |E|\le C_\rho Q_P(a)\frac{X^2}{N^3}
      <C'_\rho c_w.
\]

Choose `c_w` so that the last quantity is below `1`. Since `|E|` is an integer,
`E` is empty. ∎

## 8. Fingerprint entropy for energetic blocks

The global count also needs a direct bound for blocks whose energy is above the
cold threshold.

### Lemma 11 — fingerprint rigidity

Fix a subset `F subset P` of size `s>=16` and fix the residues on `F`. For a
prime `q in P\setminus F` and a candidate residue `w mod q`, put

\[
 t_q(w)=\sum_{p\in F}\left(\frac{H_{pq}(a_p,w)}{pq}\right)^2.
\]

There is an absolute `g>0` such that at most one residue `w mod q` satisfies

\[
 t_q(w)<g\frac{s^3}{X^2}.
\]

**Proof.** Suppose `w!=w'`. Let `d=w-w'` as a nonzero residue modulo `q`. For
`p in F`, the difference of the two CRT lifts is divisible by `p`; writing it as
`pj` and reducing modulo `q` gives `jp congruent d mod q`. Hence

\[
 \left\|\frac{d\bar p}{q}\right\|
 =\left\|\frac{H_{pq}(a_p,w)-H_{pq}(a_p,w')}{pq}\right\|
 \le\frac{|H_{pq}(a_p,w)|}{pq}
   +\frac{|H_{pq}(a_p,w')|}{pq}.
\]

After squaring and summing,

\[
 \sum_{p\in F}\left\|\frac{d\bar p}{q}\right\|^2
 \le2t_q(w)+2t_q(w').
\]

Lemma 7 gives a lower bound `c_Ds^3/X^2`. Taking `g<c_D/4` makes it impossible
for both `t_q(w)` and `t_q(w')` to be below `gs^3/X^2`. ∎

### Proposition 12 — block entropy above the forcing floor

For every `epsilon>0`, all sufficiently large blocks satisfy

\[
 \#\{a:Q_P(a)\le R\}\le e^{\epsilon R}
\]

whenever

\[
 R\ge c_wX/\log^3X.
\]

The scale threshold may depend on `epsilon` and `c_w`, but not on `R`.

**Proof.** First suppose

\[
 R\le c_*N^4/X^2
\]

for a sufficiently small fixed `c_*`. Choose

\[
 s=\left\lceil A(RX^2)^{1/4}\right\rceil
\]

with fixed `A` large enough. For large `X`, the lower bound on `R` gives
`s>=16`, and the displayed upper bound gives `s<=N/2`. Fix any predetermined
set `F subset P` of size `s`.

There are at most `(2X)^s` assignments on `F`. For a complete assignment, the
cross energy satisfies

\[
 \sum_{q\in P\setminus F}t_q(a_q)\le Q_P(a)\le R.
\]

By Lemma 11, all but at most

\[
 t\le\frac{RX^2}{gs^3}\le C_As
\]

vertices `q` must take the unique low-energy residue determined by the
fingerprint. Choose the exceptional vertices and their residues. Their number of
possibilities is at most

\[
 \sum_{j\le t}\binom Nj(2X)^j
 \le\exp(C(s+t)\log X).
\]

Thus the total logarithmic count is at most

\[
 C'(RX^2)^{1/4}\log X.
\]

Dividing by `R`, and using `R>=c_wX/log^3X`, gives

\[
 \frac{C'(RX^2)^{1/4}\log X}{R}
 \le C''_{c_w}\frac{\log^{13/4}X}{X^{1/4}}
 \longrightarrow0.
\]

It is therefore below `epsilon` for all sufficiently large `X`.

Now suppose `R>c_*N^4/X^2`. The trivial number of assignments is at most

\[
 \prod_{p\in P}p\le(2X)^N,
\]

whose logarithm is `O(N logX)=O(X)`. On the other hand,

\[
 R\gg N^4/X^2\gg X^2/\log^4X,
\]

so `O(X)<=epsilon R` for large `X`. This proves the second case and the
proposition. ∎

## 9. Propagation between neighbouring blocks

Call block `k` **hot** if

\[
 Q_k(a)\ge w_k:=c_w\frac{2^k}{k^3};
\]

otherwise it is cold. Proposition 10 assigns every cold block one exact integer
label `m_k`.

### Lemma 13 — adjacent labels pay energy

There is `c_A>0` such that, for sufficiently large `k`, if blocks `P_k` and
`P_{k+1}` are cold and `m_k!=m_{k+1}`, then their bipartite scaffold energy is at
least

\[
 \Pi_k=c_A\frac{|P_k|^3(|P_{k+1}|-1)}{2^{2k}}.
\]

In particular `Pi_k>>2^{2k}/k^4`.

**Proof.** Put `X=2^k`, `m=m_k`, `m'=m_{k+1}`, and `d=m'-m`. The label bound in
Proposition 10 implies, for large `k`,

\[
 |m|\le |P_k|X/128,
 \qquad |d|<4X^2.
\]

At most one prime `q in P_{k+1}` divides `d`, since two distinct such primes have
product greater than `4X^2`. For every other `q`, repeat the proof of Lemma 8
with `F=P_k`. The interval containing `P_k` has length `X<=q`, so Lemma 7
applies. It gives energy at least `c|P_k|^3/X^2` for each such `q`. Summation
over `|P_{k+1}|-1` primes proves the formula. Lemma 5 gives the final asymptotic
lower bound. ∎

## 10. Global level-set theorem

Let `J=2n` be the number of blocks and

\[
 \mathcal L(R)=\{a:Q(a)\le R\}.
\]

### Proposition 14 — global level sets

For every `gamma>0`, there are `A_gamma` and `n_gamma` such that, for
`n>=n_gamma` and `R>=1`,

\[
 |\mathcal L(R)|
 \le e^{A_\gamma J}e^{\gamma R}
 \left(1+\frac{\sqrt R}{\sigma}\right).
\]

**Proof.** We give an explicit injective encoding and count every layer.

For each block record

\[
 r_k=\lfloor Q_k(a)\rfloor.
\]

Since the internal energies are disjoint sub-sums of `Q(a)`,
`sum r_k<=R`. Record also the hot-block set `H` and the set `B` of boundaries
between consecutive cold blocks having different labels.

On a hot block `k`, Proposition 12 applied with upper energy `r_k+1` shows that,
for any fixed `delta>0` and sufficiently large `n`, the entire local assignment
has at most

\[
 e^{\delta(r_k+1)}
\]

possibilities.

On a cold block, Proposition 10 says that every coordinate is the residue of one
integer label. Consecutive cold blocks outside `B` have the same label. Thus it
is enough to record one label at the beginning `s` of every maximal cold
segment. The block label bound gives

\[
 |m_s|\le C\frac{\sqrt{r_s+1}}{\sigma_s}.
\]

There is at most one segment not preceded by a hot block or a boundary: the
initial segment beginning at `n`. Since `sigma<=C sigma_n`, its label has at most

\[
 C\left(1+\frac{\sqrt R}{\sigma}\right)
\]

possibilities.

Consider any later segment beginning at `s`. It is preceded either by a hot
block `s-1` or by a boundary `s-1`. For every fixed `delta>0`,

\[
 \log(1+\sqrt u)\le\delta u+C_\delta
 \quad(u\ge0).
\]

Also the estimates for `sigma_s` give

\[
 \log(1+C/\sigma_s)\le C's.
\]

The hot charge `w_{s-1}>>2^s/s^3` and the boundary charge
`Pi_{s-1}>>2^{2s}/s^4` both eventually exceed `C's/delta`. Therefore the number
of choices for the new label is at most

\[
 \exp\bigl(\delta(r_s+1)+\delta\chi_{s-1}\bigr),
\]

where `chi_{s-1}` is `w_{s-1}` in the hot case and `Pi_{s-1}` in the boundary
case.

The trigger charges are disjointly paid:

\[
 \sum_{k\in H}w_k\le\sum_kQ_k(a)\le R,
\]

and, by Lemma 13 and disjointness of adjacent-block edge sets,

\[
 \sum_{k\in B}\Pi_k\le R.
\]

The shell vectors themselves have the following count. For every `delta>0`,

\[
 \#\{(r_k):r_k\ge0,\sum r_k\le R\}
 \le e^{\delta R}
     \prod_{k=n}^{3n-1}\sum_{j\ge0}e^{-\delta j}
 =e^{\delta R}(1-e^{-\delta})^{-J}.
\]

Finally, there are at most `2^J` choices for `H` and at most `2^J` choices for
`B`. Once the recorded hot assignments and segment labels are fixed, every
prime coordinate is reconstructed, so the code is injective.

Multiplying the bounds gives

\[
 |\mathcal L(R)|
 \le C\left(1+\frac{\sqrt R}{\sigma}\right)
    \exp(C_1\delta R+C_2\delta J+C_3(\delta)J).
\]

Choose `delta` so that `C_1delta<gamma` and absorb the remaining per-block
constants into `A_gamma`. This proves the proposition. ∎

## 11. Localization and tails

Put

\[
 \mathcal F_0=\min\left(w_n,\min_{n\le k<3n-1}\Pi_k\right).
\]

The bounds above show that eventually `mathcal F_0=w_n` and

\[
 \mathcal F_0\gg X/n^3.
\]

For `C>=1`, let `mathfrak M(C)` be the set of assignments for which there is an
integer `m`, `|m|<=C/sigma`, satisfying `a_p congruent m mod p` for every
`p in mathcal P`.

### Lemma 15 — localization below the floor

If `Q(a)<mathcal F_0`, then all blocks are cold, no boundary occurs, and one
integer `m` represents every coordinate. Moreover

\[
 Q(a)=m^2\sigma^2.
\]

**Proof.** A hot block would contribute at least `w_k>=w_n`; a differing cold
boundary would contribute at least `Pi_k>=mathcal F_0`. Hence every block is
cold and all their exact labels agree. Proposition 10 and the estimate
`Q_n<mathcal F_0` give

\[
 |m|\le C\frac{\sqrt{\mathcal F_0}}{\sigma_n}
 \ll X^{3/2}/\sqrt n=o(X^2).
\]

Thus `2|m|<pq` for every scaffold edge, whose smallest product exceeds `X^2`.
The centred CRT lift on every edge is exactly `m`; summing gives the identity. ∎

### Proposition 16 — global CRT tail

For every `c>0` and `eta>0`, there are `K_c>0` and `n_0` such that, for
`n>=n_0` and every `C>=1`,

\[
 \sum_{a\notin\mathfrak M(C)}e^{-cQ(a)}
 \le\frac{\eta+K_ce^{-cC^2/2}}{\sigma}.
\]

**Proof.** Choose `gamma<c/4` in Proposition 14. Decompose the sector
`Q>=mathcal F_0` into unit shells. Proposition 14 gives

\[
 \sum_{Q(a)\ge\mathcal F_0}e^{-cQ(a)}
 \le\frac{C}{\sigma}e^{A_\gamma J}
     \sum_{j\ge\lfloor\mathcal F_0\rfloor}
     (1+\sqrt{j+1})e^{-(c-\gamma)j}.
\]

The elementary integral comparison for a decreasing exponential times a
polynomial gives

\[
 \sum_{j\ge M}(1+\sqrt{j+1})e^{-(c-\gamma)j}
 \le C_c e^{-(c-2\gamma)M}
\]

for large `M`. Since `J=2n` and
`mathcal F_0>>2^n/n^3`,

\[
 (c-2\gamma)\mathcal F_0-A_\gamma J\longrightarrow+\infty.
\]

Indeed `2^n/n^4` tends to infinity, so the first term eventually exceeds any
fixed multiple of `n`. Hence the high-floor sum is at most `eta/sigma`.

By Lemma 15, every remaining assignment outside `mathfrak M(C)` is represented
by an integer `m` with `|m|>C/sigma` and energy `m^2sigma^2`. This label is
unique: Lemma 15 bounds it by `o(X^2)`, whereas the difference of two labels
representing the same assignment is divisible by two distinct bottom-block
primes and hence, if nonzero, has absolute value greater than `X^2`. Therefore

\[
 \sum e^{-cQ(a)}
 \le\sum_{|m|>C/\sigma}e^{-cm^2\sigma^2}.
\]

Split the exponent in half. The first half is at most `e^{-cC^2/2}`. For the
second half, monotonicity and a Gaussian integral give

\[
 \sum_{m\in\mathbb Z}e^{-(c/2)m^2\sigma^2}
 \le1+2\int_0^\infty e^{-(c/2)t^2\sigma^2}\,dt
 \le\frac{K_c}{\sigma}
\]

once `sigma<=1`. Adding the two sectors proves the proposition. ∎

## 12. Variance comparison for the full denominator family

Define

\[
 \sigma_E^2=\theta(1-\theta)\sum_{e\in E}\frac1{e^2}.
\]

Since the scaffold edges belong to `E_pair` and `theta(1-theta)>=nu_b`,

\[
 \sigma_E^2\ge\nu_b\sigma^2.
\]

For the upper bound, Lemma 6 and the block calculation give

\[
 \sum_{p\in\mathcal P}\frac1{p^2}
 \le\frac{C}{nX}.
\]

Hence

\[
 \sum_{p<q\in\mathcal P}\frac1{p^2q^2}
 \le\frac12\left(\sum_{p\in\mathcal P}\frac1{p^2}\right)^2
 \le\frac{C}{n^2X^2}.
\]

The auxiliary square load is at most `C_{b,G}X^{-6}`. The ratio of this
quantity to the bottom-block lower bound `c/(n^2X^2)` tends to zero for every
fixed finite `G`. Consequently one may fix, **before choosing `G`**, a constant
`K_b` larger than the pair-family comparison constant; after `G` is chosen, the
final scale is increased until the auxiliary contribution fits inside the spare
unit of this constant. Thus

\[
 \sqrt{\nu_b}\,\sigma\le\sigma_E\le K_b\sigma.
\]

The value of `K_b` is independent of the later reservoir size; only its scale
threshold depends on `G`. This comparison follows from the natural full-pair
family, so no large finite certificate is required.

## 13. Major frequencies

Choose `C` later and put

\[
 N=\lceil C/\sigma\rceil.
\]

For `|m|<=N`, define

\[
 T_m=F(m).
\]

Because `theta` remains in the fixed compact interval `I_b`, there are constants
`r_b>0` and `M_b<infinity` such that, for `|z|<=r_b`, the principal logarithm is
defined and

\[
 \log((1-\theta)+\theta e^{2\pi iz})
 =2\pi i\theta z
  -2\pi^2\theta(1-\theta)z^2+R_\theta(z),
 \qquad |R_\theta(z)|\le M_b|z|^3.
\]

This is ordinary Taylor's theorem on a compact set disjoint from the zero of the
factor.

The least denominator in `E` is at least `X^2`. Also

\[
 \sum_{e\in E}\frac1{e^2}\le K\sigma^2.
\]

Consequently, uniformly for `|m|<=N`,

\[
 \max_e|m/e|\le\frac{2C}{\sigma X^2}
 \ll_C\frac nX\longrightarrow0,
\]

and

\[
 \sum_e|m/e|^3
 \le\frac{|m|^3}{X^2}\sum_e\frac1{e^2}
 \le\frac{C_bC^3}{\sigma X^2}
 \ll_{b,C}\frac nX\longrightarrow0.
\]

Thus the Taylor expansion is valid and the aggregate remainder has absolute
value at most a fixed small `delta_0`. The linear term cancels exactly because
`sum theta/e=1/b`. We obtain

\[
 \log T_m=-2\pi^2m^2\sigma_E^2+\delta_m,
 \qquad |\delta_m|\le\delta_0.
\]

Taking `delta_0` small enough gives a constant `a_b>0` with

\[
 \Re T_m\ge a_b e^{-2\pi^2m^2\sigma_E^2}.
\]

Conjugation pairs `m` and `-m`, so the major sum is real. Choose
`C>1/\sqrt{\nu_b}`. Then

\[
 \frac1{2\sigma_E}\le\frac1{2\sqrt{\nu_b}\sigma}<N.
\]

For all integers in this smaller interval the Gaussian is at least
`e^{-pi^2/2}`. Since `sigma_E` tends to zero, the interval contains at least
`1/(2sigma_E)` integers. Therefore

\[
 \Re\sum_{|m|\le N}T_m\ge\frac{c_{\rm maj}}{\sigma_E}
\]

for a fixed `c_maj=c_maj(b)>0`.

## 14. The two minor sectors

For large `n`, `2N+1<L`, so the residues of the integers `|m|<=N` are distinct.
Let `S_M` be this set and `S_m` its complement.

For a frequency `h`, let `a(h)` be its block assignment. Split

\[
 S_{\rm blk}=\{h\in S_m:a(h)\notin\mathfrak M(C)\},
\]

\[
 S_{\rm sib}=\{h\in S_m:a(h)\in\mathfrak M(C)\}.
\]

These are disjoint and cover `S_m`.

### Block-minor sector

Fixing all block residues fixes `h modulo P=prod_{p in mathcal P}p`. Since
`L=bP`, there are exactly `b` lifts modulo `L`. Proposition 16 and
`Q(a(h))<=Q_E(h)` give

\[
 \sum_{h\in S_{\rm blk}}|F(h)|
 \le\frac{b(\eta+K_{c_b}e^{-c_bC^2/2})}{\sigma}.
\]

### Sibling sector

For `h in S_sib`, there is a unique integer `m`, `|m|<=C/sigma<=N`, such that

\[
 h\equiv m\pmod p\qquad(p\in\mathcal P).
\]

Uniqueness follows because two such integers differ by every block prime while
their difference is `O(nX)`, smaller than the product of two bottom-block
primes.

The frequency is not the genuine main residue `m modulo L`. It therefore differs
from `m modulo b`. Since `b` is squarefree, there is a prime `r|b` such that

\[
 h\not\equiv m\pmod r.
\]

Choose the reservoir `mathcal G` so that every `s in mathcal G` satisfies
`s>2N`. Since `s` is a block prime, `h=m+js` for an integer `j`; the mismatch
modulo `r` says `r` does not divide `j`. Hence

\[
 \|j/r\|\ge1/r,
 \qquad |m/(rs)|<1/(2r),
\]

and therefore

\[
 \|h/(rs)\|\ge1/(2r)\ge1/(2b).
\]

For each of the `G` distinct auxiliary denominators `rs`,

\[
 |(1-\theta)+\theta e^{2\pi ih/(rs)}|^2
 \le1-4\nu_b\sin^2(\pi h/(rs))
 \le1-\frac{4\nu_b}{b^2}.
\]

Put

\[
 \beta_b=\sqrt{1-4\nu_b/b^2}<1.
\]

Then `|F(h)|<=beta_b^G`. There are at most `2N+1` possible labels and exactly
`b` lifts for each block assignment, so

\[
 \sum_{h\in S_{\rm sib}}|F(h)|
 \le b(2N+1)\beta_b^G.
\]

## 15. Terminal choice and positivity

The major lower bound and `sigma_E<=K_bsigma` give

\[
 \Re\sum_{h\in S_M}F(h)
 \ge\frac{c_{\rm maj}}{K_b\sigma}.
\]

Choose the remaining parameters in this order.

1. Choose `eta>0` so that
   \[
    b\eta<\frac{c_{\rm maj}}{6K_b}.
   \]
2. Choose `C>1/sqrt(nu_b)` so large that
   \[
    bK_{c_b}e^{-c_bC^2/2}<\frac{c_{\rm maj}}{6K_b}.
   \]
3. Since `beta_b<1`, choose `G` so that
   \[
    b(2C+3)\beta_b^G<\frac{c_{\rm maj}}{6K_b}.
   \]
4. Finally choose `n` above all thresholds used in the proof. In particular
   `sigma<=1`, and
   \[
    (2N+1)\sigma
    \le2C+3.
   \]

Multiplying the minor bounds by `sigma` now gives

\[
 \sigma\sum_{h\in S_m}|F(h)|
 <\frac{c_{\rm maj}}{2K_b}
 <\frac{c_{\rm maj}}{K_b}.
\]

Therefore

\[
 \sum_{h\in S_m}|F(h)|
 <\Re\sum_{h\in S_M}F(h).
\]

The complete Fourier sum has positive real part, so `W>0`. Some subset
`A subset E` satisfies the required congruence.

Divide the congruence by `L`. The difference

\[
 \sum_{e\in A}\frac1e-\frac1b
\]

is an integer. But `0<=sum_{e in A}1/e<=Lambda<1` and `0<1/b<1`, so the
difference lies strictly between `-1` and `1`. It is zero. Thus

\[
 \sum_{e\in A}\frac1e=\frac1b.
\]

The set `A` consists of distinct squarefree semiprimes and avoids `T`. This
proves Theorem 4. Lemmas 2 and 3 give sufficiency in Theorem 1, completing the
proof. ∎

## 16. Independence and closure statement

Every load-bearing implication above is proved in this file. The only external
theorem is the PNT, used through the three explicitly derived consequences in
Lemmas 5 and 6. No software result, finite certificate, previous decomposition,
or correspondence table is used as a premise.
