# E306-PD-PAPER-FIRST-01 — manuscript handoff

**Return state:** `READY-FOR-REPAIR-VERIFICATION`  
**Immediate consumer:** bounded verification against
`review/e306-paper-first-proof-audit-v1@3d1451faf66830bbf38e16047b78dd08d7efa803`  
**Later consumer:** a fresh `E306-P1-REV5` manuscript worker, only after the
bounded verification passes  
**Proof-development start:** `proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`

## 1. Controlling proof sources

The fresh manuscript must be written from these paper-first files:

1. `PAPER-FIRST-ROUTE-COMPARISON.md` — alternatives considered and route decision;
2. `PAPER-FIRST-PROOF-ARCHITECTURE.md` — theorem hierarchy and natural section
   order;
3. `PAPER-FIRST-HUMAN-PROOF.md` — complete standalone mathematical proof;
4. `PAPER-FIRST-DEPENDENCY-AND-PARAMETER-LEDGER.md` — logical closure,
   quantifiers, and load-bearing audit;
5. this handoff — public-writing boundary and acceptance tests.

Earlier Lean releases, refactors, dossiers, corpora, and manuscripts may be used
to recover bibliography data or genuinely clean prose only. They do not override
the mathematics in the four proof files above.

### Repair synchronization

The controlling human proof now contains the exact bounded repairs required by
the independent audit:

- Lemma 8 assumes `|C_m|>=max(16,128B/X)`, so every invocation of the dispersion
  lemma lies in its proved range;
- Proposition 9 disposes of `R=0` before defining `B` or dividing by `B^2`;
- its substantial-class sum is
  `1/2 sum_i n_i^3((S-n_i)-(t-1))`, with
  `(S-n_i)-(t-1)>=(255/256)(S-n_i)` derived from `n_j>=s_0`;
- avoidance is phrased by requiring `X^2` to exceed every element of `T`, a
  vacuous condition when `T` is empty.

These are local repairs only. They do not change the complete-pair family, the
multiblock rigidity route, the Fourier partition, the reservoir, the parameter
order, or the headline theorem.

## 2. Principal mathematical change

The new proof does **not** use the old three-part denominator architecture.
Instead it takes:

\[
 E_{\rm pair}=\{pq:X\le p<q<X^3\}
\]

and one small denominator-sensitive family

\[
 E_{\rm aux}=\{rs:r\mid b,\ s\in\mathcal G\}.
\]

The full pair load tends naturally to `(log3)^2/2`, which lies in `(1/3,1)`.
This single observation removes:

- the selected mass batch;
- the greedy reciprocal interval;
- forbidden-pool bookkeeping;
- the `alpha=3/2` normalization;
- the special mass target `21/20`;
- the control-load constraint;
- the released constants `1000001`, `501`, and `2004`;
- the need to explain a software-derived denominator decomposition.

The nearest-neighbour block graph remains only as an analytic subgraph of the
complete pair family.

## 3. Required manuscript theorem hierarchy

The mathematical body should contain the following named results, in this
order.

### Section 1 — statement and reductions

- headline iff theorem;
- squarefree-lcm necessity;
- avoiding unit-fraction theorem;
- numerator induction;
- reductions for denominators `1` and `2`.

### Section 2 — PNT on a fixed power interval

- uniform dyadic block density;
- Abel-summation proof of
  `sum_{X<=p<X^3}1/p=log3+o(1)`;
- reciprocal-square estimate.

The reason for choosing the exponent `3` should be stated: the limiting pair
load `(log3)^2/2` is strictly between `1/3` and `1`.

### Section 3 — denominator family and finite Fourier identity

- complete pair family and common auxiliary reservoir;
- distinctness, avoidance, and period divisibility;
- reciprocal load interval and common Bernoulli parameter;
- exact character-orthogonality formula;
- Fourier-energy majorant.

### Sections 4–6 — the centred-CRT rigidity theorem

State the global CRT tail theorem before proving it. Its proof should be divided
into:

1. deterministic reciprocal dispersion;
2. dominant labels and exact cold blocks;
3. fingerprint entropy for energetic blocks;
4. adjacent-label propagation;
5. global level-set count;
6. localization, Laplace tail, and Gaussian diagonal tail.

This material is the central proof, not an appendix and not a prose summary.

### Section 7 — major frequencies

- variance comparison from the complete pair family;
- uniform logarithm and Taylor expansion;
- exact cancellation of the linear term;
- positive Gaussian major lower bound.

### Section 8 — minor frequencies

- exact partition into block-minor and sibling sectors;
- exact block-assignment fibre size `b`;
- second use of squarefreeness;
- one common high-prime reservoir and its geometric damping.

