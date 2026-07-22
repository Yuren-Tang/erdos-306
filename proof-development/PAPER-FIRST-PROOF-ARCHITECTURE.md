# E306-PD-PAPER-FIRST-01 — paper-first proof architecture

**State:** `READY-FOR-PAPER-FIRST-MANUSCRIPT`  
**Companion proof:** `proof-development/PAPER-FIRST-HUMAN-PROOF.md`  
**Route decision:** `proof-development/PAPER-FIRST-ROUTE-COMPARISON.md`

## 1. Headline theorem

Let `q=a/b>0` be in lowest terms. Then `q` is a finite sum of reciprocals of
distinct products of two distinct primes if and only if `b` is squarefree.

The proof is organized around the following avoiding statement.

### Avoiding unit-fraction theorem

For every squarefree integer `b>=3` and every finite set `T` of positive
integers, there is a finite set `A` of pairwise distinct squarefree semiprimes,
disjoint from `T`, such that

\[
 \sum_{e\in A}\frac1e=\frac1b.
\]

This statement implies the headline theorem by elementary induction and also
ensures distinctness when several unit-fraction representations are combined.

## 2. Natural theorem hierarchy

The paper-first proof has five mathematical layers.

### Layer I — analytic prime supply

For `X=2^n`, put

\[
 \mathcal P=\{p\text{ prime}:X\le p<X^3\}.
\]

The PNT and Abel summation give:

1. uniform two-sided density in every dyadic block
   `P_k=[2^k,2^(k+1))`, `n<=k<3n`;
2. `sum_{p in P}1/p = log 3+o(1)`;
3. `sum_{p in P}1/p^2 = O(1/(X log X))`.

These statements are used only after fixing the denominator `b` and the finite
obstruction set `T`.

### Layer II — denominator family and exact Fourier formula

Let

\[
 E_{\rm pair}=\{pq:p,q\in\mathcal P,\ p<q\}.
\]

Choose a fixed number `G` of primes in the top dyadic block and put

\[
 E_{\rm aux}=\{rs:r\mid b\text{ prime},\ s\in\mathcal G\}.
\]

Set `E=E_pair disjoint-union E_aux` and

\[
 L=b\prod_{p\in\mathcal P}p.
\]

The pair load tends to `(log 3)^2/2`. Hence, after fixing constants

\[
 1/3<\lambda_-<(\log3)^2/2<\lambda_+<1,
\]

large `X` gives `lambda_-<Lambda=sum_{e in E}1/e<lambda_+`. Define

\[
 \theta=\frac1{b\Lambda}.
\]

Then `0<theta<1`, `sum theta/e=1/b`, and `Lambda<1`.

The weighted subset count of the congruence

\[
 \sum_{e\in A}L/e\equiv L/b\pmod L
\]

is expressed exactly by finite Fourier inversion.

### Layer III — centred-CRT local-to-global rigidity

Partition `mathcal P` into the dyadic blocks `P_n,...,P_(3n-1)`. Use the
analytic scaffold

\[
 \mathcal C=
 \bigcup_k\{(p,q):p,q\in P_k,p<q\}
 \cup\bigcup_k(P_k\times P_{k+1}).
\]

For a residue assignment `a=(a_p)` and a scaffold edge `(p,q)`, let `H_pq(a)`
be the centred CRT lift in `(-pq/2,pq/2]`. Define

\[
 Q(a)=\sum_{(p,q)\in\mathcal C}(H_{pq}(a)/(pq))^2,
 \qquad
 \sigma^2=\sum_{(p,q)\in\mathcal C}1/(pq)^2.
\]

The central rigidity theorem is:

> For every `c>0` and `eta>0`, there are `n_0` and `K_c>0` such that, for
> `n>=n_0` and `C>=1`,
> \[
>  \sum_{a\notin\mathfrak M(C)}e^{-cQ(a)}
>  \le\frac{\eta+K_c e^{-cC^2/2}}{\sigma},
> \]
> where `mathfrak M(C)` is the set of assignments represented by one integer
> `m` with `|m|<=C/sigma` on every prime coordinate.

Its proof is divided into human-scale lemmas:

1. deterministic reciprocal dispersion;
2. block dominance and exact cold labels;
3. fingerprint entropy for energetic blocks;
4. adjacent-label energy;
5. global level-set count;
6. localization and two tails.

### Layer IV — major and minor frequencies

For a frequency `h mod L`, its block residues define an assignment `a(h)`, and

\[
 Q(a(h))\le Q_E(h):=\sum_{e\in E}\|h/e\|^2.
\]

The compact interval containing `theta` supplies

\[
 \nu_b:=\min\theta(1-\theta)>0,
 \qquad c_b=8\nu_b>0.
\]

The Fourier product satisfies `|F(h)|<=exp(-c_b Q_E(h))`.

- **Major frequencies:** the residues of integers `|m|<=N`, where
  `N=ceil(C/sigma)`. Uniform Taylor expansion gives a real positive sum
  `>=c_maj/sigma_E`.
