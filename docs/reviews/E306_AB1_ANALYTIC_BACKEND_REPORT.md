# E306-AB1 Analytic Backend Report

Workstream: `E306-AB1-01`  
Branch base: `c264d00a722364c777d89e4438aadc7babfcdbe0`  
Audit date: 2026-07-16  
Status: bounded independent recommendation; no manuscript, Lean, release, DOI, or arXiv state is changed by this report.

## 1. Executive recommendation

The paper should motivate the analytic handoff from the **prime number theorem alone**, not from a parallel PNT-plus-Mertens package and not from the explicit Rosser--Schoenfeld estimates used by release `v0.0.3`.

Let

\[
P_k:=\{p\text{ prime}:2^k\le p<2^{k+1}\},\qquad
A_k:=\sum_{p\in P_k}\frac1p.
\]

A one-paragraph Abel/partial-summation argument from

\[
\pi(x)\sim \frac{x}{\log x}
\]

gives

\[
A_k\sim \frac1k.
\]

This local multiplicative-block law is the clean single analytic handoff. It implies both supplies used by the construction:

1. eventually
   \[
   |P_k|\ge \frac{2^k}{2\log(2^k)};
   \]
2. eventually
   \[
   \sum_{k=k_0}^{3k_0}A_k\ge \frac{21}{20}.
   \]

The logically weaker natural one-interface condition is

\[
\tag{L_c}
\exists c\ge\frac{21}{20\log 3}\;\exists K\;\forall k\ge K,
\qquad A_k\ge \frac{c}{k}.
\]

Numerically,

\[
\frac{21}{20\log 3}=0.955751\ldots,
\qquad
\frac1{2\log 2}=0.721347\ldots.
\]

Thus the long-window mass requirement is the binding constant: any `L_c` strong enough for the `21/20` mass automatically exceeds the coefficient needed for the cardinality target. Equality at the mass coefficient already suffices because the inclusive harmonic window is strictly larger than `log 3`.

For exposition, however, the asymptotic `A_k ~ 1/k` is preferable to presenting the artificial-looking threshold constant in the first analytic statement. The report therefore recommends:

- **paper theorem:** PNT;
- **paper bridge lemma:** `A_k ~ 1/k`, proved in the paper by partial summation;
- **construction interface:** eventual consequences of that lemma;
- **formal/release audit:** retain the exact Rosser--Schoenfeld pair as the actual nonstandard assumptions of `v0.0.3`.

## 2. Exact structural package consumed by the construction

The construction does not intrinsically consume the assertions at every scale `k >= 5`. It consumes finite selections and reciprocal mass after a bottom scale is chosen **last**, after all constants and finite exceptional sets have been fixed.

The structural content can be stated as follows.

### 2.1 Eventual block capacity

There is a threshold `K_D` such that for every `k >= K_D`,

\[
\tag{D_ev}
|P_k|\ge \frac{2^k}{2\log(2^k)}.
\]

The construction uses this only to make prescribed finite selections in every block in a finite scale window whose lower endpoint is eventually taken above `K_D`.

### 2.2 Eventual inclusive-window reciprocal mass

There is a threshold `K_M` such that for every `k_0 >= K_M`,

\[
\tag{M_ev}
\sum_{k=k_0}^{3k_0}A_k
=
\sum_{2^{k_0}\le p<2^{3k_0+1}}\frac1p
\ge \frac{21}{20}.
\]

The equality records the endpoint convention exactly: inclusive block indices `k_0,...,3k_0` cover the half-open prime interval

\[
[2^{k_0},2^{3k_0+1}).
\]

### 2.3 Finite lower-scale conditions

Any further demand of the form `k_0 >= K_*` can be absorbed into the final choice

\[
k_0\ge \max(K_D,K_M,K_*,\ldots).
\]

This is precisely the constant-first/scale-last architecture. A fixed number such as `5` is therefore not a mathematical invariant of the construction unless some downstream argument uses a property at one of the finitely many scales below the final `k_0`. The audited manuscript does not do so.

The estimate used to turn prime reciprocal mass into pair reciprocal mass is itself already valid slightly below the current interface threshold. From

\[
S_1\ge \frac{21}{20},\qquad
S_2\le \frac1{2^{k_0}-1},
\]

one has

\[
\frac{S_1^2-S_2}{2}>\frac12
\]

for `k_0 >= 4`; the manuscript's `k_0 >= 5` is safe but not sharp. In any event the construction takes `k_0` much larger than either number.