### Section 9 — terminal choice and closure

- order `eta -> C -> G -> X`;
- three displayed strict inequalities;
- Fourier positivity;
- no-wrap conversion;
- return to the headline theorem.

## 4. Prose that must not reappear

The manuscript must not use any of the following as a substitute for proof:

- “double counting gives a suitable base prime” without the degree sum and
  resulting inequality;
- “the encoder is bounded” without listing and counting the code layers;
- “a final threshold absorbs the constants” without the exact dominating
  function and dependency order;
- “the formalization checks the finite details”;
- “by the previous dossier/release/correspondence”;
- a table of software theorem names in place of a mathematical derivation.

Big-O notation is acceptable only after the underlying finite inequality has
been established and its dependence is clear.

## 5. What may be compressed

The future paper need not preserve every constant displayed in the proof packet.
It may replace absolute numeric constants in dispersion estimates by named
positive constants, provided that:

- the close-residue count is proved;
- the covering dichotomy is explicit;
- the algebra closing the forcing scale `X/log^3X` is shown;
- the cold exception count is shown to be strictly below one;
- all parameter dependencies remain visible.

Routine variants of `Cauchy–Schwarz`, power mean, Gaussian-integral comparison,
and the finite character identity may be concise, but their hypotheses and
conclusions must be stated.

## 6. Formalization statement for the future article

The article must not claim that this paper-first proof, its complete pair family,
or its local-to-global theorem has already been formalized. A truthful public
statement may say:

- an earlier proof of the same headline theorem was machine checked and archived;
- the present article uses a reconstructed and substantially simplified human
  proof;
- formalization of the present proof is separate future work.

No internal branch, commit, issue, role, dossier, or review classification belongs
in the public article.

## 7. Salvage boundary for rejected REV4

REV4 may contribute only material that survives independent comparison with the
paper-first proof:

- bibliographic records checked against primary sources;
- title/author/TeX package hygiene;
- standard definitions and elementary reductions;
- isolated prose sentences that accurately describe the new proof.

Do not transplant:

- its denominator-family decomposition;
- `alpha=3/2` or the old mass window;
- formal finite constants;
- its compressed hot/cold or encoder paragraphs;
- its proof ledger or module correspondence;
- any claim that REV4 is a mathematical base for REV5.

REV5 should be a fresh manuscript, not a patch series on the rejected proof
architecture.

## 8. Consumer acceptance tests

A manuscript consumer passes this checkpoint only if all of the following are
true.

1. The public proof uses the complete pair family and the natural limiting load,
   or gives a fully proved route that is demonstrably simpler.
2. Every use of the PNT is explicit and the power-interval Abel calculation is
   printed.
3. The local-to-global theorem is stated at a natural level and proved in full.
4. The nondominant forcing proof contains the bad-pair average, label-cover count,
   small/substantial dichotomy, and closing algebra.
5. The cold-block theorem proves zero exceptions rather than hiding an exception
   budget.
6. The fingerprint count identifies the fingerprint size, exceptional vertices,
   and both energy ranges.
7. The global level-set proof gives an injective code and a separate bound for
   shells, hot blocks, boundaries, and labels.
8. The Laplace tail displays the inequality comparing the exponential forcing
   floor with the affine block entropy.
9. The variance comparison is derived from reciprocal-square estimates, with no
   release constant.
10. The major Taylor remainder is bounded uniformly by `O(n/X)` or an equivalent
    explicit quantity tending to zero.
11. The minor partition is exact and the factors `b` and `b(2N+1)` remain
    visible.
12. The second use of squarefreeness is explained.
13. The reservoir is common to every sibling and is chosen before the final
    scale.
14. The parameter order is non-circular and ends with one finite maximum for
    `X`.
15. The manuscript makes no false claim about formalization of the present proof.

## 9. Assurance boundary

This checkpoint is an authorial proof-development repair return. It records a
complete paper-first proof whose three local mathematical defects and one
empty-set ambiguity have been repaired. It is now suitable for the bounded
verification specified by the independent audit; it is not yet the verifier's
clean manuscript-launch decision. It is also not:

- Owner approval of a manuscript;
- independent mathematical review beyond the named pending verification;
- a formalization result;
- a release or canonical promotion;
- permission to submit to arXiv or a journal.

After bounded verification, a fresh manuscript must still be written and undergo
substantive Owner review and independent mathematical review.

## 10. Return classification

The audit-authorized local repairs are complete without changing the proof route,
headline theorem, denominator family, Fourier partition, or parameter order. No
new unresolved theorem or external source was introduced.

`[READY-FOR-REPAIR-VERIFICATION E306-PD-PF-REPAIR-01]`
