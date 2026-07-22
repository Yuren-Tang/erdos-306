# E306-PDL article-core checkpoint

**Scope:** released human-proof spine from control construction through Fourier
positivity, plus analytic and arithmetic closure  
**Authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Independent Review B:** `review/e306-p1-construction-v1@0b9c79d8727152d5e2511b39a48bbea0d437487e`  
**Current read-only manuscript input:** `paper/arxiv-v1-revision-v3@94615a5c860be9ce04c2be0153759a4e66fc25ab`  
**Status:** `READY-FOR-MANUSCRIPT-CONSUMER`  
**Consumer restriction:** this checkpoint authorizes no direct manuscript,
Lean, release, workflow, tag, DOI, or other-branch mutation

## 1. Completed proof package

| Unit | Manuscript ledger | State |
|---|---|---|
| `E306-PD-B1–B3` | P4–P10 | `COMPLETE-DRAFT` |
| `E306-PD-A6.1` | P16 | `COMPLETE-DRAFT` |
| `E306-PD-A6.2` | P17–P18 | `COMPLETE-DRAFT` |
| `E306-PD-A6.3` | P19–P23 | `COMPLETE-DRAFT` |
| `E306-PD-A6.4` | P24–P26 | `COMPLETE-DRAFT` |
| `E306-PD-A7–A10` | P27–P32 | `COMPLETE-DRAFT` |
| `E306-PD-A11–A13` | P0–P3, P33, formal bridge | `COMPLETE-DRAFT` |
| `REVIEW_B_RECONCILIATION` | RB-01–RB-20 | `READY-FOR-MANUSCRIPT-REVISION` |
| `E306-PD-MECH-01` | public numerical spine and parameter order | `READY-FOR-MANUSCRIPT-CONSUMER` |

Together these files give one dependency-respecting human argument from either
construction-facing analytic provider to the public Erdős 306 theorem, followed
by a mechanism-first symbolic architecture suitable for the prepared REV4
manuscript worker.

The controlling manuscript sources are now:

1. `proof-development/REVIEW_B_RECONCILIATION.md` for exact mathematical and
   translation-fidelity repairs;
2. `proof-development/E306-PD-MECH-01-CONSTANT-PURIFICATION.md` for the audit of
   every public numerical choice;
3. `proof-development/E306-PD-MECH-01-MANUSCRIPT-ARCHITECTURE.md` for the exact
   symbolic replacement architecture and terminal parameter order.

## 2. Review B result and reconciliation

Review B classified the earlier fixed candidate as
`BOUNDED MATHEMATICAL REVISION REQUIRED`. It found:

- no `MATERIAL-MATHEMATICAL-GAP`;
- no indispensable unrecorded downstream theorem;
- no circular parameter dependence;
- no material mismatch with the released headline theorem;
- bounded human-exposition and translation-fidelity repairs concentrated in
  P16–P23 and P26–P32.

The reconciliation absorbs `RB-01`–`RB-17` into exact PDL proof sources.
`RB-18` remains an instruction to synchronize the manuscript proof ledger only
after the actual rewrite. `RB-19` is a separately authorized documentation-only
Lean cleanup. `RB-20` records that Review B did not independently rerun the
kernel or CI; it is not a mathematical obligation.

The fixed REV3 manuscript input remains unchanged by PDL and is not certified as
submission-ready. The mechanism packet is a consumer instruction, not a mutation
or approval of that input.

## 3. Load-bearing corrections preserved

### Exact control system and load

The block support, internal control graph, adjacent complete bipartite graph,
faithful finite assignment space, and centred CRT representative are explicit.
The mechanism needs

\[
 \operatorname{load}(E_{\rm ctrl})=O(1/k_0),
 \qquad
 \sigma_{\rm ctrl}\ge \frac{c_\sigma}{k_0 2^{k_0}}
\]

for one fixed `c_sigma>0`. The human and released certificates

\[
 \operatorname{load}(E_{\rm ctrl})
 \le \frac{32}{k_0-1}
 \le \frac{512}{k_0-1},
 \qquad c_\sigma=1/100,
\]

remain available but are no longer presented as intrinsic architecture.
Quadratic denominator growth alone is not cited as a proof.

### Corrected adjacent-label theorem

The active boundary theorem retains label-size, reduced block-cardinality,
residue-agreement, and exception hypotheses. The unqualified original statement
is false. The package uses `mismatch_penalty_with_exceptions` and its valid
specialization. Local powers of two and rational constants are finite
certificates for this structural implication.

### Label-uniform global level sets

Non-wrapped huge-label fibres are empty; wrapped huge-label fibres inject into
a fixed small-label fibre. The purified global interface has the form

\[
 \#\mathcal L(R)
 \le e^{A_\gamma J}e^{\gamma R}
 \left(1+\frac{\sqrt R}{\sigma_{\rm ctrl}}\right),
\]

for every chosen `gamma>0`, after a scale threshold. The factor `e^(A_gamma J)`
is structural block entropy. The previous `8 epsilon` is one finite encoding
certificate.

### Exact mass and variance bookkeeping

The pair-pool lower bound `1/2` has no hidden surplus. Forbidden control and
gadget products are absorbed by the already-spent base load.

The reciprocal-load normalization is coherently parameterized by
`alpha=3/2`, giving

