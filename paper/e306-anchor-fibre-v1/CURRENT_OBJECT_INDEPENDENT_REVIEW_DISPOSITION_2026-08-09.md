# E306 current-object independent review — Director disposition

**Date:** 2026-08-09, Europe/Berlin  
**Review object:** `8024ff325f454e1fc52c280ac65bab0c48315e96`  
**Current arXiv-v1 manuscript source after bounded editorial repair:** `d21c612be5c3534b3b2b40361c4a861f40969565`

## Review return

The Owner arranged a fresh independent no-background review of the then-current sparse-target `gamma>1` manuscript, supplying the TeX components, bibliography, and rendered PDF. The reader reports cross-checking the source against the PDF and independently rebuilding the manuscript. The review explicitly stress-tested Sections 4--6, with particular attention to one-anchor rigidity/fingerprint entropy, weighted row compression, decoder ranges, the Gaussian core, and the coherent/noncoherent tail decomposition.

The reviewer found no fatal mathematical defect, judged the article mature for arXiv v1, would be willing to endorse it if eligible, and would send it to external review rather than desk-reject it at a mid-level number-theory journal. The report correctly distinguishes this from a line-by-line formal correctness certificate.

## Director assessment of coverage

This review is sufficient to close the focused independent dependency-cone gate opened by the sparse-target revision. It directly addresses the load-bearing cone that changed from the preceding reviewed object: sparse target-row mass/variance, `gamma>1` decoder ranges, Sections 4--6 Fourier architecture, and the moving/multiplicity consequences built on that cone. It also checks the source/build surface, literature positioning, exposition, typography, and arXiv packaging.

The current assurance is therefore stronger than merely accumulating another general-read opinion: the specific cone identified in `SPARSE_TARGET_GAMMA1_FOCUSED_REVIEW_PACKET_2026-08-09.md` has now received an independent hostile read with no fatal objection.

## Suggestions adopted before arXiv v1

Four bounded editorial changes were accepted. None changes a theorem, quantifier, mathematical construction, displayed formula, estimate, proof range, or visible equation number.

1. **Section 4 logic roadmap.** A short mechanism-only paragraph now states the two branches: low energy -> dominant label -> zero exceptional coordinates; above threshold -> fingerprint -> low completion entropy -> weighted damping.
2. **Common proper refinement clarification.** The remark now explicitly forbids all denominators from both original representations from the first cell onward, in addition to the external forbidden set and all newly used denominators.
3. **Broad survey reference.** Bloom--Elsholtz, *Egyptian fractions*, Nieuw Archief voor Wiskunde 23(4) (2022), 237--245, arXiv:2210.04496, was added and cited as a general entry point.
4. **Abstract tightening.** Construction detail was moved out of the abstract while retaining the characterization, finite avoidance, admissible `gamma>1` regime, local Gaussian formula, and main abundance consequences.

The resulting manuscript source is `d21c612be5c3534b3b2b40361c4a861f40969565`.

## Suggestions deliberately deferred

### Logarithmically many target sensors

The reviewer correctly observed that `K_* = ceil((log Z)^2)` is a convenience scale rather than an evident sharp threshold, and that `K_* = ceil(C log Z)` with sufficiently large fixed `C` should plausibly suffice after tracking the fixed polynomial losses.

One phrase in the review is not literally correct: with `K_*=C log Z`,

```text
exp(-c K_*) = Z^{-cC},
```

which is polynomial decay of arbitrarily high fixed order as `C` grows, not superpolynomial decay. The proposed strengthening nevertheless appears viable because the present proof only needs the target-row error to beat finitely many fixed polynomial factors (including the weighted top partition and the normalization scale). Since this bookkeeping was not itself independently verified as a theorem statement, it is not added immediately before v1.

### Entropy-rate supremum for `t >= 1/2`

The suggested optimization is mathematically natural: writing `lambda=(log gamma)^2/2` and `alpha=t/lambda`, the per-denominator rate has supremum `log 2` at `t=1/2` and `H(t)` for `1/2<t<1`, approached as `lambda -> 1`. This is a clean consequence but is not needed for the paper's main package and would add a new optimization statement after the review gate. It is deferred.

### Later projects / later versions

The following are retained as research directions, not v1 tasks: a bivariate reciprocal-sum/cardinality local limit, growing standardized windows, target-independent sensing families, structured positive-density prime sets, and a more abstract finite-Fourier transference theorem.

## Suggestions not treated as v1 blockers

- The current Section 5 title and the `anchor` / `sensor` / `decoder` vocabulary are retained.
- The 190 explicit visible equation tags remain for v1. The source already uses ordinary semantic LaTeX labels/hyperlinks; removal of manual visible tags is journal-revision technical debt, not an arXiv-v1 correctness issue.
- The Greek dedication text `ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ / ΚΑΙ ΟΙΣ ΦΙΛΩ` remains deliberate under classical relative attraction.
- The current STIX Two Text Medium dedication setting remains controlling for v1. A future Gentium Book Medium comparison may be worthwhile as a typography-only experiment, but is not a publication blocker.
- Venue estimates and publisher-specific AI policies are advisory and must be rechecked against the live target journal at journal-submission time.

## Publication disposition

The focused independent mathematical review gate is closed for arXiv-v1 purposes. Subject to a clean build of exact source `d21c612...` and the Owner's final submission action, there is no remaining mathematical or editorial blocker to arXiv v1.

This disposition authorizes preparation of an arXiv-v1 submission package and metadata. It does not by itself authorize journal submission, merge of PR #9, release/tag/DOI mutation, or external contact on the Owner's behalf.