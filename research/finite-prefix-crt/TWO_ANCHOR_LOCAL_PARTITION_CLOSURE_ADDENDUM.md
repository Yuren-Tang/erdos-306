# Addendum — closure of the two-anchor local partition interface

**Controls:** `TWO_ANCHOR_CROSS_SCALE_CONTROL_V1.md`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / CLOSES REVISED GAP / FULL THEOREM CANDIDATE`  
**Date:** 2026-07-22

The controlling two-anchor note left `LOCAL-ANCHOR-PARTITION(j)` as an exact
proof-development interface.  A closer inspection of the verified single-block
SBEE components shows that no new local theorem is needed.

A logarithmic energy cutoff simultaneously forces dominance, removes every
exception, and identifies an exact integer label.  Everything above that cutoff
is bounded by extracting an exponential factor from the already verified full
single-block partition function.

This closes the only visible mathematical implication in the two-anchor route.
The result remains an argument-level theorem candidate pending PDL expansion and
independent review.

## 1. Verified single-block inputs

Let `P` be an Irving-good prime block in `[Y,2Y]`, with block energy `Q_P` and
scale `sigma_P`.

The verified tree supplies:

1. **Full partition bound.**  For every fixed `c'>0`,

   \[
   \sum_a e^{-c'Q_P(a)}\le \frac{C_{c'}}{\sigma_P}.
   \tag{1.1}
   \]

   This is `SBEEAssembly.single_block_counting`.

2. **Nondominant forcing.**  There is `c_B>0` such that every nondominant
   assignment satisfies

   \[
   Q_P(a)\ge c_B\frac{Y}{(\log Y)^3}.
   \tag{1.2}
   \]

   This is Theorem B.

3. **Dominant label and exception count.**  If `a` is dominant with energy at
   most `R`, then it has an integer label `m`, and its number of exceptions is
   bounded by

   \[
   h(a)\ll \frac{R Y^2}{|P|^3}
   \ll \frac{R(\log Y)^3}{Y}.
   \tag{1.3}
   \]

4. **Exact in-class CRT identity.**  If there are no exceptions, every block
   residue equals `m`, and

   \[
   Q_P(a)=m^2\sigma_P^2
   \tag{1.4}
   \]

   throughout the centered label range.

All constants are block-uniform after one base scale.

## 2. Logarithmic cutoff

For the dyadic prefix parameter `Z`, choose

\[
 R_0=D^2\log Z,
 \tag{2.1}
\]

where `D` is a sufficiently large fixed constant.

For either anchor scale

\[
 Y\asymp\sqrt Z
 \qquad\text{or}\qquad
 Y\asymp Z,
\]

one has

\[
 R_0=o\left(\frac{Y}{(\log Y)^3}\right).
 \tag{2.2}
\]

Therefore every assignment with

\[
 Q_P(a)\le R_0
 \tag{2.3}
\]

is dominant by Theorem B.

Moreover (1.3) gives

\[
 h(a)\ll\frac{R_0(\log Y)^3}{Y}=o(1).
 \tag{2.4}
\]

Since `h(a)` is a nonnegative integer, it equals zero for all sufficiently large
`Z`.

### Theorem 2.1 — exact low-energy coherence

For either anchor block and all sufficiently large `Z`, every assignment with
`Q_P<=R_0` is exactly of the form

\[
 a_p=m\pmod p\qquad(p\in P)
 \tag{2.5}
\]

for one integer `m`, and

\[
 \boxed{Q_P(a)=m^2\sigma_P^2.}
 \tag{2.6}
\]

In particular,

\[
 |m|\le\frac{\sqrt{R_0}}{\sigma_P}.
 \tag{2.7}
\]

No dominant exception lane remains inside the logarithmic main window.

## 3. The entire complement from the full partition theorem

Fix Fourier damping exponents

\[
 c>c'>0.
\]

For every assignment with `Q_P>R_0`,

