# Audit addendum 01 — coherent-label reconstruction across the growing high main arc

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / CONTROLLING ADDENDUM / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

This addendum controls the coherent-label part of
`HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`, Section 6.  It repairs an ambiguity in
the phrase “labels outside the coherent range fall back into the floor sector”.
The accepted localization theorem permits a second outside-main sector with an
exact coherent quadratic label.  That lane must be bounded separately.

## 1. Scales

At the complete dyadic prefix

\[
 Z=2^{2k+1},
\]

the construction has

\[
 W_{2,\rm sens}\asymp\frac1{Zk},
 \qquad
 \sigma_{\rm ctrl}^2\asymp\frac1{Zk^2},
 \qquad
 \frac c{Zk}\le V\le\frac C Z.
 \tag{1.1}
\]

Choose a growing high-main parameter

\[
 C_k=D\sqrt{\log k},
 \tag{1.2}
\]

where `D` is a sufficiently large fixed constant.  The accepted high-control
main arc and localization theorems are uniform for every `C>=1`, after a base
scale independent of `C`, so they may be instantiated with `C=C_k`.

## 2. The correct low residue remains decoded

Let a coherent high assignment carry label `m` with

\[
 |m|\le\frac{C_k}{\sigma_{\rm ctrl}}.
 \tag{2.1}
\]

For a low prime `r<2^k`, the sensor phase at the residue `x_r=m mod r` is

\[
 \frac{m}{rs}\pmod1,
 \qquad s\in\mathcal S_k.
\]

Its weighted local energy is at most

\[
 E_r(m)
 \ll\frac{m^2}{r^2}
     \sum_{s\in\mathcal S_k}\frac1{s^2}.
 \tag{2.2}
\]

Using

\[
 m^2\le\frac{C_k^2}{\sigma_{\rm ctrl}^2}
 \ll C_k^2 Zk^2,
 \qquad
 \sum_{s\in\mathcal S_k}\frac1{s^2}\asymp\frac1{Zk},
\]

we obtain

\[
 E_r(m)\ll\frac{C_k^2k}{r^2}
 =O\!\left(\frac{k\log k}{r^2}\right).
 \tag{2.3}
\]

The top-block cyclic code distance satisfies

\[
 D_r\gg\frac Z{\log Z}\asymp\frac Zk.
 \tag{2.4}
\]

Hence

\[
 \sup_{r<2^k}\frac{E_r(m)}{D_r}
 \ll\frac{k^2\log k}{Z}\longrightarrow0.
 \tag{2.5}
\]

The residue `m mod r` is therefore the unique low-energy decoded point for every
low prime, uniformly throughout the growing high main arc.  Every competing low
residue has weight

\[
 \exp(-\Omega(Z/k)).
 \tag{2.6}
\]

Additional low--high mass factors cannot spoil this conclusion: their energies
are nonnegative, while the sensor subfamily already separates every competitor.

## 3. Reconstruction of the global frequency

Choosing `x_r=m mod r` at every low prime, together with the coherent high
assignment, gives

\[
 h\equiv m\pmod p
\]

for every prefix prime `p`.  Since the label range in (2.1) is polynomial in
`Z` while the primorial is exponential in `Z`, this is the unique global
frequency `h=m` in the centered period range.

The total contribution of every other low-coordinate choice, summed over all
coherent labels in (2.1), is still

\[
 \exp(-\Omega(Z/k)).
 \tag{3.1}
\]

and is negligible against the main scale `V^(-1/2)`.

## 4. Uniform full-variance Taylor range

Every selected denominator satisfies `e>=Z/2`.  From (2.1),

\[
 \frac{|m|}{e}
 \ll\frac{C_k\sqrt Z\,k}{Z}
 \ll\frac{k\sqrt{\log k}}{\sqrt Z}
 \longrightarrow0.
 \tag{4.1}
\]

Thus the logarithmic Bernoulli-factor expansion is uniform on the entire growing
high main arc, not merely on the positive main window:

\[
 \log(1-\theta+\theta e(m/e))
 =2\pi i\theta m/e
  -2\pi^2\theta(1-\theta)m^2/e^2
  +O(|m/e|^3).
\]

The total cubic remainder is bounded by

\[
 |m|^3\sum_e e^{-3}
 \ll\frac{|m|^3}{Z}\sum_e e^{-2}
 \ll\frac{k^3(\log k)^{3/2}}{\sqrt Z}
 =o(1).
 \tag{4.2}
\]

Therefore every reconstructed coherent label in (2.1) has the full-variance
Gaussian form

\[
 e(-mq)\prod_e(1-\theta+\theta e(m/e))
 =\exp(-2\pi^2Vm^2+o(1)).
 \tag{4.3}
\]

## 5. Three-lane terminal split

Fix a sufficiently large constant `M_0`.

### Lane A — positive Gaussian window

For

\[
 |m|\le M_0V^{-1/2},
\]

(4.3) gives a positive real contribution

\[
 \gg V^{-1/2}.
\]

### Lane B — coherent intermediate tail

For

\[
 M_0V^{-1/2}<|m|\le C_k/\sigma_{\rm ctrl},
\]

(4.3) gives

\[
 \sum \exp(-cVm^2)
 \ll e^{-cM_0^2}V^{-1/2}.
\]

Choose `M_0` once so this is a small fraction of Lane A.

### Lane C — coherent sector outside the high main arc

The accepted diagonal/coherent Gaussian theorem gives

\[
 \ll\frac{e^{-cC_k^2}}{\sigma_{\rm ctrl}}.
\]

Using `sqrt(V)/sigma_ctrl=O(k)` and (1.2),

\[
 \frac{e^{-cC_k^2}/\sigma_{\rm ctrl}}{V^{-1/2}}
 \ll k^{1-cD^2}.
\]

Choose `D` with `cD^2>2`; this is `o(1)`.

The remaining noncoherent assignments lie in the high-energy floor sector and
are bounded by the quantitative Peierls extraction.

## 6. Corrected conclusion

The complete Fourier minor contribution is the sum of:

1. the floor sector, super-polynomially small relative to `V^(-1/2)`;
2. low-coordinate siblings, `exp(-Omega(Z/k))`;
3. the coherent intermediate Gaussian tail, made small by fixed `M_0`;
4. the coherent outer tail, made `o(V^(-1/2))` by `C_k=D sqrt(log k)`.

This closes the terminal frequency partition required by the dyadic
finite-prefix theorem candidate.  It introduces no new external mathematical
input and changes no released, PDL, corpus, manuscript, formalization, review,
or publication status.
