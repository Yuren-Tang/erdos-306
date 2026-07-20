# E306-PD-A6.4 — reciprocal mass batch, uniform weights, and variance comparison

**Ledger correspondence:** manuscript P24–P26  
**State:** `COMPLETE-DRAFT`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Analytic interface consumed:** one eventual inclusive-window reciprocal-prime mass lower bound  
**Predecessors:** A6.1–A6.3

## 1. Purpose

For fixed squarefree \(b\ge3\) and a finite obstruction set \(T\), the finite
Fourier construction needs a set \(E\) of distinct squarefree semiprimes which

- avoids \(T\);
- divides the period \(L\);
- contains the already chosen control and denominator-sensitive gadget edges;
- has total reciprocal load in
  \[
  \frac{3}{2b}\le \Lambda:=\sum_{e\in E}\frac1e<\frac3b;
  \]
- supports a uniform Bernoulli weight
  \[
  \theta=\frac{1/b}{\Lambda}\in(1/3,2/3];
  \]
- has variance comparable with the control scale.

The mass batch is selected only after the control and gadget components have
been fixed.

## 2. The block-prime pair pool

Let
\[
 \mathcal P(k_0)=
 \bigcup_{k=k_0}^{3k_0}
 \{p\text{ prime}:2^k\le p<2^{k+1}\}.
\]
The upper block is included, so this is exactly the prime interval
\[
 [2^{k_0},2^{3k_0+1}).
\]
Put
\[
 S_1=\sum_{p\in\mathcal P(k_0)}\frac1p,\qquad
 S_2=\sum_{p\in\mathcal P(k_0)}\frac1{p^2}.
\]

For \(x_p=1/p\), expansion of the square and the symmetry of the off-diagonal
pairs give
\[
 S_1^2
 =
 S_2+2\sum_{\substack{p,q\in\mathcal P(k_0)\\p<q}}\frac1{pq}.
\]
Therefore
\[
 \sum_{p<q}\frac1{pq}=\frac{S_1^2-S_2}{2}.
\]

The eventual reciprocal-window input gives
\[
 S_1\ge\frac{21}{20}.
\]
Also
\[
 S_2\le\sum_{n\ge2^{k_0}}\frac1{n^2}
 \le\frac1{2^{k_0}-1}.
\]
For \(k_0\ge5\), these inequalities imply
\[
 \sum_{p<q}\frac1{pq}\ge\frac12.
\]

The identity is `sq_sum_eq_sum_sq_add_two_sum_lt`; the tail estimate is
`blockPrimes_sub_sq_tail`; the conditional pool bound is
`blockPrimes_product_load_ge_of`. The released Rosser–Schoenfeld backend and
the paper PNT backend enter only by proving the premise \(S_1\ge21/20\).

Distinct ordered prime pairs with \(p<q\) have distinct products by unique
factorization. Every pool element is therefore a distinct squarefree
semiprime.

## 3. Removing forbidden products

Let
\[
 E_{\rm base}=E_{\rm ctrl}\,\dot\cup\,E_{\rm gad},
 \qquad
 \Lambda_{\rm base}=\sum_{e\in E_{\rm base}}\frac1e,
\]
and assume
\[
 \Lambda_{\rm base}<\frac{3}{2b}.
\]
The residual target is
\[
 t=\frac{3}{2b}-\Lambda_{\rm base}>0.
\]

The candidate pair pool must exclude:

1. the external obstruction set \(T\);
2. products already used as control edges;
3. products already used as gadget edges.

The bottom pair scale is \(2^{2k_0}\). Choosing \(k_0\) after the finite set
\(T\) makes every \(t\in T\) smaller than this scale; hence \(T\) has empty
intersection with the pair pool.

