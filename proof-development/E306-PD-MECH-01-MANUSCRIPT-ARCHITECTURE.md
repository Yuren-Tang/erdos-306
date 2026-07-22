# E306-PD-MECH-01 — manuscript-ready symbolic parameter architecture

**Role:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Task:** `E306-PD-MECH-01 — mechanism-first constant purification and parameter architecture`  
**Status:** `READY-FOR-MANUSCRIPT-CONSUMER`  
**Predecessor:** `proof-development/e306-rigour-v1@2eda43717603877d4c5a879b3103f99e36d5e6d1`  
**Read-only manuscript input:** `paper/arxiv-v1-revision-v3@94615a5c860be9ce04c2be0153759a4e66fc25ab`  
**Companion audit:** `proof-development/E306-PD-MECH-01-CONSTANT-PURIFICATION.md`  
**Immutable formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

This file is the direct consumer interface for the next manuscript worker. It gives one complete symbolic parameter architecture, explicit admissibility conditions, a non-circular choice order, the terminal comparison, and a section-by-section replacement map. Concrete constants from the released formal proof remain available as finite certificates but are not used as if they were intrinsic mathematical invariants.

## 1. Fixed problem data and retained normalizations

Fix:

- a squarefree integer `b >= 3`;
- a finite obstruction set `T`;
- the dyadic block-index window `k0 <= k <= 3k0`, inclusive.

Choose once and for all a reciprocal-mass target

```text
1 < mu < log 3.
```

The PNT/Abel interface supplies, at one common threshold,

```text
|P_k| >= 2^k/[2 log(2^k)]                 (k0 <= k <= 3k0),
sum_{k=k0}^{3k0} sum_{p in P_k} 1/p >= mu.
```

The article may retain the convenient certificate `mu=21/20`. Its role should be stated as one admissible margin, not as a distinguished constant.

For reciprocal-load completion use the optimized greedy normalization

```text
alpha = 3/2.
```

It produces

```text
alpha/b <= Lambda < 2alpha/b,
1/3 < theta=(1/b)/Lambda <= 2/3,
v_* := min theta(1-theta) = 2/9.
```

The value `alpha=3/2` is the unique balancing choice in `1<alpha<=3/2` that maximizes the worst-case Bernoulli variance while preserving the pair-pool and no-wrap constraints uniformly for `b>=3`.

## 2. Symbolic constants

### 2.1 Control constants

Use fixed constants `C_load>0` and `c_sigma>0` for which, eventually,

```text
controlLoad <= C_load/(k0-1),
sigmaCtrl >= c_sigma/(k0 2^k0).
```

The existing proof permits `C_load=32` in the human estimate, `C_load=512` in the released coarse certificate, and `c_sigma=1/100`. The manuscript mechanism needs only positivity and eventuality.

### 2.2 Low-energy constants

Choose a dominance parameter

```text
0 < rho < 1/2.
```

The released route uses `rho=1/4`. Choose the cold-forcing constant `c_w=c_w(rho)>0` sufficiently small that the following hold at one scale threshold:

1. nondominance implies
   ```text
   Q_k >= c_w 2^k/log^3(2^k);
   ```
2. every cold block has the required dominant label and quantitative label-size bound;
3. the exception count is within the boundary theorem's budget;
4. in the localization regime the exception count is zero.

The adjacent-label floor `Pi_k` remains the exact exception-reduced expression from the proof. Its hypotheses are part of the theorem and may not be suppressed.

### 2.3 Level-set and tail constants

The purified level-set interface is:

> For every `gamma>0`, there are `A_gamma>0` and a scale threshold such that
> ```text
> #L(R) <= exp(A_gamma J) exp(gamma R)
>          (1+sqrt(R)/sigmaCtrl),       R>=1.
> ```

For the Fourier damping exponent `c_F` below, choose

```text
gamma < c' < c_F.
```

Laplace absorption then gives, for every target `eta>0`,

```text
sum_{Qctrl >= F0} exp(-c_F Qctrl) <= eta/sigmaCtrl
```

at a further scale threshold.

The diagonal sector has a Gaussian estimate

```text
sum_diagonal exp(-c_F Qctrl)
 <= C_tail(c_F) exp(-c_F C^2/2)/sigmaCtrl.
```

Any valid `C_tail(c_F)>0` may be used. The released explicit certificate is

```text
C_tail(c)=1+6 sqrt(2)/sqrt(c).
```

### 2.4 Variance constant

Let `C_2<infinity` be a fixed inverse-square comparison constant:

```text
sum_{e in E} 1/e^2 <= C_2 sigmaCtrl^2.
```

Choose

```text
K_sigma > sqrt(C_2/4).
```

Then

```text
sqrt(v_*) sigmaCtrl <= sigmaE <= K_sigma sigmaCtrl.
```

The released finite certificate is

```text
C_2=1000001,
K_sigma=501.
```

The manuscript should use `K_sigma` in the architecture and record this concrete instantiation once.

### 2.5 Main-arc constants

Choose a Taylor radius and aggregate remainder allowance

