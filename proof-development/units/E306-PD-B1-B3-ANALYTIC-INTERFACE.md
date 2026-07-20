# E306-PD-B1–B3 — minimal analytic interface and two providers

**State:** `COMPLETE-DRAFT / SOURCE-CERTIFICATION-GATED`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Human-proof input:** `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
**Consumers:** the article-core checkpoint and the public Erdős 306 theorem

## 1. The construction-facing interface

For \(k\ge0\), let
\[
 \mathcal P_k=\{p\text{ prime}:2^k\le p<2^{k+1}\},
 \qquad
 A_k=\sum_{p\in\mathcal P_k}\frac1p.
\]

### Definition 1.1 — `AnalyticInputs`

The analytic input required by the present construction is the existence of
one integer \(K_{\rm AI}\) such that, for every \(k_0\ge K_{\rm AI}\):

1. **block density:** for every \(k_0\le k\le3k_0\),
   \[
   |\mathcal P_k|
   \ge
   \frac{2^k}{2\log(2^k)};
   \]
2. **inclusive reciprocal window:**
   \[
   \sum_{k=k_0}^{3k_0}A_k\ge\frac{21}{20}.
   \]

The upper block index is inclusive. Since the dyadic blocks are disjoint,
\[
 \bigcup_{k=k_0}^{3k_0}\mathcal P_k
 =
 \{p\text{ prime}:2^{k_0}\le p<2^{3k_0+1}\}.
\]

This is minimal at the present construction-module boundary: it records the
two and only two positive prime-supply facts used downstream. It is not a
claim that no logically weaker reformulation could support a redesigned
proof.

## 2. Backend-independent theorem

### Theorem 2.1

Assume `AnalyticInputs`. Then every positive rational with squarefree reduced
denominator is a finite sum of reciprocals of distinct squarefree semiprimes.

### Proof

Fix a squarefree integer \(b\ge3\) and a finite obstruction set \(T\). Run the
article-core parameter choices in dependency order:

1. fix the global-control constants;
2. fix the main cutoff \(C\), the sibling damping target, and the number \(G\)
   of gadget primes;
3. collect all finite thresholds arising from \(b,T,C,G\), the control-load
   estimate, global control, Taylor expansion, inverse-square budgets, and
   period geometry;
4. choose \(k_0\) above their maximum and above \(K_{\rm AI}\).

The density clause supplies every block in the global block system, whose
terminal index satisfies
\[
 2k_0\le K\le3k_0.
\]
It also supplies the common \(G\)-element gadget set in the block at
\(2k_0\). The reciprocal-window clause supplies the block-prime pair pool:
by the identity
\[
 \sum_{p<q}\frac1{pq}=\frac{S_1^2-S_2}{2},
\]
where \(S_1=\sum_{k=k_0}^{3k_0}A_k\), the available pair load is at least
\(1/2\) for sufficiently large \(k_0\).

No later part of the construction uses a further positive prime-distribution
estimate. A6.1 gives the elementary upper bounds on control load; A6.2–A6.3
give global control; A6.4 constructs the mass batch and weights; A7–A10 give
Fourier positivity. Therefore, for every finite \(T\), there is an avoiding
representation of \(1/b\).

The arithmetic-closure unit handles \(b=1,2\), iterates the unit-numerator
result for arbitrary positive numerator, and converts the finite set to the
public strictly increasing tuple. This proves the theorem.

### Exact released sockets

The immutable release does not presently package Definition 1.1 as a single
parameter structure. The factorization is nevertheless exact: the only
construction-facing positive analytic declarations are

- `GlobalControl.dyadic_prime_density`;
- `GlobalControl.dyadic_mertens_cumulative`, consumed through
  `CircleMethod.blockPrimes_product_load_ge`.

Their downstream consumers are the block-system, gadget-supply, and mass-pool
sockets ending in `exists_arcConstruction_final`. Thus Theorem 2.1 is a human
interface theorem extracted from the released dependency graph, not a claim
of a new Lean declaration at the authority checkpoint.

## 3. Rosser–Schoenfeld provider

The released formal provider uses exactly two nonstandard assumptions.

### RS1

For \(x\ge20.5\),
\[
 \frac{3x}{5\log x}<\pi(2x)-\pi(x).
\]
This is represented by
`RosserSchoenfeld.rosser_schoenfeld_cor3`.

At \(x=2^k\), \(k\ge5\), the endpoints are integers and are composite. Hence
\[
 \pi(2^{k+1})-\pi(2^k)=|\mathcal P_k|.
\]
Moreover
\[
 \frac{2^k}{2\log(2^k)}
 \le
 \frac{3\,2^k}{5\log(2^k)}.
\]
Therefore
\[
 |\mathcal P_k|
 \ge
 \frac{2^k}{2\log(2^k)}
 \qquad(k\ge5).
\]
This is `GlobalControl.dyadic_prime_density`.

### RS2

There is a constant \(B\) such that
\[
 \log\log x+B-rac1{2\log^2x}
 <\sum_{p\le x}\frac1p

after the lower endpoint, and
\[
 \sum_{p\le x}\frac1p
 <\log\log x+B+rac1{2\log^2x}

after the upper endpoint. This is represented by
`RosserSchoenfeld.rosser_schoenfeld_thm5`.

Apply the lower bound at \(2^{3k_0+1}\) and the upper bound at \(2^{k_0}\).
The constant \(B\) cancels. Because the powers of two are composite, the
prefix difference is exactly the inclusive dyadic-window sum. The main term
is
\[
 \log\!\frac{3k_0+1}{k_0}\ge\log3.
\]
The release proves the elementary numerical inequality
\[
 \log3>1.06
\]
and, for \(k_0\ge20\), bounds each error term by \(0.003\). Thus
\[
 \sum_{k=k_0}^{3k_0}A_k
 >1.06-0.006=1.054>\frac{21}{20}.
\]
This is `GlobalControl.dyadic_mertens_cumulative`, with explicit threshold
\(20\).

Taking
\[
 K_{\rm AI}=20
\]
therefore supplies both clauses of Definition 1.1.

### Trust status

The derivation from the two named axioms to `AnalyticInputs` is Lean-closed.
Human-visible comparison of the axiom text with the publisher scan on pp.
69–70 remains `BLOCKED-SOURCE`. Accordingly:

- it is correct to say that the release is machine checked relative to the
  two exact named assumptions;
- it is not yet certified here that an independent human has compared every
  symbol of those assumptions with the scan.

The source gate does not transfer to the PNT provider.

## 4. PNT provider: local reciprocal-prime law

Assume the prime number theorem
\[
 \pi(x)\sim\frac{x}{\log x}.
\]

### Proposition 4.1

As \(x\to\infty\),
\[
 \sum_{x\le p<2x}\frac1p
 =
 \frac{\log2}{\log x}
 +o\!\left(\frac1{\log x}\right).
\]
Consequently
\[
 A_k=\frac1k+o\!\left(\frac1k\right).
\]

### Proof

First use the interval \((x,2x]\). Abel summation for the prime-counting step
function and \(f(t)=1/t\) gives
\[
 \sum_{x<p\le2x}\frac1p
 =
 \frac{\pi(2x)}{2x}-\frac{\pi(x)}x
 +\int_x^{2x}\frac{\pi(t)}{t^2}\,dt.
\]

Define the tail-uniform PNT error
\[
 \varepsilon(x)=
 \sup_{t\ge x}
 \left|\frac{\pi(t)\log t}{t}-1\right|.
\]
PNT implies \(\varepsilon(x)\to0\). Uniformly for \(t\in[x,2x]\),
\[
 \pi(t)=\frac{t}{\log t}(1+O(\varepsilon(x))).
\]
Therefore
\[
 \int_x^{2x}\frac{\pi(t)}{t^2}\,dt
 =
 \int_x^{2x}\frac{dt}{t\log t}
 +O\!\left(
 \varepsilon(x)
 \int_x^{2x}\frac{dt}{t\log t}
 \right).
\]
The main integral is
\[
 \log\frac{\log(2x)}{\log x}
 =
 \log\!\left(1+\frac{\log2}{\log x}\right)
 =
 \frac{\log2}{\log x}
 +O\!\left(\frac1{\log^2x}\right).
\]
The error is \(o(1/\log x)\), because \(\varepsilon(x)\to0\) and the integral
is \(O(1/\log x)\).

The boundary term equals
\[
 \frac1{\log(2x)}-\frac1{\log x}
 +O\!\left(\frac{\varepsilon(x)}{\log x}\right)
 =o\!\left(\frac1{\log x}\right).
\]
This proves the formula on \((x,2x]\).

Changing to \([x,2x)\) changes at most the two endpoint terms, hence by
\(O(1/x)=o(1/\log x)\). For \(x=2^k\), \(k\ge2\), both endpoints are
composite, so the two conventions agree exactly. Since
\(\log(2^k)=k\log2\),
\[
 A_k=\frac1k+o(1/k).
\]

The use of the tail supremum is the uniformity step: a pointwise substitution
of PNT inside the integral without such a uniform error would be incomplete.

## 5. PNT provider: block density

For every \(p\in\mathcal P_k\), \(1/p\le2^{-k}\). Hence
\[
 A_k\le\frac{|\mathcal P_k|}{2^k},
 \qquad
 |\mathcal P_k|\ge2^kA_k.
\]
Choose any constant \(c_D\) with
\[
 \frac1{2\log2}<c_D<1.
\]
The local law gives a threshold \(K_D\) such that
\[
 A_k\ge\frac{c_D}{k}
 \qquad(k\ge K_D).
\]
Thus
\[
 |\mathcal P_k|
 \ge\frac{c_D2^k}{k}
 \ge\frac{2^k}{2k\log2}
 =\frac{2^k}{2\log(2^k)}.
\]

This avoids attaching the proof to an arbitrary decimal such as \(0.9\); the
only required fact is \(1/(2\log2)<1\).

## 6. PNT provider: inclusive reciprocal window

The elementary inequality \(\log3>21/20\) permits a choice of constant
\(c_M\) such that
\[
 \frac{21}{20\log3}<c_M<1.
\]
The local law gives a threshold \(K_M\) with
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
 >\log3.
\]
Therefore
\[
 \sum_{k=k_0}^{3k_0}A_k
 \ge
 c_M\sum_{k=k_0}^{3k_0}\frac1k
 >c_M\log3
 >\frac{21}{20}.
\]

This proof preserves the inclusive upper endpoint and does not rely on
subtracting two uncontrolled \(o(1)\) errors from ordinary Mertens' theorem.

## 7. One common threshold and parameter order

Set
\[
 K_{\rm AI}=\max\{2,K_D,K_M\}.
\]
Then for every \(k_0\ge K_{\rm AI}\):

- all \(k\in[k_0,3k_0]\) satisfy the density estimate;
- the inclusive reciprocal-window estimate holds at \(k_0\);
- powers-of-two endpoint conventions are exact.

This threshold depends only on the analytic provider. In the construction it
is included in the final maximum after \(b,T\) and all fixed constants have
been chosen. Thus the order is
\[
 \text{analytic provider}
 \longrightarrow K_{\rm AI},
 \qquad
 b,T,\text{construction constants}
 \longrightarrow k_0\ge K_{\rm AI},
\]
not a circular definition of an analytic constant from the chosen block
system.

## 8. Backend separation

| Layer | RS provider | PNT provider |
|---|---|---|
| external theorem | RS Cor. 3 and Thm. 5 | PNT |
| local dyadic law | direct explicit cardinality bound | `A_k=1/k+o(1/k)` |
| density threshold | explicit `k>=5` | eventual `K_D` |
| mass threshold | explicit `k0>=20` in release | eventual `K_M` |
| formal release status | Lean-closed relative to RS1/RS2 | not a released formal provider |
| source gate | publisher-scan comparison open | cited PNT source review belongs to manuscript assurance |

No premise or status is transferred between columns.

## 9. Correspondence and residual classification

| Human node | Released locator / status | Classification |
|---|---|---|
| dyadic block definition | `GlobalControl.dyadicBlock` | exact finite definition |
| RS density derivation | `GlobalControl.dyadic_prime_density` | Lean-closed |
| inclusive block identity | `biUnion_dyadicBlock_eq_sdiff` | endpoint bookkeeping |
| RS mass derivation | `GlobalControl.dyadic_mertens_cumulative` | Lean-closed |
| pool consumer | `CircleMethod.blockPrimes_product_load_ge` | exact construction socket |
| abstract `AnalyticInputs` theorem | no single released declaration | human dependency factorization |
| PNT Abel bridge | paper mathematics | complete human proof above |
| PNT common threshold | paper/interface mathematics | complete human proof above |

The only blocked item is primary-source certification of the released axiom
transcription. There is no mathematical obstruction and no need to return the
interface to `E306-RL`.

`E306-PD-B1–B3` is `COMPLETE-DRAFT / SOURCE-CERTIFICATION-GATED`.