The reciprocal load lost to control and gadget intersections is at most the
full reciprocal load of the corresponding fixed component. Since those
components are disjoint,
\[
 \Lambda_{\rm base}
 =
 \operatorname{load}(E_{\rm ctrl})
 +
 \operatorname{load}(E_{\rm gad}).
\]
Consequently
\[
 t+
 \operatorname{load}(\text{forbidden pool terms})
 \le
 \frac{3}{2b}.
\]
For \(b\ge3\),
\[
 \frac{3}{2b}\le\frac12.
\]
Since the full pair pool has load at least \(1/2\), the allowed residual pool
has load at least \(t\).

This exact cancellation is
`basePieces_forbiddenBudget_final_ineq`. It is important: the argument does
not require an unrecorded positive margin beyond the pool lower bound
\(1/2\); the load already spent on fixed components absorbs the corresponding
forbidden intersections.

## 4. Greedy selection

### Lemma 4.1

Let \(x_i>0\) be a finite family with total at least \(t\), and suppose every
\(x_i<g\). Then some subfamily has sum in \([t,t+g)\).

### Proof

Choose a subfamily \(Q\) of minimal cardinality among those whose sum is at
least \(t\). For any \(x_j\in Q\), minimality gives
\[
 \sum_{i\in Q}x_i-x_j<t.
\]
Hence
\[
 \sum_{i\in Q}x_i<t+x_j<t+g.
\]
The lower bound follows from the choice of \(Q\).

Apply this with \(x_e=1/e\),
\[
 g=\frac{3}{2b},
 \qquad
 t=\frac{3}{2b}-\Lambda_{\rm base}.
\]
Every candidate semiprime \(e\) lies above the bottom pair scale, and the
scale condition
\[
 2b<3\cdot2^{2k_0}
\]
ensures \(1/e<3/(2b)\). We obtain a mass batch \(Q\) with
\[
 t\le\sum_{e\in Q}\frac1e<t+\frac{3}{2b}.
\]
Thus, for
\[
 E=E_{\rm base}\,\dot\cup\,Q,
\]
\[
 \frac{3}{2b}\le\Lambda<\frac3b.
\]

The generic lemma is `exists_subset_recip_window_strict_upper`; the full
construction socket is the `R2MassBatchSupply` chain.

## 5. Uniform weights and exact expected mass

Set
\[
 \theta=\frac{1/b}{\Lambda}.
\]
The load window gives
\[
 \Lambda\ge\frac{3}{2b}
 \quad\Longrightarrow\quad
 \theta\le\frac23,
\]
and
\[
 \Lambda<\frac3b
 \quad\Longrightarrow\quad
 \theta>\frac13.
\]
Therefore
\[
 \frac13<\theta\le\frac23.
\]
Moreover,
\[
 \sum_{e\in E}\frac{\theta}{e}
 =\theta\Lambda=\frac1b.
\]

This exact expected-mass identity is what cancels the linear term on the
main Fourier arcs. The released constructor is
`R2ConcreteData.weights_of_recipLoad_window`, packaged as
`R2MassBatchSupply.weights`.

The upper load bound also gives
\[
 \sum_{e\in E}\frac{\theta}{e}
 \le \sum_{e\in E}\frac1e<1
\]
because \(b\ge3\). This is the no-wrap input for converting the selected
congruence into an exact reciprocal equality.

## 6. Variance comparison

Define
\[
 \sigma_E^2
 =
 \sum_{e\in E}\frac{\theta(1-\theta)}{e^2}.
\]
For \(\theta\in[1/3,2/3]\),
\[
 \frac29\le\theta(1-\theta)\le\frac14.
\]

### Lower bound

The control edges are contained in \(E\). Hence
\[
 \sigma_E^2
 \ge
 \frac29\sum_{e\in E_{\rm ctrl}}\frac1{e^2}
 =
 \frac29\,\sigma_{\rm ctrl}^2,
\]
and
\[
 \sigma_E\ge\sqrt{\frac29}\,\sigma_{\rm ctrl}.
\]
This is `sigmaE2_ge_ctrl`.