```text
0 < r_T < 1/4,
0 < delta_T < pi/2.
```

Define

```text
a_T   = exp(-delta_T) cos(delta_T) > 0,
c_maj = (a_T/2) exp(-pi^2/2) > 0.
```

At the final scale require, for `N=ceil(C/sigmaCtrl)`, every `|m|<=N`, and every `e in E`,

```text
|m/e| <= r_T,
C_T sum_e |m/e|^3 <= delta_T.
```

The logarithm branch is then valid and

```text
Re T_m >= a_T exp(-2 pi^2 m^2 sigmaE^2),
Re sum_{|m|<=N} T_m >= c_maj/sigmaE.
```

The current values `r_T=1/10`, `delta_T=1/10`, and the lower coefficient `0.8` are safe certificates for this interface.

### 2.6 Fourier and sibling damping

From `v_*=2/9`, the universal Fourier-energy exponent is

```text
c_F = 8v_* = 16/9.
```

For a main-assignment sibling, define

```text
beta_b = sqrt(1-4v_*/b^2)
       = sqrt(1-8/(9b^2)) < 1.
```

Each selected common-reservoir gadget prime contributes a factor at most `beta_b`.

## 3. Terminal budget shares

Choose positive shares

```text
q_blk>0, q_gauss>0, q_sib>0,
q_blk+q_gauss+q_sib < 1.
```

Define the normalized major allowance

```text
M_0 = c_maj/K_sigma.
```

The previous equal-quarter choice is recovered by

```text
q_blk=q_gauss=q_sib=1/4,
```

but the proof requires only the strict sum condition.

## 4. Complete dependency order

The parameters are chosen in the following order.

### Step 0 — fixed proof interfaces

Fix

```text
mu, alpha=3/2, rho, c_w,
r_T, delta_T, C_2, K_sigma,
q_blk, q_gauss, q_sib.
```

These depend on neither `k0` nor the subsequently constructed block system.

### Step 1 — block-control allowance

Set

```text
eta = q_blk M_0/b.
```

Apply the global control theorem with exponent `c_F`, obtaining `C_tail=C_tail(c_F)` and a threshold `K_global(c_F,eta)`.

### Step 2 — Gaussian cutoff

Choose `C` so that

```text
C >= max{1, 1/sqrt(v_*)}
```

and

```text
b C_tail exp(-c_F C^2/2) < q_gauss M_0.
```

A reproducible sufficient choice is any `C` strictly larger than

```text
max{
  1,
  1/sqrt(v_*),
  sqrt[(2/c_F) log_+(b C_tail/(q_gauss M_0))]
},
```

where `log_+(x)=max{0,log x}`. A fixed positive additive margin makes the inequality strict.

The condition `C>=1/sqrt(v_*)` guarantees that the main window contains the range `|m|<=1/(2sigmaE)` once the harmless finite small-variance threshold has been imposed.

### Step 3 — sibling damping target

Put

```text
A_C = 2C+3,
D_sib = q_sib M_0/[b A_C].
```

The affine factor `A_C` is the exact ceiling estimate coming from

```text
N=ceil(C/sigmaCtrl),
sigmaCtrl<=1,
(2N+1)sigmaCtrl <= 2C+3.
```

### Step 4 — common reservoir size

Choose an integer `G>=1` such that

```text
beta_b^G <= D_sib.
```

When `D_sib<1`, the explicit sufficient choice

```text
G = max{1, ceil[log(1/D_sib)/(-log beta_b)]}
```

works. If `D_sib>=1`, any `G>=1` already works.

The same set of exactly `G` high block primes is used for every prime divisor of `b`. This common reservoir must be selected before the mass batch.

### Step 5 — bottom scale

Only now choose `k0` above the finite maximum in Section 5. No earlier parameter may be changed after this choice.

## 5. Final threshold ledger

It is enough to take

```text
k0 >= max{
  K_AI(mu),
  K_T(T),
  K_control-load(b),
  K_control-sigma(c_sigma),
  K_cold(rho,c_w),
  K_level(gamma,A_gamma),
  K_global(c_F,eta),
  K_aux(b,C,G),
  K_pair-pool(mu),
  K_mass(b),
  K_variance(C_2,K_sigma),
  K_period(b,C),
  K_main(r_T,delta_T,C),
  K_finite
}.
```

The entries mean:

- `K_AI(mu)`: common dyadic density and reciprocal-mass threshold;
- `K_T(T)`: every forbidden denominator lies below the bottom pair scale;
- `K_control-load(b)`: base control load fits its assigned construction budget;
- `K_control-sigma(c_sigma)`: deviation lower bound and eventual `sigmaCtrl<=1`;
- `K_cold(rho,c_w)`: dominance, label size, boundary hypotheses, and localization exceptions;
- `K_level`, `K_global`: level-set encoding and Laplace/Gaussian tail requirements;
- `K_aux(b,C,G)`: at least `G` suitable high primes, outside the support of `b`, each larger than `2N`;
- `K_pair-pool(mu)`: pair-pool load at least `1/2`;
- `K_mass(b)`: greedy term-size, disjointness, and base-load requirements;
- `K_variance`: inverse-square comparison;
- `K_period`: `2N+1<=L` and the exact CRT fibre geometry;
- `K_main`: logarithm disk and aggregate Taylor remainder;
- `K_finite`: the remaining named finite inequalities from the formal certificate.

