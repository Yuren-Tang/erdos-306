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
| R01 | Rename “conditional row errors” to “anchor-dependent and averaged row errors” unless a sequential conditional-product theorem is actually stated. | exposition / scope | DRAFTED |
| R02 | Add eventual positivity of the comparison scale to the asymptotic positivity corollary. | bounded statement repair | DRAFTED |
| R03 | Replace the arbitrary-kernel alias sum by measurable alias-event probability, or explicitly assume a discrete countable fibre. | bounded statement repair | DRAFTED |
| R04 | State P1–P6 as distinct obligations; allow one underlying theorem to discharge several obligations on disjoint lanes. | logical-interface repair | DRAFTED |
| R05 | Replace abstract `mid/out` categories by an arbitrary finite family of minor lanes. | theorem optimization | DRAFTED |
| R06 | Require observability sensors to be homomorphisms `H -> R/Z`. | bounded mathematical repair | DRAFTED |
| R07 | Separate finite-system injectivity (`delta>0`) from asymptotic quantitative lower bounds. | bounded statement repair | DRAFTED |
| R08 | Treat observability as a coverage condition which may operate through decoding or retained residual factors according to the lane. | theorem optimization | DRAFTED |
| R09 | Add the variable-uniformity consequence `k^2 V/U^2 -> 0` to complete-family mass. | bounded strengthening from existing proof | DRAFTED |
| R10 | Replace frozen decoder normalization by the exact unnormalized weighted theorem. | E306 bridge repair | DRAFTED |
| R11 | Replace globally uniform decoder identification by the final sector- and coordinate-dependent ranges. | E306 bridge repair | DRAFTED |
| R12 | Place no-wrap and alias removal after quotient Fourier positivity. | architecture repair | DRAFTED |

## Draft locations

- repaired complete-family, compression, observability, positivity and alias statements:
  `mathematics/STRUCTURAL_TOOLS_DRAFT.md`
- final unnormalized, sector-dependent AFT-to-E306 bridge:
  `mathematics/E306_SPECIALIZATION_BRIDGE_DRAFT.md`
- causal theorem architecture and article order:
  `THEOREM_DAG.md`

## Principal repaired statements

### T1 — Complete-family collision theorem

For nonnegative `u_i`, with

```text
U=sum_i u_i,
V=sum_i u_i^2,
```

and `k>=2`,

```text
0 <= U^k/k! - e_k(u)
   <= U^(k-2)V / (2(k-2)!).
```

The draft records separately:

- `U=0`;
- fixed-`k` consequence `V/U^2 -> 0`;
- variable-`k` consequence `k^2 V/U^2 -> 0`;
- the exact pair identity `e_2=(U^2-V)/2` used by E306.

### T2 — Weighted product-fibre compression

The principal theorem is the exact unnormalized form:

```text
F(y,x)=W_y product_r a_(r,y)(x_r) H_y(x),
|H_y(x)|<=1,
```

and

```text
|E_fib|
 <=sum_y W_y {
    product_r(alpha_(r,y)+beta_(r,y))
    -product_r alpha_(r,y)
   }.
```

The draft proves sharpness and includes zero weights, empty row families, nonunique decoders, and complex residual factors. Normalized and exponential forms are corollaries only.

### T3 — Finite-group syndrome separation

The draft requires

```text
psi_j in Hom(H,R/Z)
```

and proves the nearest-syndrome lower bound, Gaussian-modulus tail, qualitative injectivity equivalence, quantitative-sequence distinction, and lane-dependent coverage principle.

### T4 — Decoded-skeleton positivity proposition

The draft fuses weighted compression with an arbitrary finite skeleton-lane partition and proves quotient Fourier positivity from a strict displayed budget. Exact ambient equality is kept as a subsequent application-specific step.

## Final E306 bridge obligations

| Obligation | Final dense provider | Drafted article form |
|---|---|---|
| P1 weighted anchor partition | one-block exact-cold rigidity, fingerprint high-energy bound, `P_top=O(Z log Z)` | coherent and energetic weights separated; no raw assignment count |
| P2 fibre decoding | lower-prime and fixed-`b` row distances; shift-uniform row tails; exact product inequality | T2 used unnormalized; `0<=alpha_r<=1` monotonicity displayed |
| P3 decoder identification | all `P` coordinates through `M_dec`; `b` coordinates through `X^2/4` | lane- and coordinate-dependent ranges stated exactly |
| P4 residual damping | Gaussian, adaptive lower-lower pair, and top-label lanes | every unassigned factor retained on skeleton |
| P5 positive major | exact centering, Taylor remainder, positive real Gaussian major | complex phase proof separated from modulus estimates |
| P6 exactness | character orthogonality, positivity, then no-wrap | no-wrap placed after T4; no quantitative alias theorem imported |

## Acceptance boundary for M1

M1 is complete only when:

1. T1–T4 are written with full proofs — **drafted**;
2. R01–R12 are at least `DRAFTED` — **satisfied**;
3. every P1–P6 bridge has exact source, range, and parameter order — **drafted**;
4. no new E306 estimate or hybrid route has been introduced — **self-check passed, independent verification pending**;
5. a one-off read-only verifier checks the repaired statements — **pending**.

## Current state

```text
[READY-FOR-AFT-REPAIR-VERIFICATION E306-PAPER-01-M1]
```

This is an authorial readiness return, not independent verification and not manuscript adoption.