\[
 \frac{3}{2b}\le\Lambda<\frac3b,
 \qquad \frac13<\theta\le\frac23,
 \qquad v_*:=\min\theta(1-\theta)=\frac29.
\]

This choice maximizes the worst-case Bernoulli variance within the admissible
greedy normalization range. The variance comparison is written symbolically as

\[
 \sqrt{v_*}\,\sigma_{\rm ctrl}
 \le\sigma_E\le K_\sigma\sigma_{\rm ctrl}.
\]

The released finite instantiation is `C_2=1000001`, `K_sigma=501`.

### Main arc and minor lanes

Choose symbolic Taylor data

\[
 0<r_T<1/4,
 \qquad 0<\delta_T<\pi/2,
\]

and define

\[
 a_T=e^{-\delta_T}\cos\delta_T>0,
 \qquad
 c_{\rm maj}=\frac{a_T}{2}e^{-\pi^2/2}>0.
\]

The Bernoulli factors are nonzero in the Taylor disk and lie in the open right
half-plane, so the logarithm branch is justified. The earlier values `1/10` and
`0.8` are safety/finite certificates.

The minor frequencies split exactly as

\[
 S_{\rm blk}=S_m\cap\{a(h)\notin\mathfrak M(C)\},
 \qquad
 S_{\rm ext}=S_m\cap\{a(h)\in\mathfrak M(C)\}.
\]

The Fourier-energy exponent is derived from the weight normalization:

\[
 c_F=8v_*=16/9.
\]

The block fibre has multiplicity at most `b`. The extra lane uses explicit
label and mismatch-prime choices, one common `G`-prime reservoir, distinct edge
membership, `2|m|<s`, and the count `b(2N+1)`. Its one-factor damping is governed
by

\[
 \beta_b=\sqrt{1-4v_*/b^2}
        =\sqrt{1-8/(9b^2)}<1.
\]

### Purified terminal order

Choose positive shares

\[
 q_{\rm blk},q_{\rm gauss},q_{\rm sib}>0,
 \qquad
 q_{\rm blk}+q_{\rm gauss}+q_{\rm sib}<1.
\]

Set `M_0=c_maj/K_sigma` and choose

\[
 \eta=\frac{q_{\rm blk}M_0}{b},
\]

then `C` from

\[
 bC_{\rm tail}e^{-c_FC^2/2}<q_{\rm gauss}M_0,
\]

then

\[
 D_{\rm sib}
 =\frac{q_{\rm sib}M_0}{b(2C+3)},
\]

then `G` with `beta_b^G<=D_sib`, and only then choose `k0` as one finite
maximum of all earlier thresholds.

The previous values `q_blk=q_gauss=q_sib=1/4` and `2004=4*501` are a symmetric
safety allocation, not independent mathematical constants.

### Public theorem bridge

The construction yields a finite set. It is ordered increasingly, the dummy
anchor `1` is prepended, and the anchor is excluded from the finite sum. No
infinite sequence is asserted. The mathematical equivalence between a product
of two distinct primes and `omega=Omega=2` is proved in both directions in the
reconciliation packet.

## 4. Trust classification

### Humanly expanded

- analytic interface and separate RS/PNT providers;
- control geometry and reciprocal-load estimates;
- nondominant forcing, dominant labels, exceptions, and wrapped labels;
- corrected boundary penalty and global encoder;
- localization, Laplace absorption, and Gaussian tail;
- pair-pool cancellation, greedy mass selection, weights, and variance;
- Taylor main arcs, exact minor split, fibre count, and gadget reservoir;
- symbolic terminal budgets and positivity;
- exceptional denominators, numerator induction, and finite tuple bridge.

### Finite/kernel residuals

Named release declarations retain long rational rearrangements, threshold
maxima, cast/floor discharge, local cold-block constants, aggregate Taylor
constants, inverse-square component arithmetic, and the final numerical
certificate. Each is downstream of an explicit mathematical statement and
introduces no external assumption.

### External boundary

The released backend uses exactly

- `RosserSchoenfeld.rosser_schoenfeld_cor3`;
- `RosserSchoenfeld.rosser_schoenfeld_thm5`.

The PNT/Abel provider is separate. Human comparison of the two RS
transcriptions with the publisher scan remains `BLOCKED-SOURCE`; it does not
reopen the completed downstream proof or the mechanism purification.

## 5. Manuscript-consumer state

The next manuscript worker must start from exactly
`paper/arxiv-v1-revision-v3@94615a5c860be9ce04c2be0153759a4e66fc25ab`,
consume the Review B reconciliation and both `E306-PD-MECH-01` files, perform the
actual manuscript rewrite, synchronize `PROOF_LEDGER.md`, and return a new exact
candidate for assurance.

The consumer must preserve the structural boundaries and exact fibre factors,
explain the `alpha=3/2` normalization, present the symbolic variance/Taylor/tail
constants, replace the hard-coded quarters by budget shares with total below
`1`, and identify concrete released numbers as finite certificates.

`READY-FOR-MANUSCRIPT-CONSUMER` certifies the proof-development packet only. It
does not certify or mutate the read-only REV3 input.

No return to `E306-RL` is required: the purification uses only existing proof
implications and elementary reparameterization. The persistent PDL programme
continues with its non-blocking C4 architecture comparison, future returned
defects, source certification, and interface generalization.
