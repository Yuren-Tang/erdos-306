# E306-PD-B1–B3 — minimal analytic interface and two providers

**State:** `COMPLETE-DRAFT / SOURCE-CERTIFICATION-GATED`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Human-proof input:** `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
**Consumers:** the article-core checkpoint and the public Erdős 306 theorem

## 1. Construction-facing interface

For \(k\ge 0\), let
\[
\mathcal P_k=\{p\text{ prime}:2^k\le p<2^{k+1}\},
\qquad
A_k=\sum_{p\in\mathcal P_k}\frac1p.
\]

### Definition 1.1 — `AnalyticInputs`

There exists one integer \(K_{\rm AI}\) such that, for every
\(k_0\ge K_{\rm AI}\):

1. for every \(k_0\le k\le 3k_0\),
   \[
   |\mathcal P_k|\ge \frac{2^k}{2\log(2^k)};
   \]
2. the inclusive reciprocal window satisfies
   \[
   \sum_{k=k_0}^{3k_0}A_k\ge\frac{21}{20}.
   \]

The upper block index is inclusive. The dyadic blocks are disjoint and
\[
\bigcup_{k=k_0}^{3k_0}\mathcal P_k
=
\{p\text{ prime}:2^{k_0}\le p<2^{3k_0+1}\}.
\]

This interface is minimal at the present construction-module boundary: it
records the two positive prime-supply facts actually consumed downstream. It
does not claim that no redesigned proof could use a logically weaker premise.

## 2. Backend-independent implication

### Theorem 2.1

Assume `AnalyticInputs`. Every positive rational with squarefree reduced
denominator is a finite sum of reciprocals of distinct squarefree semiprimes.

### Proof

Fix a squarefree integer \(b\ge 3\) and a finite obstruction set \(T\). Make
the article-core choices in dependency order:

1. fix the global-control constants;
2. fix the main cutoff \(C\), sibling-damping target, and number \(G\) of
   gadget primes;
3. collect every finite threshold coming from \(b,T,C,G\), control load,
   global control, Taylor expansion, inverse-square estimates, period geometry,
   and finite cardinality bounds;
4. choose \(k_0\) above their maximum and above \(K_{\rm AI}\).

The density clause supplies every block of the global block system, whose
terminal index obeys
\[
2k_0\le K\le 3k_0,
\]
and also supplies the common \(G\)-element gadget set in block \(2k_0\).

The reciprocal-window clause supplies the pair pool. If
\[
S_1=\sum_{k=k_0}^{3k_0}A_k,
\qquad
S_2=\sum_{p\in\bigcup_{k=k_0}^{3k_0}\mathcal P_k}\frac1{p^2},
\]
then
\[
\sum_{p<q}\frac1{pq}=\frac{S_1^2-S_2}{2}.
\]
For sufficiently large \(k_0\), \(S_1\ge 21/20\) and \(S_2=o(1)\), so the
pair-pool load is at least \(1/2\).

No later construction step invokes another positive prime-distribution
estimate. A6.1 gives elementary upper bounds; A6.2–A6.3 give global control;
A6.4 constructs the mass batch and weights; A7–A10 prove Fourier positivity.
Thus every finite \(T\) admits an avoiding representation of \(1/b\).

The arithmetic-closure unit handles \(b=1,2\), arbitrary positive numerator,
and the strictly increasing public tuple. This proves the theorem.

### Released sockets

The immutable release does not package Definition 1.1 as one Lean structure.
The factorization is nevertheless exact. The only construction-facing
positive analytic declarations are

- `GlobalControl.dyadic_prime_density`;
- `GlobalControl.dyadic_mertens_cumulative`, consumed through
  `CircleMethod.blockPrimes_product_load_ge`.

Their consumers are the block-system, gadget-supply, and mass-pool sockets
ending in `exists_arcConstruction_final`. Theorem 2.1 is therefore a human
dependency-interface theorem extracted from the released graph, not a claim
that a declaration named `AnalyticInputs` already exists at the authority
checkpoint.

## 3. Rosser–Schoenfeld provider

The released provider uses exactly two nonstandard assumptions.

### 3.1 Density provider

For \(x\ge 20.5\),
\[
\frac{3x}{5\log x}<\pi(2x)-\pi(x).
\]
This is `RosserSchoenfeld.rosser_schoenfeld_cor3`.

At \(x=2^k\), \(k\ge 5\), the two endpoints are composite and
\[
\pi(2^{k+1})-\pi(2^k)=|\mathcal P_k|.
\]
Since
\[
\frac{2^k}{2\log(2^k)}
\le
\frac{3\,2^k}{5\log(2^k)},
\]
one obtains
\[
|\mathcal P_k|\ge\frac{2^k}{2\log(2^k)}
\qquad(k\ge 5).
\]
This is `GlobalControl.dyadic_prime_density`.

### 3.2 Reciprocal-window provider

`RosserSchoenfeld.rosser_schoenfeld_thm5` states that there is a constant
\(B\) such that the relevant ranges satisfy
\[
\log\log x+B-\frac1{2\log^2x}
<\sum_{p\le x}\frac1p
\]
and
\[
\sum_{p\le x}\frac1p
<\log\log x+B+\frac1{2\log^2x}.
\]

Apply the lower bound at \(2^{3k_0+1}\) and the upper bound at \(2^{k_0}\).
The constant \(B\) cancels. Because powers of two are composite, the prefix
difference is exactly the inclusive dyadic-window sum. The main term is
\[
\log\!\left(\frac{3k_0+1}{k_0}\right)\ge\log 3.
\]
The released derivation proves
\[
\log 3>1.06
\]
and, for \(k_0\ge 20\), bounds each error term by \(0.003\). Therefore
\[
\sum_{k=k_0}^{3k_0}A_k
>1.06-0.006=1.054>\frac{21}{20}.
\]
This is `GlobalControl.dyadic_mertens_cumulative`, with explicit threshold
\(20\).

Hence the RS provider satisfies Definition 1.1 with
\[
K_{\rm AI}=20.
\]

### 3.3 Trust status

The implication from the two named assumptions to `AnalyticInputs` is
Lean-closed. Human-visible symbol-by-symbol comparison with the publisher scan
on pp. 69–70 remains `BLOCKED-SOURCE`. Thus it is correct to say that the
release is machine checked relative to the two named assumptions; it is not
yet certified here that an independent human has compared every symbol of
the transcriptions with the scan.

This source gate does not transfer to the PNT provider.

## 4. PNT provider: local reciprocal-prime law

Assume
\[
\pi(x)\sim\frac{x}{\log x}.
\]

### Proposition 4.1

As \(x\to\infty\),
\[
\sum_{x\le p<2x}\frac1p
=
\frac{\log 2}{\log x}
+o\!\left(\frac1{\log x}\right).
\]
Consequently
\[
A_k=\frac1k+o\!\left(\frac1k\right).
\]

### Proof

First use \((x,2x]\). Abel summation for the prime-counting step function and
\(f(t)=1/t\) gives
\[
\sum_{x<p\le 2x}\frac1p
=
\frac{\pi(2x)}{2x}-\frac{\pi(x)}x
+
\int_x^{2x}\frac{\pi(t)}{t^2}\,dt.
\]

Define the tail-uniform error
\[
\varepsilon(x)=
\sup_{t\ge x}
\left|\frac{\pi(t)\log t}{t}-1\right|.
\]
PNT implies \(\varepsilon(x)\to 0\). Uniformly for \(t\in[x,2x]\),
\[
\pi(t)=\frac{t}{\log t}\bigl(1+O(\varepsilon(x))\bigr).
\]
Hence
\[
\int_x^{2x}\frac{\pi(t)}{t^2}\,dt
=
\int_x^{2x}\frac{dt}{t\log t}
+
O\!\left(
\varepsilon(x)\int_x^{2x}\frac{dt}{t\log t}
\right).
\]
The main integral is
\[
\log\frac{\log(2x)}{\log x}
=
\log\!\left(1+\frac{\log 2}{\log x}\right)
=
\frac{\log 2}{\log x}
+O\!\left(\frac1{\log^2x}\right).
\]
The error is \(o(1/\log x)\).

The boundary term is
\[
\frac1{\log(2x)}-\frac1{\log x}
+O\!\left(\frac{\varepsilon(x)}{\log x}\right)
=
o\!\left(\frac1{\log x}\right).
\]
Thus the formula holds on \((x,2x]\). Replacing this by \([x,2x)\) changes
at most the two endpoint terms, hence by
\(O(1/x)=o(1/\log x)\). At \(x=2^k\), \(k\ge 2\), both endpoints are
composite, so the conventions agree exactly. Since
\(\log(2^k)=k\log 2\),
\[
A_k=\frac1k+o(1/k).
\]

The tail supremum is the required uniformity step. Pointwise substitution of
PNT under the integral without a uniform error would be incomplete.

## 5. PNT provider: dyadic density

For \(p\in\mathcal P_k\), \(1/p\le 2^{-k}\), so
\[
A_k\le\frac{|\mathcal P_k|}{2^k},
\qquad
|\mathcal P_k|\ge 2^kA_k.
\]
Choose \(c_D\) with
\[
\frac1{2\log 2}<c_D<1.
\]
The local law gives \(K_D\) such that
\[
A_k\ge\frac{c_D}{k}
\qquad(k\ge K_D).
\]
Therefore
\[
|\mathcal P_k|
\ge\frac{c_D2^k}{k}
\ge\frac{2^k}{2k\log 2}
=
\frac{2^k}{2\log(2^k)}.
\]

## 6. PNT provider: inclusive reciprocal window

Since \(\log 3>21/20\), choose \(c_M\) with
\[
\frac{21}{20\log 3}<c_M<1.
\]
The local law gives \(K_M\) such that
\[
A_k\ge\frac{c_M}{k}
\qquad(k\ge K_M).
\]
For \(k_0\ge K_M\), monotonicity of \(1/t\) gives
\[
\sum_{k=k_0}^{3k_0}\frac1k
\ge
\int_{k_0}^{3k_0+1}\frac{dt}{t}
=
\log\!\left(3+\frac1{k_0}\right)
>
\log 3.
\]
Hence
\[
\sum_{k=k_0}^{3k_0}A_k
\ge
c_M\sum_{k=k_0}^{3k_0}\frac1k
>
c_M\log 3
>
\frac{21}{20}.
\]

This preserves the inclusive upper endpoint and does not subtract two
uncontrolled \(o(1)\) errors from ordinary Mertens' theorem.

## 7. One common threshold and parameter order

Set
\[
K_{\rm AI}=\max\{2,K_D,K_M\}.
\]
Then every \(k_0\ge K_{\rm AI}\) satisfies both clauses of Definition 1.1,
and all power-of-two endpoint conventions are exact.

The analytic threshold depends only on the provider. In the construction it
is included in the final maximum after \(b,T\) and all fixed constants have
been chosen. Thus
\[
\text{provider}\longrightarrow K_{\rm AI},
\qquad
b,T,\text{fixed construction constants}
\longrightarrow k_0\ge K_{\rm AI},
\]
with no circular dependence.

## 8. Backend separation

| Layer | RS provider | PNT provider |
|---|---|---|
| external theorem | RS Cor. 3 and Thm. 5 | PNT |
| local law | direct explicit density | \(A_k=1/k+o(1/k)\) |
| density threshold | explicit \(k\ge 5\) | eventual \(K_D\) |
| mass threshold | explicit \(k_0\ge 20\) | eventual \(K_M\) |
| released status | Lean-closed relative to RS1/RS2 | not a released formal provider |
| source gate | publisher-scan comparison open | PNT citation review is manuscript assurance |

No premise or status transfers between columns.

## 9. Correspondence and residual classification

| Human node | Released locator / status | Classification |
|---|---|---|
| dyadic block | `GlobalControl.dyadicBlock` | exact finite definition |
| RS density | `GlobalControl.dyadic_prime_density` | Lean-closed |
| inclusive block identity | `biUnion_dyadicBlock_eq_sdiff` | endpoint bookkeeping |
| RS mass | `GlobalControl.dyadic_mertens_cumulative` | Lean-closed |
| pool consumer | `CircleMethod.blockPrimes_product_load_ge` | exact construction socket |
| abstract interface | no single released declaration | human dependency factorization |
| PNT Abel bridge | paper mathematics | complete human proof |
| common PNT threshold | paper/interface mathematics | complete human proof |

The only blocked item is primary-source certification of the released axiom
transcriptions. There is no mathematical obstruction and no need to return
the interface to `E306-RL`.

`E306-PD-B1–B3` is `COMPLETE-DRAFT / SOURCE-CERTIFICATION-GATED`.
