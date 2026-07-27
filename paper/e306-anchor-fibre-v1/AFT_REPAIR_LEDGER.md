# E306-PAPER-01 — bounded AFT repair ledger

## Source and assurance

- authorial AFT packet: `research/e306-anchor-fibre-transference-v1@2f49ab25c36326e9ea39e3fc0ed1d22a22b11693`
- final dense candidate: `proof-development/e306-one-anchor-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`
- independent dense audit: `review/e306-one-anchor-proof-audit-v1@1d63273ede93e1b83abf1ab9073d91b76600c23c`
- adoption audit: `[BOUNDED-REPAIR E306-AFT-AUDIT-02]`
- repair-verification head: `5945a2b9d3c596bed13f42201be11a39d4a0068c`
- repair-verification return: `[PASS E306-AFT-REPAIR-VERIFY-01]`

The repairs below concern theorem statements, interface optimization and the exact final bridge. They do not repair or alter the independently audited dense E306 proof.

## Repair closure

| ID | Required repair | Mathematical class | Status |
|---|---|---|---|
| R01 | Use “anchor-dependent and averaged row errors”; do not assert a sequential conditional-product theorem. | exposition / scope | VERIFIED |
| R02 | Require the asymptotic comparison scale to be eventually positive. | bounded statement repair | VERIFIED |
| R03 | Use measurable alias-event probability, with alias sums only in the discrete countable case. | bounded statement repair | VERIFIED |
| R04 | Treat P1–P6 as distinct obligations while allowing one theorem to discharge several on disjoint lanes. | logical-interface repair | VERIFIED |
| R05 | Replace `mid/out` by an arbitrary finite family of minor lanes. | theorem optimization | VERIFIED |
| R06 | Require observability sensors to be homomorphisms `H -> R/Z`. | bounded mathematical repair | VERIFIED |
| R07 | Separate finite-system injectivity from asymptotic quantitative lower bounds. | bounded statement repair | VERIFIED |
| R08 | State observability as a lane-dependent coverage condition. | theorem optimization | VERIFIED |
| R09 | Record the moving-uniformity consequence `k^2 V/U^2 -> 0`. | bounded strengthening from existing proof | VERIFIED |
| R10 | Use the exact unnormalized weighted theorem in the E306 bridge. | E306 bridge repair | VERIFIED |
| R11 | Use the final sector- and coordinate-dependent decoder ranges. | E306 bridge repair | VERIFIED |
| R12 | Apply no-wrap and alias removal only after quotient Fourier positivity. | architecture repair | VERIFIED |

## Verified structural statements

### T1 — complete-family collision theorem

For nonnegative `u_i`, with `U=sum_i u_i`, `V=sum_i u_i^2` and `k>=2`,

```text
0 <= U^k/k! - e_k(u)
   <= U^(k-2)V/(2(k-2)!).
```

The verified form includes `U=0`, fixed and moving uniformity, and the exact pair identity

```text
e_2(u)=(U^2-V)/2.
```

### T2 — exact weighted product-fibre compression

For

```text
F(y,x)=W_y product_r a_(r,y)(x_r) H_y(x),
|H_y(x)|<=1,
```

and a chosen decoder tuple,

```text
sum_(y,x)F(y,x)=sum_yF(y,d(y))+E_fib
```

with the sharp unnormalized bound

```text
|E_fib|
 <=sum_y W_y {
    product_r(alpha_(r,y)+beta_(r,y))
    -product_r alpha_(r,y)
   }.
```

Zero weights, empty row families, nonunique decoders and complex residual factors are included. Normalized exponential forms are corollaries only.

### T3 — finite-group syndrome separation

For `psi_j in Hom(H,R/Z)`, the verified theorem gives nearest-syndrome separation, the Gaussian-modulus tail, qualitative injectivity, the quantitative-sequence distinction and the lane-dependent coverage principle.

### T4 — decoded-skeleton positivity proposition

The verified assembly proposition combines T2 with an arbitrary finite skeleton-lane partition. It proves positivity of the quotient Fourier coefficient. Ambient exact equality and no-wrap remain subsequent application-specific steps.

## Verified final E306 bridge

| Obligation | Final dense provider | Adopted article form |
|---|---|---|
| P1 weighted anchor partition | one-block exact-cold rigidity, fingerprint high-energy bound, `P_top=O(Z log Z)` | coherent and energetic weights separated; no raw assignment count |
| P2 fibre decoding | lower-prime and fixed-`b` row distances; shift-uniform tails; exact product inequality | T2 invoked without normalization; `0<=alpha_r<=1` monotonicity displayed |
| P3 decoder identification | all `P` coordinates through `M_dec`; `b` coordinates through `X^2/4` | lane- and coordinate-dependent ranges stated exactly |
| P4 residual damping | Gaussian, adaptive lower–lower pair and top-label lanes | every unassigned factor retained on the skeleton |
| P5 positive major | exact centering, Taylor remainder and positive real Gaussian major | complex phase proof kept distinct from modulus estimates |
| P6 exactness | character orthogonality, positivity, then no-wrap | no-wrap placed after T4; no quantitative alias theorem imported |

The verifier found no new estimate, stronger range, hidden normalization, omitted target coordinate, circularity or unaudited hybrid.

## M1 disposition

1. T1–T4 have complete verified proofs.
2. R01–R12 are `VERIFIED`.
3. P1–P6 have exact final ranges and parameter order.
4. The dense E306 proof remains unchanged and complete.
5. The packet is ready to serve as the article's structural foundation.

```text
[PASS E306-AFT-REPAIR-VERIFY-01]
[M1 COMPLETE / M2-M3 AUTHORIZED E306-PAPER-01]
```

A repair becomes `ADOPTED` when its verified statement is incorporated into the manuscript source.