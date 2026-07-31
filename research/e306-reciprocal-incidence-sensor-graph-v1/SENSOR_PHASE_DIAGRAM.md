# Sensor Architectures and Corrected Phase Diagram

Put

```text
ell=log Z,
Z=X^gamma,
H=Z^alpha.
```

The fixed-power literal terminal theorem uses `2/3<alpha<1`. The endpoint
`alpha=2/3`, equivalently `Gamma=3/2` for
`Gamma=log Z/log H`, is not included.

## 1. One conditional architecture, two placements

### Terminal sensor

The terminal sensor is a prime set

```text
S subset [Z-H,Z).
```

The same sensor coordinates:

1. determine the literal anchor assignment;
2. feed reciprocal cross-edge rows into nonsensor moduli;
3. provide source-uniform inverse-residue concentration;
4. leave the lower-lower complete-pair factors available for retained-skeleton
   damping.

For the full block,

```text
|S|~H/ell.
```

An irregular subset with `|S| asymp H/ell` and the same diameter remains
admissible up to constants. Constant-density deletion changes the actual target
variance and constants but not the power closure. Further thinning below this
density is not automatic; it requires a sparse-core theorem.

### Interior sensor

An interior fixed-ratio sensor places a coherent block away from the terminal
edge while preserving separate nonsensor decoder rows and a retained damping
interval. It is another sufficient realization of the conditional
sensor-separator architecture.

The terminal and interior versions share the same logical requirements:

- disjoint cross-edge rows for eliminated vertices;
- source-uniform row concentration after arbitrary conditioning;
- an injective decoder completion;
- complete hidden-target coverage;
- a residual factor family not consumed by sensing;
- quotient and no-wrap closure.

Neither architecture proves a sharp minimum sensor width.

## 2. Vanishing sensor density

Let the complete prime-vertex set have

```text
N~Z/ell
```

vertices and the terminal sensor have

```text
s~H/ell.
```

Then

```text
s/N~H/Z=Z^(alpha-1)->0.
```

The fraction of complete-pair edges touching a sensor vertex is

```text
[s(N-s)+binom(s,2)]/binom(N,2)
 =(2+o(1))H/Z
 ->0.
```

The sensor-sensor edge fraction is

```text
~(H/Z)^2.
```

Thus both sensor-coordinate density and sensor-touching-edge density vanish,
even though the sensor remains sufficient for anchor rigidity and row
decoding. This sparsity statement does not imply arbitrary sparse-deletion
resilience.

## 3. Provider thresholds

The accepted terminal provider ledger is:

| Provider | Sufficient scale | Fixed-power meaning |
|---|---:|---|
| Prime supply | `|S| asymp H/ell` plus a retained fixed-ratio interval | available in the accepted regime |
| Meaningful anchor floor | `H^2 >> Z D ell^3` | near `alpha=1/2` |
| Reciprocal-flow anchor partition | `H^2 >> Z D^3 ell^8` | every fixed `alpha>1/2` for subpower `D` |
| Row distance, `r<=H` | `D_r >> H/ell^3` | row-specific |
| Row distance, `r>H` | `D_r >> H^3/(r^2ell^3)` | worst at large rows |
| Global fibre summability | `H^3 >> Z^2ell^4` | every fixed `alpha>2/3` |
| Retained skeleton | `Q_pair(m) >> |m|/(log|m|)^2` | no additional power loss |
| Quotient/no-wrap | fixed reciprocal load `<1` | no sensor-width power loss |

The `alpha=1/2` scale belongs to the anchor-flow floor. The load-bearing global
frontier is `alpha=2/3`, created by the worst row/fibre estimate.

## 4. Correct total variance

Let

```text
vartheta_X=t/Lambda_X
 ->vartheta=2t/(log gamma)^2,
tau(b)=sum_(p|b)1/p^2.
```

For a sensor set `S`, the actual inverse-square load is

```text
sum_(e in E_X)1/e^2
 =(1+o(1))[
   1/(2X^2log^2X)
   +tau(b)|S|/Z^2
 ].
```

For the full terminal block, `|S|~H/ell`, and therefore

```text
sigma_X^2
 =(1+o(1))vartheta(1-vartheta)
  [
   1/(2X^2log^2X)
   +tau(b)H/(Z^2ell)
  ].
```

The first term is complete-pair variance. The second is target-edge variance.
The fixed-ratio constant is obtained from the actual interval integral; it
should not be recovered by formally substituting `H=Z` into a thin-interval
asymptotic.

## 5. Variance transition

Up to fixed factors depending on `b` and `gamma`, define

```text
R_var=H X^2 log X/Z^2.
```

Then

```text
R_var->0       complete-pair variance dominates,
R_var->c>0     both terms contribute,
R_var->infinity target-edge variance dominates.
```

For `H=Z^alpha=X^(gamma alpha)`,

```text
R_var asymp X^(2-gamma(2-alpha)) log X.
```

The power transition is

```text
gamma_var(alpha)=2/(2-alpha).
```

Hence:

- `gamma>gamma_var(alpha)`: pair-dominated;
- `gamma<gamma_var(alpha)`: target-dominated;
- `gamma=gamma_var(alpha)`: target-dominated by the residual logarithm.

The genuinely mixed window is

```text
H asymp Z^2/(X^2log X).
```

At `alpha=1`, the power transition is `gamma=2`, matching the fixed-ratio
diagram. As `alpha` decreases to `2/3`, the transition approaches `3/2`.

## 6. Sharp coefficient in the two variance phases

The inherited local-Gaussian theorem gives

```text
L_X P_X(t)
 ~1/(sqrt(2pi)sigma_X).
```

In the pair-dominated phase,

```text
L_X P_X(t)
 ~XlogX/sqrt(pi vartheta(1-vartheta)).
```

In the target-dominated phase,

```text
L_X P_X(t)
 ~Z sqrt(ell/H)/
   sqrt(2pi vartheta(1-vartheta)tau(b)).
```

At the pure power transition, the target term wins by one logarithm and the
scale is `X sqrt(log X)`, not `X log X`.

## 7. Quantitative consequences

The corrected variance changes the explicit sharp-coefficient scale only.
The following accepted consequences retain their proofs and exponential rates:

- representation entropy;
- exact-cardinality extraction at its proved window;
- Hamming-separated equal-cardinality families;
- denominator-height rate and its entropy optimization;
- refinement branching;
- global transfer.

Balanced signed relations acquire the exact reciprocal-incidence homogeneous-
fibre interpretation: differences of equal-cardinality exact-target
representations are alphabet-restricted homogeneous assignments and, under
no-wrap, exact zero reciprocal relations.

The graph identity itself does not prove that exponentially many nonzero
homogeneous assignments exist. That abundance still comes from the
representation-entropy theorem.

## 8. Boundary statements

1. The anchor theorem alone reaches every fixed `alpha>1/2` under its stated
   subpower `D` control.
2. The complete literal architecture currently reaches every fixed
   `alpha>2/3`.
3. The equality `alpha=2/3`, or `Gamma=3/2`, is not a theorem.
4. No sharp minimum-width result is claimed.
5. Uniformity holds for fixed positive activity, or compact activity ranges
   bounded away from zero, not as activity tends to zero.
6. Prime supply, target observability, Taylor control, quotient semantics, and
   no-wrap are inherited providers, not consequences of reciprocal-flow
   entropy.
