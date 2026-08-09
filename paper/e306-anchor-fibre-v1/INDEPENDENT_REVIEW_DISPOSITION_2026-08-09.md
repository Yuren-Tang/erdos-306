# E306 independent review disposition — 2026-08-09

## Review object and status

The Owner supplied an independent mathematical/editorial/typographic review of the complete TeX/PDF object built from manuscript source

`654189fe67b575bd539092f1700754835ee7ebda`.

The reader reported no fatal mathematical defect, specifically stress-tested the main load-bearing interfaces in Sections 4--6, and judged the manuscript publishable after bounded revision. This return is substantive independent evidence, but it is **not** a PASS attached to the revised source below: requested clarifications were subsequently applied, so the revised fixed object requires an independent delta recheck.

Revised exact manuscript source:

`3899f40fb493c2e2f2894f432cada64437a0964c`

Clean-build evidence for that source:

- workflow run `31292599279` / run number 191: PASS;
- branch execution head `4c48940b1407142b990fda8fe4cd3fa41f856ce0`;
- resulting PDF: 35 A4 pages;
- frozen-source, Oxford spelling, XeLaTeX/Biber, references/citations/labels, missing glyphs, embedded fonts/no Type 3, Unicode dedication/ORCID/Erdős extraction, internal-label-leak, and **overfull-hbox** gates all passed.

The final log retains one mild underfull box; it is not a correctness or clipping defect.

## Accepted and applied

1. **No-wrap hypothesis.** The lemma now states explicitly that `X` is sufficiently large so that `Lambda<1`. This closes a genuine local statement-hygiene gap; it changes no proof argument.
2. **Notation collision.** The Section 2 prime reciprocal sums `S_X,U_X` were renamed `H_{\mathcal P},U_{\mathcal P}` so that the principal random variable `S_X` in the Introduction is unambiguous.
3. **Frequency-scale map.** Section 6 now records the hierarchy
   `sigma^{-1} ~ X log X << X^2 << M_dec << Z^{3/2}/sqrt(log Z) << Z^2`,
   with the penultimate scale tied explicitly to the anchor-rigidity bound.
4. **Lean/analytic separation.** Immediately after the headline characterization, the Introduction now says that the earlier machine-checked theorem and the present analytic article are different proofs and that the present article's additional value is local coefficient geometry. The abstract now says “self-contained analytic resolution”.
5. **Target rows as an observability correction.** The Introduction now foregrounds the fact that target rows are asymptotically negligible in reciprocal/square mass in the `gamma>2` regime while supplying strong residue separation at the primes dividing `b`.
6. **Cardinality decorrelation motivation.** Section 10 records the elementary calculation `Corr(S_X,K_X)->0`, explicitly only as motivation for a future joint local law/conditional cardinality theorem.
7. **Typography cleanup.** The bibliography was enlarged from `\footnotesize` to `\small`. The long Introduction display defining `Z,\mathcal P_X,\mathcal B_X` was reflowed; the new workflow hard-fails on any overfull hbox, and the revised source passes.
8. **Metaphor restraint.** One especially engineering-heavy phrase (“physically observable”) was replaced by the more arithmetic “detectable”. The core established vocabulary `anchor`, `row observability`, and `decoder` remains because it carries real proof structure.

## Considered but not applied

1. **`ΟΙΣ` -> `ΟΥΣ` in the Greek dedication: rejected.** Although `φιλέω` ordinarily takes an accusative object, classical relative attraction allows an accusative relative to be attracted into the dative/genitive case of an expressed or omitted antecedent; this is especially regular when the antecedent is omitted. Thus `ΚΑΙ ΟΙΣ ΦΙΛΩ` is a defensible compact dedicatory construction, understood with an omitted dative antecedent. Smyth, *Greek Grammar*, §§2522 and 2531 are the controlling grammatical comparison; LSJ confirms the ordinary accusative government of `φιλέω`, which is precisely what is overridden at the relative-pronoun surface by attraction. The text is retained.
2. **Dedication font: no change.** The controlling E306 microtypography decision is GFS Artemisia Regular, upright, 10 pt on 15 pt, with 8 pt above and 12 pt below. The durable front-matter return `#8#issuecomment-5109693351` records the deliberate replacement of GFS Didot by Artemisia. No E306 record supporting a later EB Garamond dedication choice was found.
3. **Formal “Anchor package” / “Row package” propositions: not added.** Sections 4 and 5 already end by collecting exactly those interfaces in prose, and Section 6 consumes them cleanly. New formal propositions would enlarge the theorem surface without adding mathematical content or assurance.
4. **Full equation-reference migration: deferred.** Replacing the manuscript's explicit stable numeric `\tag`/numeric-reference system by a complete `\label`/`\eqref` refactor is sound long-term source hygiene, but it would touch roughly the entire formula-reference surface and reopen a large low-value error cone immediately before public release. The present convention clean-builds and has an explicit leaked-label gate. Reconsider for the journal production source or a separately audited maintenance pass.
5. **New theorems and architecture: deferred.** Sparse target sensing, the `gamma=2` critical window, growing standardized windows, and an abstract arithmetic-sensing-graph theorem are worthwhile research directions but are not grounds to reopen Article 1.
6. **Venue / endorsement judgments: informative, not controlling.** The reader's willingness to endorse and positive assessments of JNT/IMRN/Mathematical Proceedings are useful external signals. They do not authorize an arXiv upload, contact, journal submission, or route choice.

## Mathematical assessment of the review

The review is unusually valuable because it did not merely praise the headline theorem: it independently identified the two most failure-prone dependency cones already recognized internally--zero-exception anchor rigidity and weighted row-fibre compression--and reported having checked them without finding a defect. It also correctly recognized the essential decoder-range discipline and the fixed-`C` then `X->infinity`, finally `C->infinity` limit order.

The only reviewer suggestion found mathematically/philologically wrong after verification was the proposed Greek `ΟΙΣ -> ΟΥΣ` correction. The only true mathematical-statement defect found was the missing explicit `Lambda<1` hypothesis in the local no-wrap lemma, and that defect was expository/local rather than a failure of the proof in context.

## Next assurance gate

The correct next step is an **independent delta recheck of `3899f40fb493c2e2f2894f432cada64437a0964c` against `654189fe67b575bd539092f1700754835ee7ebda`**, not a new full exploratory review unless the checker finds a reason to reopen the dependency cone. The delta checker should confirm that the accepted changes above are correct and that no theorem, estimate, construction, proof range, or quantifier was altered inadvertently.

Until that delta recheck returns PASS and the Owner gives a contemporaneous publication-route instruction, PR #9 remains draft/unmerged and no merge, tag, release, DOI change, arXiv upload, journal submission, or external contact is authorized.
