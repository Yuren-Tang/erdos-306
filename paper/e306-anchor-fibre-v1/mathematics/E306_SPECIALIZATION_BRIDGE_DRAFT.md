# Final AFT-to-E306 specialization bridge

**Status:** mathematical draft for `E306-PAPER-01-M1`; not yet independently repair-verified.

## 1. Source boundary

This bridge consumes only:

- dense candidate `proof-development/e306-one-anchor-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`;
- independent audit `review/e306-one-anchor-proof-audit-v1@1d63273ede93e1b83abf1ab9073d91b76600c23c`;
- repaired structural statements in `STRUCTURAL_TOOLS_DRAFT.md`.

The old conditional map at `research/e306-anchor-fibre-transference-v1@2f49ab25c36326e9ea39e3fc0ed1d22a22b11693` is provenance only. Its normalized decoder-weight formulation and globally uniform decoder wording are superseded here.

No multiblock, sparse, or unaudited hybrid argument is consumed.

## 2. Arithmetic system

Fix squarefree `b>=3`, a finite forbidden denominator set, and a sufficiently large scale `X`. Put

```text
Z=X^3,
P={p prime:X<=p<Z},
B={q prime:Z/2<=q<Z},
S_b={r prime:r|b},
E_pair={pq:p,q in P,p<q},
E_b={rq:r in S_b,q in B},
E=E_pair disjoint-union E_b,
L=b product_(p in P)p.
```

The exact Fourier coefficient is built with

```text
Lambda=sum_(e in E)1/e,
theta=1/(b Lambda).
```

The load and variance statements, distinctness, avoidance, squarefree period, and `Lambda<1` are the arithmetic capacity providers. They are not consequences of fibre compression.

## 3. Exact factor partition

The Fourier factors are assigned exactly once:

```text
B-B                   -> top anchor factor T_B,
(P\B)-B               -> lower-prime row kernels,
S_b-B                  -> target-row kernels,
(P\B)-(P\B)           -> retained residual factor G.
```

The target character and every unassigned phase remain in the complex residual factor. After absolute values, the residual modulus is at most one; on the decoded skeleton its value is retained for Gaussian, adaptive, or target-sensitive damping.

This partition is the concrete semantic input to weighted product-fibre compression.

## 4. Anchor and fibre objects

For the repaired weighted theorem:

```text
Y = top-block CRT assignments on B,
R = (P\B) union S_b,
X_r = residue classes modulo r.
```

For a top assignment `y`:

```text
W_y=T_B(y),
a_(r,y)(x_r)=the actual row-kernel modulus,
d_r(y)=a minimum-energy row residue,
alpha_(r,y)=a_(r,y)(d_r(y)),
beta_(r,y)=sum_(x_r!=d_r(y))a_(r,y)(x_r).
```

No division by `alpha_(r,y)` is used. Some decoder weights may vanish without invalidating the exact theorem.

The dense proof gives off-decoder bounds

```text
beta_(r,y)<=delta_r
```

uniformly in the top shift, with

```text
Delta=sum_r delta_r
 <=Z^2 exp(-cZ/log^3 Z).
```

Since every row modulus is at most one,

```text
0<=alpha_(r,y)<=1.
```

Therefore

```text
product_r(alpha_(r,y)+beta_(r,y))-product_r alpha_(r,y)
 <=product_r(1+delta_r)-1
 <=exp(Delta)-1.
```

Summing with the actual anchor weight gives

```text
E_fib
 <=P_top(exp(Delta)-1),
P_top=sum_y T_B(y)=O(Z log Z).
```

This is exactly the final dense global fibre estimate. No raw anchor cardinality occurs.

## 5. Provider table

### P1 — weighted anchor partition

**Final statement.** The repaired one-block theorem on `B` gives a forcing scale

```text
F_B asymp Z/log^3 Z.
```

Below it, every top assignment is coherent with a unique integer label `m`, and its top energy is the exact quadratic form

```text
Q_B=m^2 sigma_B0^2.
```

Above it, fingerprint entropy and Fourier damping give exponentially small total weight. The complete weighted top partition satisfies

```text
P_top=O(Z log Z).
```

**Source.** `proof-development/ONE-ANCHOR-HUMAN-PROOF.md`, top-anchor and top-partition sections; independently checked in `review/E306-OA-AUDIT-01-REPORT.md` §4 and claim-matrix obligations E1–E3.

**Use.** Supplies the actual weights in the fibre average and the noncoherent/top-label lane estimates. One underlying top-block theorem discharges several obligations on disjoint lanes; this is not double-counting.

### P2 — shift-uniform fibre decoding

**Final statement.** For every top shift:

```text
D_r>>Z/log^3 Z,        r in P\B,
D_r>>_b Z/log Z,       r in S_b.
```

Choosing a row-energy minimizer gives

```text
beta_(r,y)<=delta_r<=r exp(-cD_r),
Delta<=Z^2 exp(-cZ/log^3 Z).
```

**Source.** `ONE-ANCHOR-HUMAN-PROOF.md`, multiplicity-sensitive cyclic-energy, lower-row, fixed-row, and row-tail results; independently checked by claim-matrix C1–C5.