## 3. Recommended paper backend

### 3.1 Starting theorem

Use the prime number theorem in its standard form

\[
\pi(x)\sim \frac{x}{\log x}.
\]

A directly checkable modern statement is K. Soundararajan, “The distribution of prime numbers,” Lecture 1, opening paragraph (p. 1), arXiv:math/0606408. A. E. Ingham, *The Distribution of Prime Numbers*, Theorem 23, is the standard monograph locator.

### 3.2 Local bridge

Prove in the manuscript, rather than cite as a second black box, that

\[
\sum_{x\le p<2x}\frac1p
\sim \frac{\log 2}{\log x}.
\]

For `x=2^k`, both endpoints are composite once `k >= 2`, so no endpoint correction survives and the result becomes

\[
A_k\sim \frac1k.
\]

The complete derivation, including uniformity and remainders, is in `E306_AB1_IMPLICATION_MAP.md`.

### 3.3 Why this is the best motivation

This backend has four advantages.

1. **One classical theorem explains both supplies.** The cardinality and reciprocal-mass hypotheses cease to look like unrelated imported estimates.
2. **The local quantity matches the combinatorics.** The construction is blockwise, and `A_k` is exactly the reciprocal resource present in one block.
3. **No explicit constants masquerade as conceptual necessities.** The numbers `5` and `20` remain implementation witnesses of the Rosser--Schoenfeld backend, not the reason the construction works.
4. **The proof is source-light but fully checkable.** PNT is cited once; the only nontrivial implication is written out.

## 4. Why ordinary reciprocal-prime Mertens is not the single handoff

Write

\[
S(x):=\sum_{p\le x}\frac1p
=
\log\log x+B+E(x).
\]

The ordinary statement `E(x)=o(1)` does imply, for every fixed `a>1`,

\[
S(X^a)-S(X)=\log a+o(1).
\]

Hence it is fully sufficient for the long-window mass `M_ev`, with `a=3` (and a harmless inclusive-endpoint adjustment).

It does **not** imply a useful estimate for one dyadic block. There the main term is

\[
\log\log(2x)-\log\log x
\sim \frac{\log 2}{\log x},
\]

which tends to zero. The difference `E(2x)-E(x)` is merely `o(1)` and can be much larger than `1/log x`.

Even the classical global estimate `E(x)=O(1/log x)` does not, without a verified small constant or additional local control, imply the asymptotic of a single dyadic block: its error is of the same order as the desired main term.

A sufficient local remainder condition is

\[
\tag{E_loc}
E(2x)-E(x)=o\!\left(\frac1{\log x}\right).
\]

A simple stronger global condition is `E(x)=o(1/log x)`; an explicit `O(1/log^2 x)` estimate is also sufficient. Rosser--Schoenfeld Theorem 5 supplies the latter kind of explicit control, but using it as the conceptual paper starting point obscures the fact that PNT already yields the needed local law directly.

## 5. Candidate backends and tradeoffs

| Backend | Cardinality supply | Long-window mass | Single local handoff | Threshold type | Assessment |
|---|---:|---:|---:|---|---|
| PNT via partial summation | yes, eventual | yes, eventual | yes: `A_k ~ 1/k` | ineffective eventual | **recommended paper backend** |
| PNT direct for cardinality + ordinary Mertens for mass | yes | yes | no | eventual | correct but redundant and conceptually split |
| Ordinary Mertens `log log x+B+o(1)` alone | not established | yes | no | eventual | insufficient for a dyadic block |
| Classical `O(1/log x)` Mertens alone | not without constants/local control | yes | no | explicit order only | same-order error; insufficient as stated |
| Quantified/local Mertens with `E_loc`, or `o(1/log x)` | yes | yes | yes | eventual | sufficient, but less canonical than PNT |
| Rosser--Schoenfeld Cor. 3 + Thm. 5 | yes | yes | no: two explicit inputs | explicit (`k>=5`, witness `k_1=20`) | best current formal/release backend; not best motivation |
| A lower law `L_c` | yes | yes | yes | eventual | weakest natural construction-facing package; should be a derived interface, not the headline analytic theorem |

No cleaner standard theorem was found that is both weaker than PNT in a natural bibliographic sense and more transparent than the local bridge derived from PNT. One may equivalently start from `theta(x) ~ x`, but this merely changes the standard formulation of PNT and does not simplify the publication-source chain.

## 6. Relation to release `v0.0.3`

Nothing in this recommendation alters the release trust boundary.

The exact nonstandard inputs of immutable release

