# E306-PD-A7–A10 — main arcs, two minor sectors, gadget damping, and terminal positivity

**Ledger correspondence:** manuscript P27–P32  
**State:** `COMPLETE-DRAFT`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Inputs:** A5 finite Fourier selection; A6.1–A6.4 construction/control package  
**External analytic input:** none

## 1. Finite Fourier setting

Let \(E\) be the denominator family, let every \(e\in E\) divide \(L\), and
let
\[
 \theta\in[1/3,2/3],\qquad
 \sum_{e\in E}\frac{\theta}{e}=\frac1b.
\]
For \(h\in\mathbf Z/L\mathbf Z\), write
\[
 F(h)=
 \prod_{e\in E}
 \bigl((1-\theta)+\theta e^{2\pi ih/e}\bigr)
 e^{-2\pi ih/b}.
\]
Finite Fourier orthogonality gives
\[
 LW=\sum_{h\bmod L}F(h),
\]
where \(W\ge0\) is the weighted count of subsets \(A\subseteq E\) satisfying
\[
 \sum_{e\in A}L/e\equiv L/b\pmod L.
\]
It is enough to find a real main sum whose real part exceeds the total
absolute minor sum.

Put
\[
 \sigma_E^2=\sum_{e\in E}\frac{\theta(1-\theta)}{e^2},
 \qquad
 \sigma=\sigma_{\rm ctrl},
\]
and use the A6.4 comparison
\[
 \sqrt{\frac29}\,\sigma\le\sigma_E\le501\,\sigma.
\]

## 2. Main frequencies and Taylor expansion

Choose \(C\ge3\) and
\[
 N=\left\lceil\frac C\sigma\right\rceil.
\]
The final bottom scale is chosen so that

- \(2N<2^{2k_0}\);
- \(2N+1\le L\);
- \(1/\sigma_E\le N\);
- every \(|m/e|\), \(|m|\le N\), lies inside the fixed Taylor disk;
- the aggregate cubic remainder is at most \(1/10\).

For \(|m|\le N\), put
\[
 T_m=
 \prod_{e\in E}
 \bigl((1-\theta)+\theta e^{2\pi im/e}\bigr)
 e^{-2\pi im/b}.
\]

For a single factor, the analytic logarithm at the origin has expansion
\[
 \log\bigl((1-\theta)+\theta e^{2\pi iz}\bigr)
 =
 2\pi i\theta z
 -2\pi^2\theta(1-\theta)z^2
 +O(|z|^3),
\]
uniformly for \(\theta\in[1/3,2/3]\) and \(|z|\) in the chosen disk.
Summing over \(e\in E\) and inserting the terminal phase gives
\[
 \sum_e2\pi i\theta\frac m e-\frac{2\pi im}{b}=0
\]
by the exact expected-mass identity. Hence
\[
 \log T_m=-2\pi^2m^2\sigma_E^2+\delta_m,
 \qquad
 |\delta_m|\le C_3\sum_{e\in E}|m/e|^3.
\]
The numeric fields make \(|\delta_m|\le1/10\), so
\[
 \Re T_m\ge0.8e^{-2\pi^2m^2\sigma_E^2}.
\]

Conjugation sends \(T_m\) to \(T_{-m}\); therefore the main sum is real.
Since \(N\ge1/\sigma_E\), the integer interval
\[
 |m|\le\frac1{2\sigma_E}
\]
lies inside the main window and every such term has
\[
 e^{-2\pi^2m^2\sigma_E^2}\ge e^{-\pi^2/2}.
\]
Counting these integers coarsely yields
\[
 \Re\sum_{|m|\le N}T_m
 \ge\frac{c_3}{\sigma_E},
 \qquad
 c_3=0.8\,\frac{e^{-\pi^2/2}}2>0.
\]

The Taylor estimates and their scale hypotheses are packaged by
`MainArcNumericFields`; the concrete discharge is `r2_numericFields` /
`r2_close_numericFields`, and the resulting lower bound is threaded through
the R2 main-arc fields.

## 3. Universal Fourier-energy majorant

For \(t\in\mathbf R\),
\[
 |(1-\theta)+\theta e^{2\pi it}|^2
 =
 1-4\theta(1-\theta)\sin^2(\pi t).
\]
On the centered interval,
\[
 \sin^2(\pi t)\ge4\|t\|_{\mathbf R/\mathbf Z}^2,
\]
and \(\theta(1-\theta)\ge2/9\). Thus
\[
 |(1-\theta)+\theta e^{2\pi it}|^2
 \le
 1-\frac{32}{9}\|t\|^2
 \le
 e^{-(32/9)\|t\|^2}.
\]
Taking square roots and multiplying the factors gives
\[
 |F(h)|
 \le
 \exp\!\left(
 -\frac{16}{9}
 \sum_{e\in E}\|h/e\|^2\right)
 =
 e^{-(16/9)Q_E(h)}.
\]

