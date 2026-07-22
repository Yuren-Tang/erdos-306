# Audit addendum 01 — variance and terminal-scale closure for sparse Gibbs anchors

**Controls:** `SPARSE_GIBBS_ANCHOR_AND_CRITICAL_SCALE_V1.md`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / CONTROLLING QUANTITATIVE ADDENDUM / CONCLUSION SURVIVES`  
**Date:** 2026-07-22

This addendum records the first adversarial check of the critical `8/9` route.
The candidate exponent survives, but three comparisons must be stated
explicitly:

1. the source of the lower variance bound;
2. the polynomial partition scale beaten by the logarithmic anchor cutoff;
3. the row-dependent sensor distance needed to keep the coherent residue decoded.

## 1. Anchor scales at `Y=Z^(8/9)`

The sparse lower anchor has

\[
 \Lambda_A\asymp Z^{-2/9}(\log Z)^{5/4},
 \qquad
 \sigma_A^2\asymp Z^{-2}(\log Z)^{5/4},
\]

so

\[
 \sigma_A^{-1}\asymp Z(\log Z)^{-5/8}.
 \tag{1.1}
\]

The sparse top anchor has

\[
 \sigma_B^2\asymp Z^{-9/4}(\log Z)^{5/4},
 \qquad
 \sigma_B^{-1}\asymp Z^{9/8}(\log Z)^{-5/8}.
 \tag{1.2}
\]

Hence the product of the two full coherent partition scales is

\[
 \boxed{
 (\sigma_A\sigma_B)^{-1}
 \asymp Z^{17/8}(\log Z)^{-5/4}.
 }
 \tag{1.3}
\]

## 2. Sensor edges supply the lower variance reservoir

The common top-prime sensor sample has

\[
 |T|\asymp(\log Z)^3.
\]

In particular, the low row `r=2` contributes the edges `2q`, `q in T`.  Since
`q asymp Z`,

\[
 \sum_{q\in T}\frac1{(2q)^2}
 \asymp\frac{(\log Z)^3}{Z^2}.
\]

The Bernoulli parameter stays in a fixed compact subinterval of `(0,1)`, so the
full Fourier variance satisfies

\[
 \boxed{
 V\gg\frac{(\log Z)^3}{Z^2}.
 }
 \tag{2.1}
\]

This is the required Lindeberg reservoir.  It does not come from the sparse
anchor alone.

Every selected denominator is at least `cZ`, and the total reciprocal load is
`O(q)` in the tuned range.  Therefore

\[
 V\ll\frac qZ
 \ll Z^{-11/9}(\log Z)^{5/4}.
 \tag{2.2}
\]

Consequently the positive Gaussian main scale obeys

\[
 \boxed{
 V^{-1/2}\gg Z^{11/18}(\log Z)^{-5/8}.
 }
 \tag{2.3}
\]

## 3. Cubic remainder on the positive main arc

Since `e>=cZ`,

\[
 \sum_e e^{-3}\ll\frac1Z\sum_e e^{-2}\asymp\frac VZ.
\]

At `|m|<=M_0V^(-1/2)`, the total cubic Taylor remainder is

\[
 |m|^3\sum_e e^{-3}
 \ll\frac1{Z\sqrt V}.
\]

Using (2.1),

\[
 \boxed{
 \frac1{Z\sqrt V}=O((\log Z)^{-3/2})=o(1).
 }
 \tag{3.1}
\]

Thus the positive Gaussian expansion is uniform.

For the intermediate coherent range

\[
 M_0V^{-1/2}<|m|\le D\sqrt{\log Z}/\sigma_A,
\]

one does not use a cubic expansion.  From

\[
 |m|/Z\ll(\log Z)^{-1/8}=o(1)
\]

and the global Bernoulli modulus bound,

\[
 \prod_e|1-\theta+\theta e(m/e)|
 \le e^{-cVm^2}.
 \tag{3.2}
\]

The intermediate tail is therefore a standard full-variance Gaussian tail.

## 4. High-anchor sectors versus the main scale

Take the sparse-anchor cutoff

\[
 R_0=D^2\log Z.
\]

If either anchor lies outside its coherent cutoff, the extracted sparse-anchor
tail is at most

\[
 \frac{Z^{-\delta D^2}}{\sigma_A\sigma_B}
 \ll
 Z^{17/8-\delta D^2}(\log Z)^{-5/4}.
\]

Relative to (2.3), the ratio is

\[
 \ll
 Z^{109/72-\delta D^2}(\log Z)^{-5/8}.
 \tag{4.1}
\]

Thus it is enough to choose the fixed constant `D` so that

\[
 \boxed{\delta D^2>2.}
 \tag{4.2}
\]

The earlier informal phrase “take `D` large” must be read with this explicit
polynomial comparison.

## 5. Sparse cross-label sector

The lower and top low-energy label counts are respectively

\[
 O(\sqrt{R_0}/\sigma_A),
 \qquad
 O(\sqrt{R_0}/\sigma_B).
\]

Their product is at most

\[
 Z^{17/8}\operatorname{polylog}(Z).
\]

The sparse cross synchronizer gives energy `c_cross M` with
`M=C_cross log Z` whenever the labels differ.  Choose `C_cross` once so that

\[
 c_{\rm cross}C_{\rm cross}>3.
 \tag{5.1}
\]

Then the entire distinct-label sector is `o(V^(-1/2))`.

## 6. Correct low residue throughout the critical window

The top-block population energy for a non-anchor row `r` has the hybrid lower
bound

\[
 \bar D_r
 \gg
 \max\{r^{-2},(\log Z)^{-2}\}.
 \tag{6.1}
\]

The first term is distribution-free; the second is the multiplicity bound for
all `r<=Z/2`.  The common sample of size `M asymp(log Z)^3` may be chosen so that

\[
 D_r(T)\gg
 M\max\{r^{-2},(\log Z)^{-2}\}
 \tag{6.2}
\]

simultaneously for all rows and multipliers.

For the distinguished residue `m mod r`,

\[
 E_r(m)\ll\frac{m^2M}{r^2Z^2}.
\]

Using (6.2),

\[
 \frac{E_r(m)}{D_r(T)}
 \ll
 \frac{m^2}{Z^2}
 \min\left\{1,\frac{(\log Z)^2}{r^2}\right\}
 \le\frac{m^2}{Z^2}
 =O((\log Z)^{-1/4})=o(1).
 \tag{6.3}
\]

Hence the correct residue remains the unique decoded point uniformly over the
whole critical coherent window.

## 7. Corrected terminal partition

The Fourier space is partitioned into:

1. a positive common-label window `|m|<=M_0/sqrt(V)`;
2. an intermediate common-label Gaussian tail, controlled by (3.2);
3. coherent anchor labels outside the logarithmic cutoff, controlled by (4.1);
4. unequal low-energy anchor labels, controlled by Section 5;
5. noncoherent sparse-anchor assignments, exponentially small by Gibbs
   sparsification;
6. low-coordinate siblings, exponentially small by (6.2)--(6.3).

Each negative lane is `o(V^(-1/2))` after fixed choices of `M_0`, `D`, and
`C_cross`.

The arbitrary-prefix candidate

\[
 \gamma_N\ll p_N^{-2/9}(\log p_N)^{5/4}
\]

therefore survives this audit.  The result remains unreviewed and consumes the
moving-entropy specialization of the verified SBEE thresholds.