### Upper bound

The reciprocal-square contribution outside the control set consists of the
mass batch and the gadget edges.

- The mass batch lies in a pair pool and its square load is bounded by the
  square of the prime reciprocal-square load.
- Gadget primes are chosen in the high block \(2k_0\), so every gadget
  denominator has an additional \(2^{2k_0}\) factor.
- A6.1 gives the strong lower bound
  \[
  \sigma_{\rm ctrl}\ge\frac1{100k_0\,2^{k_0}},
  \]
  which absorbs both decaying error terms once the cardinalities of the
  fixed components have been included in the final scale threshold.

The released numerical assembly proves
\[
 \sum_{e\in E}\frac1{e^2}
 \le1000001\,\sigma_{\rm ctrl}^2.
\]
Therefore
\[
 \sigma_E^2\le\frac14\cdot1000001\,\sigma_{\rm ctrl}^2
 \le250001\,\sigma_{\rm ctrl}^2,
\]
and
\[
 \sigma_E\le501\,\sigma_{\rm ctrl}.
\]

The exact upper estimate is assembled in `R2TopAssembly` through
`r2_extra_inv_sq_le`; the last square-root comparison is finite/kernel
arithmetic.

## 7. Structural properties of the denominator family

The construction verifies:

- every element of \(E\) is a product of two distinct primes;
- the product map is injective on the ordered pair pool;
- control, mass, and gadget components are pairwise disjoint;
- every denominator avoids \(T\);
- every denominator divides
  \[
  L=b\prod_{p\in\operatorname{blockSupport}(BS)}p.
  \]

Control and mass products use block primes. Gadget products have the form
\(rs\), where \(r\mid b\) is prime and the high block prime \(s\) lies outside
the prime support of \(b\); hence \(r<s\) and the product is squarefree.
These facts are the `R2ConcreteData.semiprime`, `dvd_period`, disjointness, and
avoidance sockets used in `R2TopAssembly`.

## 8. Parameter order

For fixed \(b,T\):

1. choose the global-control constants and the number \(G\) of gadget primes;
2. choose the final bottom scale above:
   - the abstract prime-supply thresholds;
   - the control-load threshold;
   - the finite obstruction scale;
   - the gadget cardinality and size thresholds;
3. construct the block system and gadget set;
4. compute the fixed base load;
5. select the residual mass batch;
6. define the uniform weight.

The mass batch never changes a constant that was used to choose \(k_0\).
There is no circular parameter dependence.

## 9. Formal correspondence and trust classification

| Human step | Released declaration/module | Classification |
|---|---|---|
| inclusive block-prime set | `blockPrimes` | exact endpoint convention |
| pair-load identity | `sq_sum_eq_sum_sq_add_two_sum_lt` | human proof supplied |
| inverse-square tail | `blockPrimes_sub_sq_tail` | elementary |
| pair pool \(\ge1/2\) | `blockPrimes_product_load_ge_of`, `blockPrimes_product_load_ge` | analytic premise isolated |
| forbidden cancellation | `basePieces_forbiddenBudget_final_ineq` | human proof supplied |
| greedy reciprocal window | `exists_subset_recip_window_strict_upper` | human proof supplied |
| mass-batch certificate | `R2MassBatchSupply` | finite construction |
| uniform weights | `R2MassBatchSupply.weights` | definition from load window |
| variance lower bound | `sigmaE2_ge_ctrl` | human proof supplied |
| inverse-square upper bound | `r2_extra_inv_sq_le` and final `hsumE` assembly | finite/kernel-residual |
| complete data threading | `r2_getQ`, `exists_r2_data_of_numerics_set` | exact construction socket |

No hidden analytic theorem appears in this unit. Only the abstract reciprocal
window \(S_1\ge21/20\) is imported; the RS and PNT backends remain separate.

`E306-PD-A6.4` is `COMPLETE-DRAFT`.