This estimate is the bridge from the Fourier product to the control and
gadget energy budgets.

## 4. Block-minor sector

Map a frequency \(h\bmod L\) to its residue assignment
\[
 a(h)=(h\bmod p)_{p\in\operatorname{blockSupport}(BS)}.
\]
The block-minor sector consists of frequencies for which
\(a(h)\notin\mathfrak M(C)\).

The period has the exact form
\[
 L=b\prod_{p\in\operatorname{blockSupport}(BS)}p,
\]
with \(b\) coprime to the block-prime product. Fixing all block residues leaves
exactly \(b\) possible frequencies modulo \(L\), and in particular at most
\(b\).

The control energy is a sub-energy of the full Fourier energy:
\[
 Q_{\rm ctrl}(a(h))\le Q_E(h).
\]
Put
\[
 Q_{\rm extra}(h)=Q_E(h)-Q_{\rm ctrl}(a(h))\ge0.
\]
For each assignment fibre,
\[
 \sum_{\substack{h:a(h)=a}}
 e^{-(16/9)Q_{\rm extra}(h)}
 \le b.
\]
Therefore
\[
 \sum_{h\ {\rm block\ minor}}e^{-(16/9)Q_E(h)}
 \le
 b\sum_{a\notin\mathfrak M(C)}
 e^{-(16/9)Q_{\rm ctrl}(a)}.
\]
Apply A6.3 with \(c=16/9\):
\[
 \sum_{h\ {\rm block\ minor}}|F(h)|
 \le
 \frac{b\left(\eta+
 C_{\rm tail}e^{-C^2(16/9)/2}\right)}{\sigma}.
\]

The exact fibre implementation is `r2_blockFiberTail`; the multiplicity \(b\)
is an explicit CRT factor and is not hidden in an asymptotic constant.

## 5. Main-assignment siblings

The remaining minor frequencies have a main block assignment. Thus for some
integer \(m\) with
\[
 |m|\le C/\sigma\le N,
\]
\[
 h\equiv m\pmod p
 \qquad
 (p\in\operatorname{blockSupport}(BS)).
\]

For a fixed label \(m\), the block residues leave \(b\) frequencies modulo
\(L\). One is the genuine main frequency \(h\equiv m\pmod L\); the others are
siblings. Therefore
\[
 |S_{\rm extra}|\le b(2N+1).
\]

If a sibling agreed with \(m\) modulo every prime divisor of the squarefree
integer \(b\), it would agree modulo \(b\). Together with the block
congruences and CRT, this would force \(h\equiv m\pmod L\), contrary to its
being a sibling. Hence every sibling has a prime
\[
 r\mid b,\qquad h\not\equiv m\pmod r.
\]

This is the second, independent use of squarefreeness in the construction.

## 6. Gadget reservoirs and per-sibling damping

Choose one common set \(S\) of \(G\) high block primes. For every prime
\(r\mid b\), include all gadget denominators
\[
 rs,\qquad s\in S.
\]
The final scale ensures
\[
 2|m|<s.
\]

Fix a sibling and a mismatch prime \(r\). For each \(s\in S\), the congruence
agreement modulo \(s\), the mismatch modulo \(r\), and the centered
representative geometry give
\[
 \left|
 (1-\theta)+\theta e^{2\pi ih/(rs)}
 \right|
 \le
 \sqrt{1-\frac8{9r^2}}
 \le
 \sqrt{1-\frac8{9b^2}}
 =:\beta_b<1.
\]
The \(G\) gadget factors are distinct, so
\[
 |F(h)|\le\beta_b^G.
\]
Choose a target \(D_{\rm mp}>0\), then choose \(G\) so that
\[
 \beta_b^G\le D_{\rm mp}.
\]
It follows that
\[
 \sum_{h\in S_{\rm extra}}|F(h)|
 \le
 b(2N+1)D_{\rm mp}.
\]

The exact squarefree mismatch object is the
`r2ExtraSiblingChoice` chain; the count and damping are
`r2_extra_count_le`, the gadget pointwise estimate, and the extra-frequency
lane assembled in `r2_buildFreqLanes`.

## 7. Constant-first terminal choice

Let \(K_\sigma=501\), so that
\[
 \sigma_E\le K_\sigma\sigma.
\]
The constants are chosen in the following order.

### Step 1: block-control allowance

Set
\[
 \eta=\frac{c_3}{4K_\sigma b}
      =\frac{c_3}{2004b}.
\]
Apply the global control partition with \(c=16/9\), obtaining
\(C_{\rm tail}\) and a scale threshold.

### Step 2: Gaussian cutoff

Choose \(C\ge3\) so large that
\[
 bC_{\rm tail}e^{-C^2(16/9)/2}
 <
 \frac{c_3}{4K_\sigma}.
\]

### Step 3: sibling damping

