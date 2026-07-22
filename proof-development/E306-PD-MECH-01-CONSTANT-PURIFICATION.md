# E306-PD-MECH-01 — mechanism-first constant purification

**Role:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Task:** `E306-PD-MECH-01 — mechanism-first constant purification and parameter architecture`  
**Status:** `READY-FOR-MANUSCRIPT-CONSUMER`  
**Predecessor:** `proof-development/e306-rigour-v1@2eda43717603877d4c5a879b3103f99e36d5e6d1`  
**Read-only manuscript input:** `paper/arxiv-v1-revision-v3@94615a5c860be9ce04c2be0153759a4e66fc25ab`  
**Immutable formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

No manuscript or Lean source is modified by this packet. The purpose is to separate the proof mechanism from one convenient numerical instantiation and from constants that exist only because the released Lean proof closes finite inequalities explicitly.

## 1. Four-way classification

Every public numerical choice belongs to one of four classes.

1. **Structural boundary.** A sign, strict inequality, finite-fibre factor, scale relation, or non-circular dependency that the mechanism genuinely needs. Removing it changes the proof.
2. **Normalization.** A freely chosen value that fixes notation or optimizes a simple secondary quantity. Another value in an admissible interval would give the same proof.
3. **Safety margin.** Deliberate slack used to avoid equality cases or simplify the terminal comparison. It should not be presented as a mathematically distinguished constant.
4. **Formal finite certificate.** A concrete integer or rational used by the immutable Lean development to discharge a finite inequality. It is evidence for the symbolic assertion, not part of the conceptual architecture unless the article explicitly chooses to expose it.

The current manuscript mixes these classes. The purified proof keeps the structural inequalities visible, names normalizations when they clarify the mechanism, and moves safety margins and finite certificates to a short verification note or the formalization reference.

## 2. Mechanism-level invariant spine

For fixed squarefree `b >= 3` and finite obstruction set `T`, the proof needs only the following invariant assertions.

- A common dyadic window supplies positive block density and reciprocal-prime mass strictly larger than `1`.
- The control graph has reciprocal load tending to `0` and deviation scale bounded below by `c_sigma/(k0 2^k0)` for some fixed `c_sigma>0`.
- Low-energy assignments are either globally diagonal or pay an exponentially growing forcing floor; the off-diagonal Laplace mass is therefore `o(1/sigmaCtrl)`.
- The denominator family can be completed to a reciprocal-load window whose associated Bernoulli parameter stays in a compact subinterval of `(0,1)`.
- The full variance is comparable with the control variance by one finite constant `K_sigma`.
- The major sum is at least `c_maj/sigmaE` for one fixed `c_maj>0`.
- The minor sum has three mechanisms: block-control tail, diagonal Gaussian tail, and squarefree-denominator sibling damping. Three positive budget shares with sum below `1` close the comparison.
- All constants are fixed before the bottom scale; `k0` is the final maximum of finitely many thresholds.

No exact decimal, large integer, or quarter allocation is required by this spine.

## 3. Analytic window

### 3.1 Reciprocal mass

The article currently fixes

```text
sum_{k=k0}^{3k0} A_k >= 21/20.
```

The structural requirement is only

```text
sum_{k=k0}^{3k0} A_k >= mu
```

for one fixed `mu` satisfying

```text
1 < mu < log 3.
```

The PNT local law `A_k = 1/k + o(1/k)` supplies every such `mu` at one eventual threshold. The pair-pool identity then gives

```text
pairPool = (S1^2-S2)/2 >= 1/2
```

once `S2 <= mu^2-1`. Thus:

- the strict boundary `mu>1` is structural;
- the upper condition `mu<log 3` is the compatibility condition with the chosen threefold block-index window;
- `mu=21/20` is a safety-margin instantiation;
- `k0>=5` is a finite certificate for that instantiation.

The factor `3` in the upper index `3k0` is a normalization. Any fixed stretch `tau>1` with `log tau>mu` would work after the routine endpoint adjustment. Retaining `3` is preferable for compatibility with the released proof and the existing inclusive endpoint `2^(3k0+1)`.

### 3.2 Density

The lower bound

```text
|P_k| >= 2^k/(2 log(2^k))
```

is the fixed density normalization consumed by the cold-block lemmas. The proof only needs a positive constant multiple of `2^k/log(2^k)`. The displayed factor `1/2` is not a terminal parameter and should not be rhetorically grouped with the later constants.

The auxiliary choices

```text
1/(2 log 2) < c_D < 1,
21/(20 log 3) < c_M < 1
```

are PNT threshold witnesses. In the purified version they become: choose `c_D` above the required density coefficient and choose `c_M` with `mu/log 3 < c_M < 1`.

## 4. Control graph and deviation scale

The structural statement is

```text
controlLoad(k0) -> 0,
sigmaCtrl >= c_sigma/(k0 2^k0)
```

