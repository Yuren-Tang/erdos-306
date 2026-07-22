# E306-PD-PAPER-FIRST-01 — route comparison and route decision

**Role:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**State:** `READY-FOR-PAPER-FIRST-MANUSCRIPT`  
**Exact predecessor:** `proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`  
**Controlling task:** research-workbench issue #38 comment `5050656137`

## 1. Authority reset

This bounded unit is governed by the theorem and by the cleanest complete human
proof. The released Lean project, the frozen refactor, earlier proof-development
dossiers, the Curator corpus, and the rejected REV4 manuscript are consulted only
to locate ideas, counterexamples, and proof obligations. None of them fixes the
proof decomposition, constants, parameter order, or expository hierarchy.

The comparison below asks four questions of every route:

1. Does it prove an **exact** reciprocal identity rather than an approximation?
2. Does it explain the squarefree-denominator obstruction and its second use in
   the construction?
3. Can every load-bearing estimate be proved in ordinary mathematical prose?
4. Does it reduce, rather than merely rename, the genuine combinatorial work?

## 2. Route A — purified finite Fourier and centred CRT

### Core idea

Choose a large prime set

\[
 \mathcal P_X=\{p:X\le p<X^3\},
\]

and take **all** products `pq` of two distinct primes in this set. Add a small
family `rs`, where `r|b` and `s` lies in one high block. The complete pair family
already has asymptotic reciprocal load

\[
 \sum_{p<q\in\mathcal P_X}\frac1{pq}
   \longrightarrow \frac{(\log 3)^2}{2}\in(1/3,1).
\]

Thus one common Bernoulli parameter can be chosen so that the expected
reciprocal sum is exactly `1/b`; no greedy mass batch and no `alpha=3/2`
normalization are needed.

Finite character orthogonality converts the exact subset-sum question into a
major/minor Fourier comparison. A nearest-neighbour multiscale graph on the
prime blocks is used only as an **analytic scaffold** inside the complete pair
family. Its centred CRT energy detects whether a residue assignment is close to
one integer label.

### Advantages

- Exact equality is obtained directly from a finite Fourier coefficient.
- The full pair family removes the old control/mass decomposition, forbidden-pool
  cancellation, greedy interval lemma, and large inverse-square certificate.
- PNT is used at its natural strength: one fixed power interval supplies both
  density and a limiting reciprocal load.
- The squarefree hypothesis on `b` has a transparent second role: a non-main
  sibling must mismatch at some prime divisor of `b`.
- All remaining constants can be fixed symbolically and depend only on the fixed
  denominator `b`.

### Cost

The route still needs a real local-to-global rigidity theorem for CRT residue
assignments. That theorem has three irreducible ingredients: deterministic
reciprocal dispersion inside a prime block, propagation of labels between
neighbouring scales, and an entropy/Laplace estimate for the non-rigid
assignments.

**Decision:** retain this route, but in the simplified full-pair form proved in
`PAPER-FIRST-HUMAN-PROOF.md`.

## 3. Route B — probability and concentration without Fourier inversion

A natural attempt is to choose every denominator independently and tune its
inclusion probability so that the expected reciprocal sum is `1/b`. Standard
concentration then gives many subsets with sum close to `1/b`.

This does not solve the problem. The set of possible reciprocal sums is a lattice
with mesh `1/L`, where `L` is the common period. The desired event is one exact
lattice point, and its probability is much smaller than what a real-valued
concentration inequality can resolve. A local central limit theorem for this
lattice would require control of the characteristic function at every frequency
modulo `L`. That characteristic-function analysis is precisely the finite
Fourier problem.

One could formulate the proof probabilistically, calling the major arcs a local
limit theorem and the minor arcs an anti-concentration estimate, but no
mathematics disappears. The Fourier language is shorter and states the exact
positivity criterion directly.

**Decision:** rejected as an independent simplification. It is an equivalent
interpretation of Route A, not a replacement for its spectral work.

## 4. Route C — one abstract local-to-global rigidity theorem

The old exposition spread the residue analysis over “hot blocks”, “cold blocks”,
boundaries, encoders, localization, and two tails. A better paper should package
these into one theorem:

> For a sufficiently long chain of dense dyadic prime blocks, the weighted
> number of residue assignments outside a short global diagonal is
> exponentially small relative to the natural CRT variance scale.

This abstraction is valuable. It gives the article a natural theorem hierarchy
and isolates the only difficult finite-combinatorial input.

It is not legitimate to state the theorem as a black box. Its proof still needs:

1. a block dispersion lemma;
2. a quantitative dominant-label theorem;
3. a fingerprint count for high-energy blocks;
4. an adjacent-label energy penalty;
5. an injective global code and an explicit count of every code layer;
6. a shell summation and an elementary exponential-domination argument.