Set
\[
 D_{\rm mp}
 =
 \frac{c_3}{4K_\sigma b(2C+3)}
 =
 \frac{c_3}{2004b(2C+3)}.
\]
Choose \(G\) so that \(\beta_b^G\le D_{\rm mp}\).

### Step 4: bottom scale

Only now choose \(k_0\), above the finite maximum of the thresholds for:

- the two abstract prime supplies;
- A6.1 control load and control deviation;
- A6.2/A6.3 global control;
- the \(G\) high gadget primes;
- avoidance of \(T\);
- mass-batch selection;
- variance comparison;
- \(2N<2^{2k_0}\) and \(2N+1\le L\);
- the Taylor disk and cubic remainder;
- all finite cardinality and inverse-square estimates.

No later choice changes \(C,\eta,D_{\rm mp}\), or \(G\).

## 8. Minor budget versus main term

Since \(N=\lceil C/\sigma\rceil\) and \(\sigma\le1\),
\[
 (2N+1)\sigma\le2C+3.
\]
Multiplying the two minor estimates by \(\sigma\) gives three components:
\[
 b\eta,\qquad
 bC_{\rm tail}e^{-C^2(16/9)/2},\qquad
 b(2N+1)\sigma D_{\rm mp}.
\]
By construction, each is below or equal to \(c_3/(4K_\sigma)\), with a
strict inequality in the Gaussian lane. Hence
\[
 \sum_{h\in S_m}|F(h)|
 <
 \frac{c_3}{K_\sigma\sigma}.
\]
Because \(\sigma_E\le K_\sigma\sigma\),
\[
 \frac{c_3}{K_\sigma\sigma}
 \le
 \frac{c_3}{\sigma_E}.
\]
Therefore
\[
 \sum_{h\in S_m}|F(h)|
 <
 \frac{c_3}{\sigma_E}
 \le
 \Re\sum_{h\in S_M}F(h).
\]

The finite released assembly uses four quarter-budgets
(\(2004=4\cdot501\)); the unused quarter supplies strict slack.

## 9. Positivity and exact reciprocal equality

The complete Fourier sum has positive real part, so the nonnegative weighted
count \(W\) is positive. Hence there exists a subset \(A\subseteq E\) with
positive product weight satisfying
\[
 \sum_{e\in A}L/e\equiv L/b\pmod L.
\]
Dividing by \(L\),
\[
 \sum_{e\in A}\frac1e\equiv\frac1b\pmod1.
\]
The total reciprocal load of all \(E\) is below \(1\), and both sides lie in
\([0,1)\). Therefore the congruence is an equality:
\[
 \sum_{e\in A}\frac1e=\frac1b.
\]
All selected denominators are distinct squarefree semiprimes and avoid \(T\).

This closes the structural avoiding theorem for every squarefree \(b\ge3\).

## 10. Formal correspondence and trust classification

| Human node | Released endpoint | Classification |
|---|---|---|
| expected-mass cancellation | `R2ConcreteData.Weights` fields | exact identity |
| Taylor/numeric hypotheses | `MainArcNumericFields`, `r2_numericFields`, `r2_close_numericFields` | finite/kernel-residual after explicit expansion |
| main Gaussian lower bound | R2 main-arc lower fields | human proof supplied |
| Fourier-energy majorant | finite Fourier energy lemmas consumed by R2 minor support | human proof supplied |
| block fibre multiplicity | `r2_blockFiberTail` | exact CRT count |
| main-label/sibling partition | `mainArcClassificationData`, integer frequency label data | finite classification |
| squarefree mismatch | `r2ExtraSiblingChoice` chain | human proof supplied |
| sibling count | `r2_extra_count_le` | exact finite count |
| gadget damping | R2 multi-gadget lane | human proof supplied; pointwise constant exact |
| lane assembly | `r2_buildFreqLanes` | exact dependency threading |
| terminal constants | `exists_arcConstruction_final` in `R2TopAssembly` | finite/kernel-residual budget |
| structural representation | `exists_arcConstruction_final` \(\to\) `egyptian_rep_ge3_R2` | direct released assembly |

There is no new external input in P27–P32. The only delegated work is the
explicit finite inequality discharge under the displayed parameter order.

## 11. Manuscript repair consequence

A consumer proof must retain:

- the exact linear-term cancellation;
- the aggregate cubic-remainder hypothesis;
- the exponent \(16/9\) in the Fourier-energy majorant;
- the explicit CRT fibre factor \(b\);
- the squarefree mismatch lemma;
- the common \(G\)-element gadget set;
- the factor \(b(2N+1)\);
- the relation \((2N+1)\sigma\le2C+3\);
- the constant order \(\eta\to C\to D_{\rm mp}\to G\to k_0\);
- the variance comparison needed to put main and minor terms on one scale.

Suppressing any of these changes a load-bearing implication.

`E306-PD-A7–A10` is `COMPLETE-DRAFT`.