for a fixed `c_sigma>0`.

The present explicit values classify as follows.

| Current value | Classification | Purified role |
|---|---|---|
| `4/k` for one block | elementary finite certificate | one possible proof of `S_k=O(1/k)` |
| `32/(k0-1)` | human explicit certificate | one possible `C_load/(k0-1)` |
| `512/(k0-1)` | released formal certificate | compatibility value only |
| `k0>=14` | finite threshold certificate | absorbed into final `k0` |
| `1/(100 k0 2^k0)` | safe explicit certificate | use symbolic `c_sigma/(k0 2^k0)` |
| `2048b+2` | optional threshold witness | not manuscript architecture |

The exact graph, centred CRT convention, fibre map, and factors arising from internal and adjacent blocks are structural and remain explicit. The constants produced by the primorial proof are not.

## 5. Low-energy block mechanism

### 5.1 Dominance parameter

The uniqueness mechanism needs a dominant proportion greater than `1/2`. It is natural to write

```text
0 < rho < 1/2.
```

The released route uses `rho=1/4`, so a dominant class contains at least three quarters of the block. This is a normalization with generous slack, not a structural boundary.

### 5.2 Forcing, exceptions, and boundary energy

The mechanism needs constants

```text
c_w(rho)>0,
c_exc(rho)>0,
c_boundary(rho)>0
```

such that:

- absence of a dominant label forces `Q_k >= c_w 2^k/log^3(2^k)`;
- a cold block has an exception count bounded by a constant multiple of `c_w`;
- choosing `c_w` sufficiently small makes the exception count zero in the localization regime;
- unequal adjacent labels, under the stated label-size and exception hypotheses, force the boundary floor `Pi_k`.

The following values are formal/local certificates, not global design parameters:

```text
256/rho, 16, rho N/8, 2u+2, 32(u+1)+8,
1/8192, 10^6, 4718592, 2^15, 2^20/3,
2^-21, 5/(1-rho), 1/8, 32, 12, 2^13.
```

They verify one implementation of the covering, dispersion, exception, label-size, and boundary arguments. The manuscript should retain the hypotheses and the qualitative dependence of the constants, but need not present this entire certificate chain in its main narrative.

The exception-aware hypotheses are structural. In particular, “different adjacent labels force energy” is false without the label-size, residue-agreement, reduced-cardinality, and exception assumptions.

## 6. Global level sets and tails

The current level-set estimate is

```text
#L(R) <= exp(AJ) exp(8 epsilon R) (1+sqrt(R)/sigmaCtrl).
```

The purified interface is:

> For every `gamma>0`, after fixing the cold-forcing normalization and taking the blocks sufficiently large, there is `A_gamma` such that
> `#L(R) <= exp(A_gamma J) exp(gamma R)(1+sqrt(R)/sigmaCtrl)`.

Here:

- `exp(AJ)` is structural: there is bounded encoding entropy per block;
- the coefficient `8` is a finite encoding certificate and disappears into `gamma`;
- the Laplace argument structurally chooses `gamma<c'<c`;
- the forcing floor must dominate `AJ+log(1/sigmaCtrl)`, which is a scale relation, not a public constant.

For the diagonal tail, one may retain

```text
C_tail(c) exp(-c C^2/2)/sigmaCtrl.
```

The split `1/2` is a normalization. More generally any split factor in `(0,1)` works with a changed `C_tail`. The explicit value

```text
C_tail(c)=1+6 sqrt(2)/sqrt(c)
```

is a released finite certificate.

## 7. Reciprocal-load normalization

This is the one place where the current constants express a useful optimization rather than arbitrary clutter.

Let `alpha` be the target base-load scale. The greedy step with overshoot `alpha/b` gives

```text
alpha/b <= Lambda < 2 alpha/b,
theta=(1/b)/Lambda in (1/(2alpha),1/alpha].
```

Uniformly for all `b>=3`, the pair-pool and no-wrap requirements impose

```text
1 < alpha <= 3/2.
```

The lower Bernoulli variance on the weight interval is

```text
v(alpha)=min{
  (1/(2alpha))(1-1/(2alpha)),
  (1/alpha)(1-1/alpha)
}.
```

On `1<alpha<=3/2`, this minimum is maximized at the unique balancing value

```text
alpha=3/2.
```

It yields the symmetric interval

```text
1/3 < theta <= 2/3
```

and

```text
v_* = min theta(1-theta)=2/9.
```

Therefore `3/(2b)`, `3/b`, `1/3`, `2/3`, and `2/9` are best treated as one coherent normalization. They are not independent magic constants. The choice `alpha=3/2` simultaneously saturates the worst-case pool budget at `b=3`, preserves no-wrap, and maximizes the uniform Bernoulli variance produced by this greedy scheme.

## 8. Variance certificate

Write the inverse-square comparison symbolically as