The paper-first proof therefore **uses** the abstract theorem as its central
interface and proves it completely. This replaces the implementation-shaped
module chain without concealing the mathematics.

**Decision:** adopted as the expository hierarchy, with a full proof rather than
an appeal to an encoder.

## 5. Route D — simpler denominator family and reservoir

Several denominator designs were compared.

### D1. Separate control, greedy mass, and auxiliary families

This works, but it creates an artificial load window, a forbidden-pool removal,
a greedy selection, and a large variance-comparison constant. Those layers were
needed by one formal construction, not by the theorem.

### D2. All block-prime pairs plus a denominator-sensitive reservoir

Take every product `pq` from the fixed power interval and add only the products
`rs` needed to detect the prime divisors of `b`. This family has four decisive
properties:

- its reciprocal load converges to a constant in `(1/3,1)`;
- its inverse-square mass is automatically comparable with the bottom-block CRT
  variance;
- it contains the whole analytic control scaffold;
- unique factorization makes every component and every denominator distinct.

### D3. No auxiliary reservoir

Without denominators containing a prime divisor of `b`, a frequency can agree
with a small integer modulo every block prime while differing modulo `b`. Such a
frequency is invisible to every block-block denominator. Some
`b`-sensitive family is therefore necessary.

### D4. A separate reservoir for every frequency

This is unnecessary. One common set of `G` high primes works simultaneously for
every mismatch prime `r|b` and every sibling frequency.

**Decision:** adopt D2. It is strictly simpler than the previous denominator
architecture while preserving the exact mechanism.

## 6. Route E — additional freedom from the prime number theorem

The PNT gives much more than a fixed lower bound such as `21/20`. For every
fixed `tau>1`, Abel summation gives

\[
 \sum_{X\le p<X^\tau}\frac1p=\log\tau+o(1).
\]

Consequently the reciprocal load of all distinct prime pairs tends to
`(log tau)^2/2`. To obtain a load uniformly between `1/3` and `1`, it is enough
that

\[
 \sqrt{2/3}<\log\tau<\sqrt2.
\]

The choice `tau=3` lies comfortably in this interval and aligns with dyadic
blocks `n,...,3n-1`. This replaces:

- an inclusive `3n` endpoint;
- the special mass target `21/20`;
- a selected mass subfamily;
- a later reciprocal-load normalization.

The same tail-uniform PNT estimate supplies two-sided block cardinality bounds,
which are also enough for the control variance and inverse-square comparisons.

**Decision:** use the fixed interval `[X,X^3)` and its natural limiting load.

## 7. Control-graph comparison

The complete denominator family contains all prime pairs, but the residue proof
should not use all of them indiscriminately.

- A single block cannot carry reciprocal mass exceeding one and cannot see all
  period coordinates.
- A star from the bottom block to every larger block has highly unbalanced
  reciprocal geometry and gives no cleaner uniform dispersion statement.
- Complete cross-scale control adds many unused edges and obscures the
  one-dimensional propagation mechanism.
- Internal cliques plus complete bipartite edges between neighbouring blocks give
  exactly what is needed: local label recovery and connected propagation across
  the scale chain.

The nearest-neighbour scaffold is therefore retained, not because an earlier
formalization used it, but because it is the sparsest natural connected
multiscale graph for which the same-scale dispersion estimates apply uniformly.

## 8. What is genuinely irreducible

The selected proof has four layers that cannot be removed without replacing
them by equivalent work.

1. **Exact lattice selection.** Some Fourier/local-limit mechanism is necessary
   to select the exact residue `L/b`.
2. **Residue rigidity.** The period has one coordinate for every block prime;
   minor-frequency control requires proving that low CRT energy forces a common
   integer label.
3. **Denominator sensitivity.** Block residues do not detect disagreement modulo
   `b`; the auxiliary `rs` denominators are necessary.
4. **Scale separation.** A final large scale must simultaneously secure PNT,
   rigidity, Taylor expansion, reservoir size, avoidance, and period geometry.

What was reducible has been removed: the greedy mass family, `alpha=3/2`, the
control-load budget, the `21/20` target, the large released finite constants, and
mandatory correspondence with a software module graph.

## 9. Route decision

The paper-first route is:

```text
PNT on [X,X^3)
  -> complete block-prime pair family with natural reciprocal load
  -> centred-CRT local-to-global rigidity theorem
  -> finite Fourier major/minor comparison
  -> one common b-sensitive reservoir
  -> avoiding representation of 1/b
  -> numerator and small-denominator reductions.
```

This route is proved from the ground up in the companion files. No proposition
is accepted because it was previously formalized, and no numerical value is
retained merely for release compatibility.