Every threshold depends only on parameters fixed earlier. The maximum therefore closes the construction without circularity.

## 6. Final main/minor comparison

Let `sigma=sigmaCtrl`. The block-minor estimate is

```text
sum_{h in S_blk}|F(h)|
 <= b[eta+C_tail exp(-c_F C^2/2)]/sigma.
```

The sibling estimate is

```text
sum_{h in S_ext}|F(h)|
 <= b(2N+1) D_sib.
```

Multiplying by `sigma` and applying the choices above gives

```text
b eta                                      = q_blk M_0,
b C_tail exp(-c_F C^2/2)                  < q_gauss M_0,
b(2N+1)sigma D_sib                        <= q_sib M_0.
```

Hence

```text
sum_{h in S_m}|F(h)|
 < (q_blk+q_gauss+q_sib) M_0/sigma
 < M_0/sigma
 = c_maj/(K_sigma sigma)
 <= c_maj/sigmaE.
```

The major sum satisfies

```text
Re sum_{h in S_M}F(h) >= c_maj/sigmaE.
```

This is the strict Fourier positivity inequality. The factors `b` and `b(2N+1)` are structural CRT cardinalities and remain visible throughout.

## 7. Manuscript replacement map for REV4

### Analytic-input section

- State the interface with `mu in (1,log 3)`.
- Retain `mu=21/20` only as a convenient admissible certificate.
- Keep the inclusive endpoint through block `3k0`.

### Dyadic-control section

- State `controlLoad=O(1/k0)` and `sigmaCtrl >= c_sigma/(k0 2^k0)`.
- Move `4`, `32`, `512`, `14`, and `100` to a finite-certificate paragraph or note.
- Keep the exact graph, product injectivity, and centred CRT convention.

### Low-energy section

- Present `rho`, the forcing floor, dominant label, exception bound, label-size hypothesis, and adjacent-label theorem as one mechanism.
- Do not print the entire local chain of powers of two unless a proof detail genuinely uses it.
- State explicitly that the adjacent-label conclusion is exception- and size-dependent.

### Global-control section

- Replace `8epsilon` by the symbolic exponent `gamma` in the theorem interface.
- Explain the structural `exp(A_gamma J)` block entropy.
- State the choice `gamma<c'<c_F` and the forcing-floor absorption.
- Treat the explicit Gaussian-sum constant as a finite certificate.

### Reciprocal-mass and variance section

- Explain the single normalization `alpha=3/2` and derive `theta in (1/3,2/3]` and `v_*=2/9` from it.
- State the symbolic inverse-square constant `C_2` and variance constant `K_sigma`.
- Record `C_2=1000001`, `K_sigma=501` once as the formal instantiation.

### Major-arc section

- Use `r_T`, `delta_T`, `a_T`, and `c_maj`.
- Explain nonvanishing and the principal logarithm before expanding.
- Relegate `1/10` and `0.8` to one possible certificate.

### Minor-arc section

- Derive `c_F=8v_*=16/9` from the Bernoulli variance.
- Retain the exact partition inside the Fourier-minor set.
- Retain the fibre factors `b` and `b(2N+1)`.
- Define `beta_b=sqrt(1-4v_*/b^2)` and the one common `G`-prime reservoir.

### Completion section

- Replace the hard-coded quarters by `q_blk,q_gauss,q_sib>0` with sum below `1`.
- Replace `2004` by the formulas involving `M_0=c_maj/K_sigma`.
- Give the exact order
  ```text
  fixed interfaces -> eta -> C -> D_sib -> G -> k0.
  ```
- Display the final three-line budget comparison from Section 6.

## 8. Consumer acceptance tests

A consuming manuscript revision passes this checkpoint only if all of the following hold.

1. Every public number is either derived from a stated normalization or labelled as a safety/finite certificate.
2. The symbolic architecture determines all terminal choices before `k0`.
3. The final `k0` is one finite maximum and no theorem used in that maximum depends on a later choice.
4. The exact exception and label-size hypotheses of the boundary theorem are retained.
5. The exact Fourier-minor partition and both CRT fibre factors are retained.
6. The common gadget reservoir is chosen before the mass batch and supplies every denominator-sensitive sibling.
7. The variance upper bound is stated with `K_sigma`; `501` is recorded only as the released instantiation.
8. The final comparison uses three positive budget shares whose sum is strictly below `1`.
9. The manuscript does not claim that the PNT presentation or this purified architecture is already formalized in the archived release.
10. No manuscript, Lean, release, workflow, tag, DOI, or other-role branch is modified by the PDL checkpoint itself.

## 9. Frontier status

This architecture is an algebraic and expository purification of the already completed proof. It changes no theorem, analytic input, denominator construction, or Fourier implication. No new mathematics is required, so there is no `[BLOCKED-FRONTIER]`.
