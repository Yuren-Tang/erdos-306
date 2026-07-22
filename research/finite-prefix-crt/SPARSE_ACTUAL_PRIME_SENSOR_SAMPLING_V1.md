# Sparse actual-prime sensors and the sharpened finite-prefix rate

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / MATERIAL THEOREM STRENGTHENING / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

This note improves the dense top-block sensor reservoir used in
`HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`.

The complete top prime block has cyclic distance of order `Z/log Z`, but the
shifted fibre-compression theorem only needs distance of order `log Z`.  A
single subset of only `O(log Z)` actual primes from the top block can be chosen
so that it simultaneously has linear cyclic energy for every low prime and
every nonzero multiplier.  This removes the earlier prime-residue realization
problem without paying the reciprocal load of the complete block.

The resulting sensor load is exponentially smaller than the high-control load.
Consequently the candidate gap-free-floor rate improves from

```text
O(log log p_N / log p_N)
```

to

```text
O(1 / log p_N).
```

No released, proof-development, corpus, manuscript, formalization, review,
release, DOI, or publication status changes through this note.

## 1. Dyadic prefix and the full top-block population

Put

\[
 Z=2^{2k+1},\qquad X=2^k=\sqrt{Z/2}.
\]

Let

\[
 \mathcal R_X=\{r<X:r\text{ prime}\}
\]

and

\[
 \mathcal S_Z=\{s:Z/2<s<Z,\ s\text{ prime}\}.
\]

For a low prime `r` and `d != 0 (mod r)` define

\[
 a_{r,d}(s)=\left\|\frac{d s^{-1}}r\right\|^2,
 \qquad s\in\mathcal S_Z.
 \tag{1.1}
\]

Every value lies in `[0,1/4]`.

The top-block energy theorem from
`GLOBAL_FINITE_PREFIX_TRANSFER_V1.md` gives an absolute constant `c_0>0`
such that, for all sufficiently large `Z`,

\[
 \sum_{s\in\mathcal S_Z}a_{r,d}(s)
 \ge c_0 |\mathcal S_Z|
 \tag{1.2}
\]

uniformly for every `r<X` and every nonzero `d mod r`.

Equivalently, every one of the finitely many test functions `a_{r,d}` has
population mean at least `c_0` on the same actual prime population
`\mathcal S_Z`.

## 2. One common logarithmic sample

Choose uniformly without replacement an `M`-element subset

\[
 \mathcal T_Z\subset\mathcal S_Z.
\]

For a fixed pair `(r,d)`, Hoeffding's inequality for sampling without
replacement gives an absolute `c_1>0` such that

\[
 \Pr\left(
   \sum_{s\in\mathcal T_Z}a_{r,d}(s)<\frac{c_0}{2}M
 \right)
 \le e^{-c_1M}.
 \tag{2.1}
\]

The number of tests is at most

\[
 \sum_{r<X\atop r\text{ prime}}(r-1)
 <\sum_{n<X}n<X^2=Z/2.
 \tag{2.2}
\]

Therefore, if

\[
 M\ge C_0\log Z
 \tag{2.3}
\]

for a sufficiently large absolute `C_0`, the union bound is strictly less than
one.  Hence there exists one deterministic subset `\mathcal T_Z` for which

\[
 \boxed{
 \min_{d\ne0\bmod r}
 \sum_{s\in\mathcal T_Z}
 \left\|\frac{d s^{-1}}r\right\|^2
 \ge c_2M
 }
 \tag{2.4}
\]

simultaneously for every prime `r<X`, with an absolute `c_2>0`.

### Theorem 2.1 -- sparse actual-prime common sensor

For all sufficiently large `Z` there is a subset

\[
 \mathcal T_Z\subset\{s:Z/2<s<Z,\ s\text{ prime}\}
\]

with

\[
 |\mathcal T_Z|\le C_0\log Z
\]

such that every low prime `r<\sqrt{Z/2}` has cyclic distance

\[
 D_r(\mathcal T_Z)\ge c_2|\mathcal T_Z|\asymp\log Z.
 \tag{2.5}
\]

The same actual prime subset works for all low moduli.  No prescribed residue
classes, least-prime theorem, or separate realization step is used.

The probabilistic proof can also be derandomized by conditional expectation,
using the exponential potential over all pairs `(r,d)`.

## 3. Shift-uniform low-fibre compression

Use sensor edges

\[
 E_{\rm sens}^{\rm sparse}
 =\{rs:r\in\mathcal R_X,\ s\in\mathcal T_Z\}.
 \tag{3.1}
\]

For Bernoulli parameters in `[1/3,2/3]`, the shifted cyclic partition theorem
gives, uniformly in arbitrary external phases,

\[
 \sum_{x\bmod r}
 \prod_{s\in\mathcal T_Z}
 \left|1-\theta+\theta
 e\left(\alpha_s+\frac{x s^{-1}}r\right)\right|
 \le 1+r e^{-c_3M}.
 \tag{3.2}
\]

Since `M=C_0 log Z`, choose `C_0` so large that

\[
 \sum_{r<X\atop r\text{ prime}}r e^{-c_3M}=o(1).
 \tag{3.3}
\]