- **Block-minor frequencies:** assignments outside `mathfrak M(C)`. The rigidity
  theorem and the exact fibre size `b` give the first minor bound.
- **Sibling frequencies:** assignments in `mathfrak M(C)` that are not the
  genuine integer frequency. Squarefreeness of `b` gives a mismatch prime
  `r|b`, and the common reservoir gives geometric damping `beta_b^G`.

### Layer V — arithmetic closure

Choose the minor budgets strictly below the major lower bound, then apply Fourier
positivity. The no-wrap inequality `sum_E1/e<1` converts the congruence into an
exact equality. Avoidance, numerator induction, and the reductions `b=1,2`
finish the theorem.

## 3. Dependency graph

```text
PNT
 ├─ dyadic two-sided density
 ├─ reciprocal load on [X,X^3) -> log 3
 └─ reciprocal-square upper bound
      │
      ├─ complete pair-family load and theta interval
      ├─ variance upper comparison
      └─ availability of the high-prime reservoir

centred CRT + prime-block geometry
 ├─ deterministic dispersion
 │    ├─ dominant-label theorem
 │    ├─ exact-cold-label theorem
 │    ├─ fingerprint rigidity/count
 │    └─ adjacent-label penalty
 │          └─ global level-set estimate
 │                └─ localization + Laplace + Gaussian tails
 │
finite Fourier identity
 ├─ Taylor major lower bound
 ├─ block-minor bound <- global tail theorem
 └─ sibling bound <- squarefree b + common reservoir
      │
      └─ strict Fourier positivity
            └─ avoiding representation of 1/b
                  └─ headline theorem.
```

No arrow in this graph points to a released theorem, software declaration, or
prior manuscript statement.

## 4. Fixed data and parameter order

Fix first:

- squarefree `b>=3`;
- finite obstruction set `T`;
- `lambda_-`, `lambda_+` around `(log3)^2/2`;
- the block dominance fraction `rho`;
- the small cold threshold `c_w` obtained from the block-rigidity proof;
- a Taylor radius and remainder allowance;
- three positive terminal budget shares with sum below one.

The PNT limit and the load interval determine a compact interval `I_b` for
`theta`; this determines `nu_b`, the Fourier exponent `c_b`, and the sibling
factor `beta_b<1`.

Then choose:

1. `eta` for the non-diagonal block tail;
2. `C` for the diagonal Gaussian tail and the main window;
3. `G` for sibling damping;
4. finally `n`, hence `X=2^n`, above one finite maximum of the thresholds listed
   below.

The final scale thresholds are:

- PNT density and reciprocal-load accuracy;
- exclusion of the primes dividing `b` and avoidance of `T`;
- block rigidity, fingerprint counting, and adjacent-label geometry;
- global level-set and Laplace-tail bounds;
- availability of `G` top-block primes;
- reciprocal-load and variance comparison;
- period injectivity and the frequency-fibre count;
- Taylor radius and aggregate cubic remainder;
- the elementary inequalities making every displayed strict comparison hold.

Every entry depends only on data chosen earlier. There is no later redefinition
of `theta`, no selected mass batch, and no circular dependence on `n`.

## 5. Structural constants versus disposable constants

The proof uses only the following structural inequalities:

- `(log3)^2/2` lies strictly between `1/3` and `1`;
- `rho` lies strictly between `0` and `1/2`;
- the cold forcing constant is positive and sufficiently small;
- the Taylor disk has positive radius;
- `nu_b>0`, hence `c_b>0` and `beta_b<1`;
- the three terminal budgets have total strictly below the major allowance.

Integer powers of two used in one dispersion estimate, a particular value of
`rho`, or a particular allocation of the final budget are proof conveniences,
not theorem architecture.

## 6. Why the central theorem is at the right abstraction level

The local-to-global theorem is neither a black box nor an implementation ledger.
It is the natural interface between the arithmetic construction and Fourier
analysis:

- the denominator construction needs only its weighted off-diagonal estimate;
- its proof uses only prime-block geometry and centred CRT;
- it is independent of `b`, except when instantiated with the Fourier exponent;
- it cleanly separates local rigidity from the final exact subset selection.

The theorem cannot be replaced by a concentration slogan: the assignments live
in a product of changing residue rings, and the labels must be propagated across
all blocks. Conversely, the article need not expose software-oriented names or
finite certificates once the theorem is proved in ordinary prose.

## 7. Manuscript architecture

A fresh paper should follow this order:

1. theorem, necessity, and avoiding reductions;
2. PNT on the fixed power interval;
3. complete pair family, auxiliary reservoir, and Fourier formula;
4. the local-to-global CRT theorem, including its complete proof;
5. major arcs;
6. the two minor sectors;
7. terminal choice and arithmetic closure.

This order presents each object immediately before its mathematical use and
contains no formalization-correspondence section in the proof body.
