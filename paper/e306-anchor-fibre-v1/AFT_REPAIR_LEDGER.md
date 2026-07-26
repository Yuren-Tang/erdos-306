# E306-PAPER-01 — bounded AFT repair ledger

## Source and return

- authorial AFT packet: `research/e306-anchor-fibre-transference-v1@2f49ab25c36326e9ea39e3fc0ed1d22a22b11693`
- final dense candidate: `proof-development/e306-one-anchor-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`
- independent dense audit: `review/e306-one-anchor-proof-audit-v1@1d63273ede93e1b83abf1ab9073d91b76600c23c`
- adoption audit terminal return: `[BOUNDED-REPAIR E306-AFT-AUDIT-02]`

No item below is a repair to the final dense E306 proof. The work is theorem-statement cleanup, general-interface optimization, and exact integration with the final audited provider ranges.

## Repair statuses

Legend:

- `OPEN` — not yet written in final article form
- `DRAFTED` — replacement statement/proof drafted
- `VERIFIED` — independently checked
- `ADOPTED` — incorporated into manuscript

| ID | Required repair | Mathematical class | Status |
|---|---|---|---|
| R01 | Rename “conditional row errors” to “anchor-dependent and averaged row errors” unless a sequential conditional-product theorem is actually stated. | exposition / scope | OPEN |
| R02 | Add eventual positivity of the comparison scale to the asymptotic positivity corollary. | bounded statement repair | OPEN |
| R03 | Replace the arbitrary-kernel alias sum by measurable alias-event probability, or explicitly assume a discrete countable fibre. | bounded statement repair | OPEN |
| R04 | State P1–P6 as distinct obligations; allow one underlying theorem to discharge several obligations on disjoint lanes. | logical-interface repair | OPEN |
| R05 | Replace abstract `mid/out` categories by an arbitrary finite family of minor lanes. | theorem optimization | OPEN |
| R06 | Require observability sensors to be homomorphisms `H -> R/Z`. | bounded mathematical repair | OPEN |
| R07 | Separate finite-system injectivity (`delta>0`) from asymptotic quantitative lower bounds. | bounded statement repair | OPEN |
| R08 | Treat observability as a coverage condition which may operate through decoding or retained residual factors according to the lane. | theorem optimization | OPEN |
| R09 | Add the variable-uniformity consequence `k^2 V/U^2 -> 0` to complete-family mass. | bounded strengthening from existing proof | OPEN |
| R10 | Replace frozen decoder normalization by the exact unnormalized weighted theorem. | E306 bridge repair | OPEN |
| R11 | Replace globally uniform decoder identification by the final sector- and coordinate-dependent ranges. | E306 bridge repair | OPEN |
| R12 | Place no-wrap and alias removal after quotient Fourier positivity. | architecture repair | OPEN |

## Principal repaired statements to produce

### T1 — Complete-family collision theorem

For nonnegative `u_i`, with

```text
U=sum_i u_i,
V=sum_i u_i^2,
```

and `k>=2`, prove

```text
0 <= U^k/k! - e_k(u)
   <= U^(k-2)V / (2(k-2)!).
```

Record separately:

- `U=0`;
- fixed-`k` consequence `V/U^2 -> 0`;
- variable-`k` consequence `k^2 V/U^2 -> 0`;
- the exact pair identity `e_2=(U^2-V)/2` used by E306.

### T2 — Weighted product-fibre compression

Use the exact unnormalized form as principal theorem:

```text
F(y,x)=W_y product_r a_(r,y)(x_r) H_y(x),
|H_y(x)|<=1.
```

For a chosen decoder tuple `d(y)`, define

```text
alpha_(r,y)=a_(r,y)(d_r(y)),
beta_(r,y)=sum_(x_r != d_r(y))a_(r,y)(x_r).
```

Then

```text
sum_(y,x)F(y,x)=sum_yF(y,d(y))+E_fib
```

with

```text
|E_fib|
 <=sum_y W_y {
    product_r(alpha_(r,y)+beta_(r,y))
    -product_r alpha_(r,y)
   }.
```

The theorem must state sharpness from the displayed data and include zero weights, empty row families, nonunique decoders, and complex residual factors.

Normalized and exponential estimates are corollaries only.

### T3 — Finite-group syndrome separation

Let `H` be a finite abelian group and

```text
psi_j in Hom(H,R/Z).
```

Put

```text
delta^2=min_(0!=h in H) sum_j ||psi_j(h)||^2.
```

For shifts `a_j`, define

```text
E_a(h)=sum_j ||a_j+psi_j(h)||^2.
```

If `h_a` minimizes `E_a`, then for `h!=h_a`,

```text
E_a(h)>=delta^2/4.
```

Consequently Gaussian-modulus kernels yield an off-decoder mass bound. State separately:

- the trivial group case;
- `delta>0` iff the syndrome map is injective;
- a scale-dependent lower bound is the quantitative input for a sequence;
- observability is sufficient for this decoder method, not a classification of all cancellation-based Fourier arguments.

### T4 — Decoded-skeleton positivity proposition

Fuse weighted compression with an arbitrary finite skeleton-lane partition. The main statement should give the exact lower bound

```text
Re sum_(y,x)F(y,x)
 >= Re sum_(y in Y_maj)F(y,d(y))
    - sum_j |sum_(y in Y_j)F(y,d(y))|
    - E_fib.
```

A label map is optional and introduced only where it improves estimates.

The proposition proves quotient coefficient positivity only. Exact ambient equality is a subsequent application-specific step.

## Final E306 bridge obligations

| Obligation | Final dense provider | Required article form |
|---|---|---|
| P1 weighted anchor partition | one-block exact-cold rigidity, fingerprint high-energy bound, `P_top=O(Z log Z)` | state coherent and energetic anchor weights separately without raw assignment counts |
| P2 fibre decoding | lower-prime and fixed-`b` row distances; shift-uniform row tails; exact product inequality | invoke T2 unnormalized; use `0<=alpha_r<=1` monotonicity |
| P3 decoder identification | all `P` coordinates through `M_dec`; `b` coordinates through `X^2/4` | state lane- and coordinate-dependent ranges exactly |
| P4 residual damping | Gaussian, adaptive lower-lower pair, and top-label lanes | retain every unassigned factor on the skeleton |
| P5 positive major | exact centering, Taylor remainder, positive real Gaussian major | keep complex phase proof distinct from modulus estimates |
| P6 exactness | character orthogonality, positivity, then no-wrap | place after T4; do not build no-wrap into transference |

## Acceptance boundary for M1

M1 is complete only when:

1. T1–T4 are written with full proofs;
2. R01–R12 are at least `DRAFTED`;
3. every P1–P6 bridge has exact source, range, and parameter order;
4. no new E306 estimate or hybrid route has been introduced;
5. a one-off read-only verifier can check the repaired statements without reconstructing the research genealogy.

Required M1 return:

```text
[READY-FOR-AFT-REPAIR-VERIFICATION E306-PAPER-01-M1]
```
