# E306-AB1 Implication Map

Workstream: `E306-AB1-01`  
Purpose: theorem-by-theorem derivation, remainder audit, endpoint audit, and exact replacement candidates for conditions `D` and `M`.

## 1. Notation and target interfaces

For integers `k >= 1`, set

\[
P_k:=\{p\text{ prime}:2^k\le p<2^{k+1}\},
\qquad
A_k:=\sum_{p\in P_k}\frac1p.
\]

The current manuscript interfaces are

\[
\tag{D}
|P_k|\ge \frac{2^k}{2\log(2^k)}
\quad(k\ge5)
\]

and

\[
\tag{M}
\exists k_1\ge5\ \forall k_0\ge k_1,
\qquad
\sum_{k=k_0}^{3k_0}A_k\ge\frac{21}{20}.
\]

Because the index interval is inclusive,

\[
\bigcup_{k=k_0}^{3k_0}P_k
=
\{p\text{ prime}:2^{k_0}\le p<2^{3k_0+1}\}.
\]

The actual construction only needs eventual analogues `D_ev` and `M_ev`, since `k_0` is selected after all constants and finite exceptions.

## 2. Full implication graph

```text
PNT: pi(x) ~ x/log x
  |
  | Abel/partial summation on [x,2x]
  v
Local dyadic law: sum_{x <= p < 2x} 1/p
                  ~ log(2)/log(x)
  |
  | x = 2^k
  v
L: A_k ~ 1/k
  |                              |
  | A_k <= |P_k|/2^k             | sum over k=k0,...,3k0
  v                              v
D_ev: eventual cardinality       M_ev: inclusive long-window mass

L => L_c for every c<1
L_c with c >= 21/(20 log 3)
  => both D_ev and M_ev

Ordinary Mertens: S(x)=log log x+B+o(1)
  => fixed power-window mass S(X^a)-S(X) -> log a
  => M_ev
  -/-> local dyadic law (error scale too large)
  -/-> D_ev by the reciprocal-block route

Quantified local Mertens:
E(2x)-E(x)=o(1/log x)
  => local dyadic law
  => D_ev and M_ev

Rosser--Schoenfeld Cor. 3 => D with explicit k>=5
Rosser--Schoenfeld Thm. 5 => M with explicit witness k1=20
```

## 3. PNT implies the local dyadic reciprocal-prime law

### Theorem 3.1

Assume

\[
\pi(x)=\frac{x}{\log x}(1+o(1)).
\]

Then

\[
\sum_{x\le p<2x}\frac1p
=
\frac{\log2}{\log x}+o\!\left(\frac1{\log x}\right).
\]

### Proof

For endpoint clarity first use the interval `(x,2x]`. Abel summation for the step function `pi` and `f(t)=1/t` gives

\[
\sum_{x<p\le2x}\frac1p
=
\frac{\pi(2x)}{2x}-\frac{\pi(x)}x
+
\int_x^{2x}\frac{\pi(t)}{t^2}\,dt.
\tag{3.1}
\]

Define

\[
\varepsilon(x):=
\sup_{t\ge x}
\left|\frac{\pi(t)\log t}{t}-1\right|.
\]

PNT implies `epsilon(x) -> 0`. Hence uniformly for `t in [x,2x]`,

\[
\pi(t)=\frac{t}{\log t}(1+O(\varepsilon(x))).
\]

The integral term in (3.1) is therefore

\[
\begin{aligned}
\int_x^{2x}\frac{\pi(t)}{t^2}\,dt
&=
\int_x^{2x}\frac{dt}{t\log t}
+O\!\left(\varepsilon(x)
\int_x^{2x}\frac{dt}{t\log t}\right)\\
&=
\log\frac{\log(2x)}{\log x}
+o\!\left(\frac1{\log x}\right)\\
&=
\frac{\log2}{\log x}
+O\!\left(\frac1{\log^2x}\right)
+o\!\left(\frac1{\log x}\right).
\end{aligned}
\tag{3.2}
\]

For the boundary term,

\[
\frac{\pi(2x)}{2x}-\frac{\pi(x)}x
=
\frac1{\log(2x)}-\frac1{\log x}
+o\!\left(\frac1{\log x}\right)
=o\!\left(\frac1{\log x}\right).
\tag{3.3}
\]

Combining (3.1)--(3.3) proves the assertion for `(x,2x]`.

Changing `(x,2x]` to `[x,2x)` alters the sum by at most `1/x+1/(2x)`, which is `o(1/log x)`. In the application `x=2^k` with `k>=2`, both `x` and `2x` are composite, so the two interval conventions agree exactly. QED.

### Corollary 3.2

With `x=2^k`,

\[
A_k
=
\frac{\log2}{\log(2^k)}+o(1/k)
=
\frac1k+o(1/k).
\tag{L}
\]

No reciprocal-prime Mertens theorem is used in this derivation.

## 4. The local law implies eventual cardinality supply

For every `p in P_k`, `p>=2^k`, hence

\[
\frac1p\le\frac1{2^k}.
\]

Summing gives

\[
A_k\le\frac{|P_k|}{2^k},
\qquad
|P_k|\ge2^kA_k.
\tag{4.1}
\]