Consequently

\[
 \prod_{r<X\atop r\text{ prime}}
 \left(1+r e^{-c_3M}\right)=1+o(1).
 \tag{3.4}
\]

Thus the entire low CRT product fibre is eliminated at cost `1+o(1)`, exactly
as with the dense top block.

## 4. Reciprocal and square loads

Because every `s in \mathcal T_Z` lies in `(Z/2,Z)`,

\[
 \sum_{s\in\mathcal T_Z}\frac1s
 \le\frac{2M}{Z},
 \qquad
 \sum_{s\in\mathcal T_Z}\frac1{s^2}
 \le\frac{4M}{Z^2}.
\]

Hence

\[
 \boxed{
 \Lambda_{\rm sens}^{\rm sparse}
 \ll\frac{\log Z\,\log\log Z}{Z}
 }
 \tag{4.1}
\]

and

\[
 \boxed{
 W_{2,{\rm sens}}^{\rm sparse}
 \ll\frac{\log Z}{Z^2}.
 }
 \tag{4.2}
\]

Both are negligible compared with the accepted high-control scales

\[
 \Lambda_{\rm ctrl}\asymp O(1/\log Z),
 \qquad
 \sigma_{\rm ctrl}^2\asymp\frac1{Z(\log Z)^2}.
 \tag{4.3}
\]

This is the correct interpretation of the prefix-bounded load--distance lower
bound: the dense prime block is optimal for its very large distance
`D asymp Z/log Z`, but that distance is far larger than the `D asymp log Z`
needed for fibre compression.  At the application-relevant distance, the
logarithmic sample attains the corresponding lower-bound order

\[
 \Lambda\asymp\frac{H_1(\mathcal R_X)}Z D.
\]

## 5. Coherent-label stability

Let a coherent high assignment have label

\[
 |m|\le C_k/\sigma_{\rm ctrl},
 \qquad C_k=D_0\sqrt{\log k}.
\]

At the expected low residue `x_r=m mod r`, the sparse sensor energy is

\[
 E_r(m)
 \ll\frac{m^2}{r^2}
       \sum_{s\in\mathcal T_Z}\frac1{s^2}
 \ll\frac{m^2M}{r^2Z^2}.
 \tag{5.1}
\]

Since `D_r(\mathcal T_Z)\gg M`,

\[
 \frac{E_r(m)}{D_r(\mathcal T_Z)}
 \ll\frac{m^2}{r^2Z^2}
 \ll\frac{k^2\log k}{Z}
 =o(1)
 \tag{5.2}
\]

uniformly in every low prime.  Thus the correct residue remains the unique
decoded point throughout the growing coherent high main arc.  The sparse
replacement leaves the terminal frequency partition unchanged.

## 6. Sharpened dyadic coverage threshold

With the dense sensor family removed, the reserved reciprocal load is

\[
 \Lambda_0(k)
 =\Lambda_{\rm ctrl}+\Lambda_{\rm sens}^{\rm sparse}
 =O(1/k).
 \tag{6.1}
\]

The hyperbolic mass pool still has asymptotic capacity `pi^2/12`.  Therefore,
for every

\[
 q\in[C/k,1/5],
 \tag{6.2}
\]

one may greedily choose unused mass edges and a common Bernoulli parameter
`theta in [1/3,1/2]` so that

\[
 \theta\sum_{e\in E}\frac1e=q,
 \qquad
 \sum_{e\in E}\frac1e<0.41<1.
 \tag{6.3}
\]

All arguments in the corrected dyadic Fourier partition remain valid:

1. sparse sensors eliminate the low product fibre by (3.4);
2. quantitative high control handles the floor sector;
3. coherent labels reconstruct the global frequency by Section 5;
4. total load `<1` gives deterministic no-wrap exactness;
5. the central-band theorem supplies overlap at `1/5`.

### Theorem 6.1 -- sharpened dyadic floor candidate

At the complete dyadic prefixes `N_k=pi(2^(2k+1)-)`,

\[
 \boxed{
 \gamma_{N_k}=O(1/k).
 }
 \tag{6.4}
\]

## 7. All-prefix consequence

Li's recurrence

\[
 \gamma_N\le\gamma_{N-1}+\frac{w_N}{p_N}
\]

has a summable tail with `w_N<=4/sqrt(p_N)` eventually.  Iterating from the
complete dyadic subsequence and using `k asymp log p_N` gives the sharpened
candidate rate

\[
 \boxed{
 \gamma_N=O\left(\frac1{\log p_N}\right)\longrightarrow0.
 }
 \tag{7.1}
\]

This remains a theorem candidate pending PDL expansion and independent review.
It strengthens, and should supersede for quantitative purposes, the earlier
`O(log log p_N/log p_N)` candidate rate.

## 8. Relation to joint decoding

Joint low-coordinate decoding remains an open frontier, but it is no longer
needed to remove the `log log` loss.  The earlier loss came from using the whole
prime population when only logarithmic cyclic distance was required.

A joint or cancellation-based architecture could still improve the remaining
`O(1/log Z)` high-control load.  That is now the correct next frontier.