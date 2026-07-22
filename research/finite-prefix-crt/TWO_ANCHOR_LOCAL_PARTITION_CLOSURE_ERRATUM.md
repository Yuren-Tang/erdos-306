# Erratum — main-scale comparison in the two-anchor closure

**Controls:** `TWO_ANCHOR_LOCAL_PARTITION_CLOSURE_ADDENDUM.md`, Section 4  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `CORRECTION / CONCLUSION UNCHANGED`  
**Date:** 2026-07-22

Section 4 incorrectly stated that the positive Gaussian main scale is at least a
constant multiple of `1/sigma_A` because the anchor variance is comparable with
`sigma_A^2`.

The full Bernoulli variance `V` also contains mass edges, so

```text
V >= constant * sigma_A^2
```

implies

```text
1/sqrt(V) <= constant / sigma_A,
```

not the reverse.

The correct comparison is as follows.

All selected denominators satisfy `e>=Z/2`, and the total reciprocal load is
bounded by an absolute constant below one.  Hence

\[
 V=\theta(1-\theta)\sum_e\frac1{e^2}
 \ll\frac1Z.
\]

Therefore the positive Gaussian main scale obeys

\[
 \frac1{\sqrt V}\gg\sqrt Z.
 \tag{E.1}
\]

The product of the two full anchor partition scales is

\[
 \frac1{\sigma_A\sigma_B}
 =Z^{3/2}\operatorname{polylog}(Z).
 \tag{E.2}
\]

Thus a high-energy anchor sector is bounded by

\[
 Z^{-\delta D^2}
 Z^{3/2}\operatorname{polylog}(Z).
\]

Relative to the lower bound (E.1), its ratio is

\[
 Z^{1-\delta D^2}\operatorname{polylog}(Z).
\]

Choosing the fixed constant `D` so that `delta D^2>2` makes this `o(1)`.

Accordingly, replace the comparison in Section 4 by

```text
high-anchor remainder
  <= Z^(-delta D^2)/(sigma_A sigma_B)
  = o(V^(-1/2)).
```

The two-anchor local-partition closure and the candidate rate

\[
 \gamma_N=O((\log p_N)^{-2})
\]

are unchanged.  No authority or assurance status changes through this erratum.