From `A_k ~ 1/k`, for every fixed `c<1` there is `K(c)` such that

\[
A_k\ge\frac c k\qquad(k\ge K(c)).
\tag{4.2}
\]

The target is

\[
\frac{2^k}{2\log(2^k)}
=
\frac{2^k}{2k\log2}.
\]

Thus (4.1)--(4.2) imply the target whenever

\[
c\ge\frac1{2\log2}=0.721347\ldots.
\]

Since one may choose any `c<1`, for example `c=0.9`, there exists `K_D` such that

\[
|P_k|\ge\frac{2^k}{2\log(2^k)}
\qquad(k\ge K_D).
\tag{D_ev}
\]

This proves the requested implication. It does not identify `K_D=5`; PNT is asymptotic and supplies no such fixed witness without an explicit estimate or finite verification.

## 5. The local law implies inclusive long-window mass

Fix `epsilon>0`. From `A_k~1/k`, for all sufficiently large `k`,

\[
A_k\ge\frac{1-\varepsilon}{k}.
\]

Therefore

\[
\sum_{k=k_0}^{3k_0}A_k
\ge
(1-\varepsilon)\sum_{k=k_0}^{3k_0}\frac1k.
\tag{5.1}
\]

The harmonic window satisfies

\[
\sum_{k=k_0}^{3k_0}\frac1k
=H_{3k_0}-H_{k_0-1}
\longrightarrow\log3.
\tag{5.2}
\]

Since

\[
\log3=1.098612\ldots>\frac{21}{20}=1.05,
\]

choose, for instance, `epsilon=0.02`. Then

\[
0.98\log3=1.076640\ldots>1.05.
\]

Equations (5.1)--(5.2) yield a threshold `K_M` such that

\[
\sum_{k=k_0}^{3k_0}A_k\ge\frac{21}{20}
\qquad(k_0\ge K_M).
\tag{M_ev}
\]

This is exactly the inclusive block window; no endpoint has been dropped. The corresponding prime interval is `[2^{k_0},2^{3k_0+1})`.

## 6. Weakest natural one-interface lower law

Suppose there are constants `c,K` such that

\[
A_k\ge\frac c k\qquad(k\ge K).
\tag{6.1}
\]

### Cardinality

By (4.1), condition (6.1) implies `D_ev` if

\[
c\ge\frac1{2\log2}.
\tag{6.2}
\]

### Long-window mass

By (5.2), condition (6.1) implies `M_ev` if

\[
c\log3\ge\frac{21}{20},
\quad\text{i.e.}\quad
c\ge\frac{21}{20\log3}=0.955751\ldots.
\tag{6.3}
\]

Condition (6.3) is stronger than (6.2), because

\[
0.955751\ldots>0.721347\ldots.
\]

Hence the single lower law

\[
\tag{L_c}
\exists c\ge\frac{21}{20\log3}\;\exists K\;\forall k\ge K,
\quad A_k\ge\frac c k
\]

implies both supplies. At equality, use the strict integral comparison

\[
\sum_{k=k_0}^{3k_0}\frac1k
>\int_{k_0}^{3k_0+1}\frac{dt}{t}
>\log3.
\]

The convenient asymptotic criterion

\[
\liminf_{k\to\infty}kA_k>\frac{21}{20\log3}
\]

is slightly stronger and implies such an `L_c` with strict margin. The displayed `L_c` is the weakest natural **uniform per-block coefficient condition** revealed by the audit. It is not the absolutely weakest conceivable hypothesis: one could directly assume only the separate eventual capacity and aggregate-window conditions. `L_c` is valuable because it is a single local resource law.

## 7. Ordinary Mertens: what it does and does not imply

Let

\[
S(x):=\sum_{p\le x}\frac1p
=
\log\log x+B+E(x).
\]

### 7.1 Fixed multiplicative power windows

If `E(x)=o(1)`, then for fixed `a>1`,

\[
\begin{aligned}
S(X^a)-S(X)
&=
\log\log(X^a)-\log\log X+o(1)\\
&=
\log a+o(1).
\end{aligned}
\]

Therefore ordinary Mertens is sufficient for the long window. For the manuscript's exact upper endpoint,

\[
S(2^{3k_0+1})-S(2^{k_0})
=
\log\!\left(3+\frac1{k_0}\right)+o(1)
\to\log3.
\]

If one instead stops at `2^{3k_0}`, the limit is also `log3`; the inclusive block statement is slightly larger and must nevertheless be described correctly.

### 7.2 A single dyadic block

For one block,

\[
S(2x)-S(x)
=
\log\frac{\log(2x)}{\log x}
+
E(2x)-E(x).
\tag{7.1}
\]

The main term is only

\[
\frac{\log2}{\log x}+O(1/\log^2x).
\]

The information `E=o(1)` leaves `E(2x)-E(x)=o(1)`, which can dominate `1/log x`. Thus the local asymptotic is not a formal consequence.

### 7.3 Explicit logical countermodel

The failure is not merely a gap in a standard proof. Let `h=log2` and define, for large `t`,