\[
 e^{-cQ_P}
 \le e^{-(c-c')R_0}e^{-c'Q_P}.
\]

Summing and applying (1.1),

\[
 \boxed{
 \sum_{Q_P>R_0}e^{-cQ_P}
 \le
 \frac{C_{c'}}{\sigma_P}
 e^{-(c-c')R_0}.
 }
 \tag{3.1}
\]

With `R_0=D^2 log Z`, this is

\[
 \frac{C_{c'}}{\sigma_P}Z^{-(c-c')D^2}.
 \tag{3.2}
\]

Thus one does not need a separately packaged Gaussian coherent tail,
nondominant tail, or exception tail.  All nonexact assignments and all labels
outside the low-energy window are absorbed at once.

## 4. Multiplication by the opposite anchor partition

Let the lowest and top anchor scales be `sigma_A` and `sigma_B`.  Their full
partition functions are `O(1/sigma_A)` and `O(1/sigma_B)`.

If the lowest anchor lies above its cutoff, its contribution after summing the
entire top anchor is at most

\[
 \frac{C}{\sigma_A\sigma_B}
 Z^{-\delta D^2}.
 \tag{4.1}
\]

The same bound holds with the anchors reversed.

The positive main scale is at least a constant multiple of `1/sigma_A`, because

\[
 \sigma_{\rm anch}^2\asymp\sigma_A^2\asymp\frac1{Z(\log Z)^2}.
\]

Also

\[
 \sigma_B^{-1}=Z\,\operatorname{polylog}(Z).
\]

Choose `D` once so that

\[
 Z^{-\delta D^2}\sigma_B^{-1}=o(1).
 \tag{4.2}
\]

Then every sector in which at least one anchor exceeds its logarithmic cutoff is
`o(1/sigma_A)`.

The base thresholds in the verified single-block theorems are fixed before
`D`; the only new asymptotic checks are (2.2), (2.4), and (4.2).  Hence there is
no circular growing-cutoff quantifier problem.

## 5. The low-energy anchor pair

It remains to sum anchor assignments satisfying

\[
 Q_A\le R_0,
 \qquad
 Q_B\le R_0.
\]

By Theorem 2.1 they have exact labels `u` and `v`, with

\[
 |u|\le\frac{\sqrt{R_0}}{\sigma_A},
 \qquad
 |v|\le\frac{\sqrt{R_0}}{\sigma_B}.
 \tag{5.1}
\]

These ranges satisfy:

1. `|u-v|<prod_(p in A) p`;
2. `|v|=o(Z^(3/2))`.

Therefore the cross-scale synchronization theorem applies.

- If `u!=v`, the cross energy is `Omega(Z/log Z)`, and the total sum over all
  label pairs is exponentially negligible.
- If `u=v=m`, the complete anchor energy is exactly

  \[
  Q_{\rm anch}(m)=m^2\sigma_{\rm anch}^2.
  \tag{5.2}
  \]

Thus the low-energy anchor pair collapses to one common integer label.

## 6. Consequence for the finite-prefix route

All non-anchor prefix coordinates are eliminated by the sparse actual-prime
sensor family from the controlling note.  On the common anchor label, their
decoded residues are `m mod r`; the full Bernoulli product has variance `V` and
the usual one-dimensional Taylor/Gaussian main term.

The reserved load is

\[
 \Lambda_0=O((\log Z)^{-2}),
\]

so the mass pool tunes every

\[
 q\in[C/(\log Z)^2,1/5].
\]

No-wrap gives exact equality, and Li's central band supplies overlap.

### Theorem 6.1 — two-anchor dyadic floor candidate

At complete dyadic prefixes,

\[
 \boxed{
 \gamma_{N_k}=O(k^{-2}).
 }
 \tag{6.1}
\]

### Corollary 6.2 — all-prefix candidate rate

Li's summable recurrence gives

\[
 \boxed{
 \gamma_N=O\left(\frac1{(\log p_N)^2}\right)
 \longrightarrow0.
 }
 \tag{6.2}
\]

## 7. Revised disposition

`LOCAL-ANCHOR-PARTITION(j)` is closed at the argument level by:

```text
logarithmic cutoff
-> Theorem B dominance
-> Theorem A exception count < 1
-> exact coherent label
```

and

```text
complement
-> extract exp(-(c-c')R_0)
-> verified full partition at c'.
```

PDL should verify constants, exact theorem hypotheses, and correspondence, but no
new local mathematical implication is presently visible.

The two-anchor route is now classified as

`FULL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.