`v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

remain:

- `RosserSchoenfeld.rosser_schoenfeld_cor3`;
- `RosserSchoenfeld.rosser_schoenfeld_thm5`.

Their source locators are:

- Rosser--Schoenfeld (1962), Corollary 3, equation (3.8), p. 69;
- Rosser--Schoenfeld (1962), Theorem 5, equations (3.17)--(3.18), p. 70.

The release derives `GlobalControl.dyadic_prime_density` with the explicit range `k >= 5`, and derives `GlobalControl.dyadic_mertens_cumulative` with the explicit witness `k_1=20`. The PNT/Mertens discussion is conceptual paper mathematics only; it must never be described as an assumption of `v0.0.3`.

## 7. Implications for the P1 manuscript

Subject to `E306-DIR` acceptance, the clean revision would be:

1. replace the two-motivation narrative (“PNT gives D; Mertens gives M”) by one analytic lemma derived from PNT;
2. state the construction-facing assumptions eventually, or state them only after choosing the bottom scale;
3. preserve a separate formalization paragraph saying that `v0.0.3` realizes the supplies by the explicit Rosser--Schoenfeld pair;
4. correct every window description to the actual inclusive-block interval `[2^{k_0},2^{3k_0+1})`;
5. avoid saying that ordinary `o(1)` Mertens controls a single dyadic block.

There is one genuine Director decision. The current manuscript names conditions `D` and `M` with the fixed lower threshold `5`. A PNT-only proof naturally gives eventual versions, not those exact finite assertions. The manuscript can either:

- refactor `D` and `M` to `D_ev` and `M_ev` (mathematically cleanest); or
- retain the fixed-threshold interface and continue to prove it from explicit Rosser--Schoenfeld estimates (closer to the formal release, but no longer a PNT-only paper backend).

The first option does not change the actual construction, because its scale is chosen last, but it does change the manuscript's named interface and therefore requires `E306-DIR` disposition.

## 8. Implications for future Lean work

At the pinned frozen architecture (`Lean 4.31.0`, Mathlib commit `fabf563a7c95a166b8d7b6efca11c8b4dc9d911f`), Mathlib supplies:

- `Nat.primeCounting` and prime finite-set infrastructure;
- Abel summation (`Mathlib.NumberTheory.AbelSummation`);
- the Chebyshev functions and explicit Chebyshev bounds in `Mathlib.NumberTheory.Chebyshev`;
- divergence of the reciprocal-prime series in `Mathlib.NumberTheory.SumPrimeReciprocals`.

It does not expose the PNT as a Mathlib declaration at that ref. The Mathlib theorem-status file points instead to the external `PrimeNumberTheoremAnd` project, whose exact referenced commit contains `WeakPNT` and stronger error-term developments.

Consequently there are two plausible future formal routes.

1. **Near-term, low-risk:** retain the Rosser--Schoenfeld pair. It is already integrated and supplies explicit thresholds.
2. **Longer-term conceptual alignment:** import or upstream a PNT theorem and formalize the finite-interval partial-summation bridge to `A_k ~ 1/k`, then derive eventual `D_ev` and `M_ev`.

The second route is architecturally attractive but is not currently a drop-in Mathlib replacement. It would also require a deliberate interface decision about eventual versus fixed thresholds.

## 9. Risks and Director decisions

### Verified conclusions

- PNT alone implies the local dyadic reciprocal-prime asymptotic.
- That local law implies both required supplies eventually.
- The `21/20` long-window constant is the binding coefficient for a uniform `c/k` lower law.
- Ordinary Mertens `+o(1)` gives the long window but not one dyadic block.
- The inclusive blocks `k_0,...,3k_0` correspond exactly to `[2^{k_0},2^{3k_0+1})`.
- Fixed `k>=5` is not intrinsic to the constant-first/scale-last construction.

### Decisions requiring `E306-DIR`

1. Accept or reject the PNT-only paper backend.
2. Decide whether P1 may replace fixed-threshold `D,M` by eventual interfaces.
3. Decide whether the paper should state the elegant asymptotic `A_k ~ 1/k` or the weaker construction-facing `L_c` as the named handoff.
4. Decide whether future Lean work should remain on the explicit Rosser--Schoenfeld backend or open a separately authorized PNT-integration workstream.

### Unresolved blockers

None within the bounded review. The recommended paper source chain and all load-bearing locators used in this packet are recorded in `E306_AB1_SOURCE_AUDIT.md`. No source disagreement was found.