\[
F(t):=
\log\!\left(2h\left\lfloor\frac{t}{2h}\right\rfloor\right).
\]

Then `F` is nondecreasing and

\[
F(t)=\log t+O(1/t)=\log t+o(1).
\]

Set `S_*(x)=F(log x)+B`. Then

\[
S_*(x)=\log\log x+B+o(1),
\]

but for infinitely many `x=e^{2nh}` the interval from `log x` to `log(2x)=log x+h` lies inside one plateau, so

\[
S_*(2x)-S_*(x)=0.
\]

Thus even monotonicity plus the ordinary global asymptotic does not force a positive dyadic increment of order `1/log x`.

### 7.4 Sufficient error terms

From (7.1), the exact local requirement for the full asymptotic is

\[
E(2x)-E(x)=o(1/\log x).
\tag{E_loc}
\]

Sufficient stronger conditions include:

- `E(x)=o(1/log x)`;
- `E(x)=O(1/log^2 x)`;
- an explicit two-point bound whose constants leave the coefficient required by `L_c`.

A bare `E(x)=O(1/log x)` is not sufficient: after subtraction it contributes an uncontrolled term of the same order as the main term. It may imply a useful lower bound only if the implied constant is explicitly small enough.

## 8. Constant audit

### 8.1 Cardinality coefficient

\[
\frac{2^k}{2\log(2^k)}
=
\frac{1}{2\log2}\frac{2^k}{k},
\qquad
\frac1{2\log2}=0.7213475204\ldots.
\]

The local law has coefficient `1`, leaving a genuine asymptotic margin.

### 8.2 Reciprocal-mass coefficient

The required uniform lower coefficient for the inclusive `k_0` to `3k_0` window is

\[
c_*:=\frac{21}{20\log3}=0.9557511879\ldots.
\]

The PNT-derived coefficient is `1`, leaving a margin of about `0.04425`.

### 8.3 Pair-mass check

If `S_1>=21/20` and every prime is at least `2^{k_0}`, then

\[
S_2:=\sum_p\frac1{p^2}
\le\sum_{n\ge2^{k_0}}\frac1{n^2}
\le\frac1{2^{k_0}-1}.
\]

For `k_0=4`,

\[
\frac12\left((21/20)^2-1/15\right)>\frac12.
\]

For `k_0=3` the same crude bound is insufficient. Thus `4` is enough for this subestimate; `5` is a conservative inherited threshold, not the binding analytic scale.

## 9. Endpoint audit

1. `P_k` is half-open: `[2^k,2^{k+1})`.
2. For `k>=2`, both dyadic endpoints are composite, so open/closed prime-counting conventions agree exactly.
3. Inclusive block indices `Icc k_0 (3*k_0)` contain `2*k_0+1` blocks.
4. Their union is `[2^{k_0},2^{3k_0+1})`, not `[2^{k_0},2^{3k_0})`.
5. Ordinary Mertens at the exact endpoints has main difference
   \[
   \log\!\left(3+\frac1{k_0}\right),
   \]
   which tends to `log3` from above.

## 10. Candidate-backend comparison

| Candidate | Exact implication | Remainder issue | Constants/endpoints | Publication role |
|---|---|---|---|---|
| PNT `pi(x)~x/log x` | local law by Section 3; then both supplies | uniform `o(1)` on `[x,2x]` is enough | eventual only; endpoint exact for powers of two | preferred theorem source |
| PNT + ordinary Mertens | PNT gives capacity; Mertens gives long window | duplicates analytic inputs | eventual | valid alternative, not minimal |
| Ordinary Mertens `+o(1)` | long window only | error swamps single-block main term | exact inclusive endpoint easy | insufficient as single backend |
| Mertens `+O(1/log x)` | long window; no local conclusion without constants | same-order error | classical but too coarse | reject for local handoff |
| Local/quantified Mertens `E_loc` | local law, hence both supplies | exactly sufficient | eventual | acceptable but less standard |
| Rosser--Schoenfeld Cor. 3 + Thm. 5 | exact current `D`; exact current `M` | explicit `1/(2log^2x)` errors | `k>=5`; witness `20`; inclusive endpoint verified | formal/release backend |
| `L_c` | both supplies directly | no asymptotic upper information | coefficient threshold exact | weakest natural construction interface |

## 11. Proposed replacement for current conditions `D` and `M`

### Preferred paper formulation

**Local dyadic prime-resource law (`L`).**

\[
A_k=\frac1k+o(1/k).
\]

Then immediately record `D_ev` and `M_ev` as corollaries.

### Minimal construction-facing formulation

**Uniform local lower law (`L_c`).** There exist `c,K` with

\[
c\ge\frac{21}{20\log3},
\qquad
A_k\ge\frac c k\quad(k\ge K).
\]

This single statement replaces both `D` and `M` for the actual constant-first/scale-last construction.

### Compatibility warning

Neither `L` nor PNT alone proves the current literal statement `D` for every `k>=5` without explicit finite information. A manuscript refactor from fixed-threshold `D,M` to eventual consequences is therefore a named-interface change. It does not alter the construction's mathematics, but it requires `E306-DIR` authorization and must not be silently implemented by AB1.
