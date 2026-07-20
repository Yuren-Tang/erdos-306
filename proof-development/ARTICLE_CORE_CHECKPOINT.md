# E306-PDL article-core checkpoint

**Scope:** released human-proof spine from control construction through Fourier
positivity, plus arithmetic closure  
**Authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Status:** `COMPLETE-DRAFT / READY-FOR-INDEPENDENT-REVIEW`  
**Consumer restriction:** no manuscript or Lean mutation is authorized by this
checkpoint

## 1. Completed units

| Unit | Manuscript ledger | State |
|---|---|---|
| `E306-PD-A6.1` | P16 | `COMPLETE-DRAFT` |
| `E306-PD-A6.2` | P17–P18 | `COMPLETE-DRAFT` |
| `E306-PD-A6.3` | P19–P23 | `COMPLETE-DRAFT` |
| `E306-PD-A6.4` | P24–P26 | `COMPLETE-DRAFT` |
| `E306-PD-A7–A10` | P27–P32 | `COMPLETE-DRAFT` |
| `E306-PD-A11–A13` | P0–P3, P33, formal bridge | `COMPLETE-DRAFT` |

Together these files give one dependency-respecting human argument from the
block system and the two construction-facing prime supplies to the public
Erdős 306 theorem.

## 2. Material corrections preserved

### Corrected adjacent-label theorem

The active boundary theorem requires label-size, block-cardinality, and
exception hypotheses. The unqualified original statement is false; the
released source supplies a concrete zero-energy counterexample. The
checkpoint uses only `mismatch_penalty_with_exceptions` and its valid
specialization.

### Correct global level-set quantifiers

The level-set bound is
\[
 e^{A\,\mathrm{numBlocks}(BS)}e^{8\varepsilon R}
 \left(1+\frac{\sqrt R}{\sigma_{\rm ctrl}}\right)
\]
with \(A\) fixed before `BS` and before the final bottom-scale choice. No free
post hoc `Cglob` occurs.

### Exact forbidden-pool cancellation

The pair pool lower bound \(1/2\) has no hidden surplus. The reciprocal load
of pool terms forbidden by the fixed control/gadget components is absorbed
by the already-spent base load; the remaining inequality is
\(3/(2b)\le1/2\).

### Exact CRT multiplicities

The block-minor fibre contributes the explicit factor \(b\). The extra
main-assignment sector contains at most \(b(2N+1)\) siblings. Neither factor
is hidden in big-O notation.

### Constant-first terminal order

The terminal order is
\[
 \eta\longrightarrow C\longrightarrow D_{\rm mp}
 \longrightarrow G\longrightarrow k_0.
\]
The variance comparison uses \(K_\sigma=501\), and the released quarter
budgets use \(2004=4\cdot501\).

## 3. Trust classification

### Humanly expanded

- control deviation and reciprocal-load estimates;
- nondominant forcing mechanism;
- dominant-label uniqueness and exception charging;
- corrected boundary penalty and phase bridge;
- global level-set encoder;
- localization and diagonal energy;
- Laplace and Gaussian sectors;
- pair-pool identity, forbidden budget, greedy selection;
- uniform weights and variance comparison;
- Taylor main arcs and Fourier-energy majorant;
- block fibre and squarefree sibling damping;
- terminal positivity;
- small denominators, numerator induction, and formal tuple bridge.

### Finite/kernel-residual

The following remain delegated to named declarations at the immutable release:

- long rational constant rearrangements in the single-block forcing theorem;
- explicit threshold maxima and natural/integer cast discharge;
- aggregate Taylor remainder inequalities;
- inverse-square component bounds;
- the final terminal numeric certificate.

Each residual is downstream of an explicit mathematical statement and has no
unrecorded assumption.

### External boundary

The article core itself uses only two abstract supplies:

1. eventual lower cardinality in each required dyadic block;
2. eventual reciprocal-prime mass at least \(21/20\) on the inclusive window
   \(k_0,\ldots,3k_0\).

The released backend derives them from the two exact
Rosser–Schoenfeld assumptions. The PNT-first paper backend is separate.
Human-visible comparison with the publisher scan remains `BLOCKED-SOURCE` and
is not represented as completed.

## 4. Review findings

1. The stale `GlobalControl.lean` header is a documentation-status defect;
   active downstream declarations close G5, G6, and G7.
2. Denominator size alone does not prove the control reciprocal-load bound;
   a dyadic prime-cardinality upper estimate is required.
3. The boundary theorem cannot be quoted without its label-size hypotheses.
4. The initial cold segment accounts for the sole
   \(1+\sqrt R/\sigma_{\rm ctrl}\) factor; later segment labels are charged to
   hot blocks or mismatch boundaries.
5. The mass-pool argument depends on base-load absorption, not on an
   unstated margin in the \(1/2\) pool bound.
6. Squarefreeness is used once for semiprime denominators and separately in
   the sibling-mismatch CRT argument.
7. The main/minor comparison requires the upper variance bound
   \(\sigma_E\le501\sigma_{\rm ctrl}\), not only the lower bound.

No new-mathematics implication failed reconstruction. No return to `E306-RL`
is required.

## 5. Next active frontier

The next active proof-development unit is the backend-independent theorem
\[
 \texttt{AnalyticInputs}\Longrightarrow
 \text{structural avoiding representation}
 \Longrightarrow
 \text{Erdős 306}.
\]
It must isolate the minimal sufficient eventual interfaces, state one common
threshold, preserve the inclusive endpoint \(3k_0\), and then prove two
separate providers:

- the immutable Rosser–Schoenfeld release backend;
- the human PNT/partial-summation backend.

The publisher-scan comparison is a source gate on the first provider, not a
block on the abstract interface theorem.