**Use.** Supplies the exact unnormalized weighted compression above.

### P3 — lane-dependent decoder identification

For a coherent top label `m`, the proposed prime-coordinate decoder is `m mod r`.

**Prime coordinates in `P`.** Identification holds uniformly for

```text
|m|<=M_dec,
M_dec=XZ/(log Z)^2.
```

**Target coordinates dividing `b`.** Identification is required and proved only for

```text
|m|<=X^2/4.
```

**Source.** `ONE-ANCHOR-HUMAN-PROOF.md`, decoder-identification section; independently checked by claim-matrix F1–F3.

**Use by lane.**

```text
major:          |m|<=C/sigma_E       all relevant coordinates decode;
Gaussian:       C/sigma_E<|m|<=X^2/4 all relevant coordinates decode;
adaptive:       X^2/4<|m|<=M_dec     all P-coordinates decode;
large coherent: |m|>M_dec            no decoder identification asserted.
```

The adaptive lane needs only the `P`-coordinates because its retained lower-lower pair factors do not depend on the target rows.

### P4 — residual skeleton damping

After decoder compression, the unassigned factors remain on the skeleton.

1. **Gaussian lane:**
   ```text
   C/sigma_E<|m|<=X^2/4.
   ```
   The actual-family variance gives a Gaussian tail, made a small fixed fraction of the major scale by choosing `C` first.

2. **Adaptive retained-pair lane:**
   ```text
   X^2/4<|m|<=M_dec.
   ```
   Prime pairs in an interval comparable to `sqrt(|m|)` lie in `P\B`, remain in the residual skeleton, and give
   ```text
   Q_pair(m)>>|m|/(log|m|)^2.
   ```

3. **Large coherent top-label lane:**
   ```text
   |m|>M_dec.
   ```
   The top quadratic energy gives the required Gaussian/fingerprint tail.

**Source.** `ONE-ANCHOR-HUMAN-PROOF.md`, adaptive damping, five-sector, and terminal-budget sections; independently checked by G1–G3 and I5–I8.

### P5 — positive major contribution

For

```text
|m|<=N,
N=floor(C/sigma_E),
```

all required coordinates represent the genuine integer frequency `m mod L`. Exact centering

```text
theta sum_(e in E)1/e=1/b
```

cancels the linear phase. The actual-family cubic remainder is uniformly `o(1)`, and

```text
Re sum_(|m|<=N)F(m)>=c_maj/sigma_E.
```

**Source.** `ONE-ANCHOR-HUMAN-PROOF.md`, Taylor-major section; independently checked by I1–I4.

This is a complex positive-real estimate, not a modulus estimate.

### P6 — quotient coefficient and ambient exactness

Character orthogonality identifies the normalized Fourier sum with the nonnegative target coefficient. The strict major/minor/fibre budget gives positive quotient probability.

Only afterwards is no-wrap applied. The subset reciprocal sum lies in `[0,Lambda]`, with `Lambda<1`, while the target `1/b` also lies in `(0,1)`. The congruence difference is integral and lies strictly between `-1` and `1`, so it is zero.

**Source.** `ONE-ANCHOR-HUMAN-PROOF.md`, Fourier formula and arithmetic closure; independently checked by A4, A6, J1–J4.

No quantitative alias theorem is used in E306.

## 6. Frequency lanes and exact assembly

Let the decoded skeleton be divided into:

```text
Y_maj:       coherent labels |m|<=C/sigma_E,
Y_Gauss:     C/sigma_E<|m|<=X^2/4,
Y_adapt:     X^2/4<|m|<=M_dec,
Y_top:       coherent labels |m|>M_dec,
Y_bad:       noncoherent anchors.
```

Off-decoder tuples are not an additional skeleton lane; they are charged by `E_fib` in the weighted compression theorem.

The specialized positivity proposition gives

```text
Re full Fourier numerator
 >=major
   -Gaussian lane
   -adaptive lane
   -large coherent top lane
   -noncoherent anchor lane
   -weighted off-decoder fibre error.
```

The terminal choice is strictly

```text
C -> X.
```

First fix `C` so the Gaussian tail is a sufficiently small fraction of the major coefficient. Then choose `X` beyond every finite threshold in the load, PNT, rigidity, row-distance, decoder, adaptive interval, Taylor remainder, avoidance, no-wrap, and strict-budget ledgers.

## 7. No-new-mathematics check

This bridge introduces:

- no new frequency range;
- no stronger provider estimate;
- no division by decoder weights;
- no omitted target coordinate;
- no requirement that `b`-coordinates decode in the adaptive lane;
- no circular use of the final positivity statement;
- no factor not already present in the exact denominator partition;
- no multiblock or sparse-route lemma.

It reorganizes the final independently audited dense proof through the repaired exact weighted interface.

## 8. M1 verification obligations

An independent repair verifier must check:

1. the exact factor partition against the dense proof;
2. the monotonic unnormalized error estimate;
3. the use of `P_top`, not raw top cardinality;
4. every decoder range at its two endpoints;
5. target-coordinate coverage in every lane;
6. the disjointness of skeleton lanes and off-decoder error;
7. the strict `C -> X` order;
8. no-wrap after, not inside, quotient positivity.