```text
sum_{e in E} 1/e^2 <= C_2 sigmaCtrl^2.
```

Then

```text
sqrt(v_*) sigmaCtrl <= sigmaE <= K_sigma sigmaCtrl
```

for any fixed

```text
K_sigma > sqrt(C_2/4).
```

The immutable release supplies

```text
C_2=1000001,
K_sigma=501.
```

Classification:

- finiteness of `C_2` is structural;
- `1000001` is a formal finite certificate;
- `501` is a rounded safety margin above the required square root;
- the terminal proof should use the symbol `K_sigma`, with the explicit instantiation recorded once in a verification note.

## 9. Major-arc constants

Choose a Taylor radius `r_T` with

```text
0 < r_T < 1/4.
```

This structural bound keeps every Bernoulli factor in the open right half-plane and gives an unambiguous principal logarithm. Choose an aggregate remainder allowance

```text
0 < delta_T < pi/2.
```

At the final scale require

```text
|m/e| <= r_T,
C_T sum_e |m/e|^3 <= delta_T.
```

Then

```text
Re T_m >= a_T exp(-2 pi^2 m^2 sigmaE^2),
a_T=exp(-delta_T) cos(delta_T)>0.
```

A coarse integer count gives

```text
mainSum >= c_maj/sigmaE,
c_maj=(a_T/2) exp(-pi^2/2)>0.
```

The manuscript values classify as:

| Current value | Classification |
|---|---|
| `r_T=1/10` | Taylor safety margin |
| aggregate error `1/10` | phase/remainder safety margin |
| `0.8` | coarse lower certificate for `a_T` |
| `c_3=0.8 e^{-pi^2/2}/2` | derived certificate |
| `C>=3` | harmless cutoff normalization |

The mechanism needs only `c_maj>0` fixed before the terminal budgets.

## 10. Fourier damping and sibling suppression

With `v_*=2/9`, the exact one-factor identity and the centered sine inequality give

```text
|F(h)| <= exp(-c_F Q_E(h)),
c_F=8v_*=16/9.
```

Thus `16/9` is a structural consequence of the chosen weight normalization, not an independent safety constant.

For a squarefree-denominator sibling and one mismatch prime `r|b`, each common-reservoir gadget factor is bounded by

```text
sqrt(1-4v_*/r^2) <= beta_b,
beta_b=sqrt(1-4v_*/b^2)<1.
```

At `v_*=2/9` this is exactly

```text
beta_b=sqrt(1-8/(9b^2)).
```

The factors `b` and `b(2N+1)` in the two minor lanes are structural CRT/fibre cardinalities. They may not be hidden in an unspecified constant.

## 11. Terminal budget purification

The quarter allocation is not structural. Introduce three positive budget shares

```text
q_blk, q_gauss, q_sib > 0,
q_blk+q_gauss+q_sib < 1.
```

With `M_0=c_maj/K_sigma`, choose

```text
eta = q_blk M_0/b,
```

then choose `C` so that

```text
b C_tail exp(-c_F C^2/2) < q_gauss M_0,
```

then set

```text
D_sib = q_sib M_0/[b(2C+3)]
```

and choose `G` with `beta_b^G <= D_sib`. Finally choose `k0`.

The manuscript's values

```text
q_blk=q_gauss=q_sib=1/4,
2004=4*501
```

are a symmetric safety allocation leaving one unused quarter. The number `2004` has no independent mathematical meaning.

The affine factor `2C+3` is ceiling bookkeeping from `N=ceil(C/sigmaCtrl)` and the eventual condition `sigmaCtrl<=1`; it is structural at this level but may be named `A_C` to avoid treating it as another optimization target.

## 12. Final classification summary

### Keep visible in the mathematical body

- squarefree `b>=3` and the two exact uses of squarefreeness;
- inclusive block window and common threshold;
- exact control graph and centred CRT convention;
- dominant-label hypotheses and exception-aware boundary theorem;
- `exp(AJ)` block entropy;
- load normalization `alpha=3/2` and the resulting compact weight interval;
- finite variance constant `K_sigma`;
- damping constant `c_F=8v_*`;
- fibre factors `b` and `b(2N+1)`;
- three budget shares with total below `1`;
- the order `budgets -> C -> sibling target -> G -> k0`.

### Move to a formal/finite-certificate note

- `21/20`, `k0>=5`, `4`, `32`, `512`, `14`, `100`;
- the local cold-block constants and powers of two;
- `8` in the level-set exponent and the explicit Gaussian-sum constant;
- `1000001`, `501` as the released variance instantiation;
- `1/10`, `0.8`, `1/4`, and `2004`.

## 13. Frontier test

Every purification above follows from the existing PDL proof units, the immutable released proof, and elementary algebraic reparameterization. No implication requires a new theorem, a stronger analytic input, or a changed construction. Therefore this task exposes no `[BLOCKED-FRONTIER]`.
