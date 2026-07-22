# Paper-first one-anchor route — direct major arc and terminal budget

**Programme:** `E306-RL`  
**Research unit:** `E306-RL-PF1A-05`  
**Status:** `ARGUMENT / MAJOR-ARC OBLIGATION CLOSED / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

## 1. Purpose

This note verifies that replacing the fixed denominator-sensitive reservoir by the
full top-block family

```text
E_b={rq:r|b prime, q in B}
```

does not disturb the complex Taylor major arc, and that the corrected six-lane
minor partition can be made strictly smaller than the major contribution with the
parameter order

```text
C -> X.
```

The variance window is defined directly using the actual full denominator family;
no comparison to the multiblock scaffold variance and no auxiliary parameter `G`
is needed.

## 2. Load and Bernoulli parameter

Let

```text
P={p prime:X<=p<X^3},
Z=X^3,
B={q prime:Z/2<=q<Z},
E_pair={pq:p,q in P,p<q},
E_b={rq:r|b prime,q in B},
E=E_pair disjoint-union E_b.
```

Put

```text
Lambda=sum_(e in E) 1/e,
theta=1/(b Lambda).
```

The complete-pair load satisfies

```text
Lambda_pair -> (log 3)^2/2.
```

The full top auxiliary load satisfies

```text
Lambda_b
 = (sum_(r|b prime)1/r)(sum_(q in B)1/q)
 = O_b(1/log Z)
 = o_b(1).
```

Since

```text
1/3 < (log 3)^2/2 < 1,
```

for every fixed squarefree `b>=3`, sufficiently large `X` places `theta` in one
compact interval

```text
I_b subset (0,1).
```

In particular all Taylor and Bernoulli-kernel constants below are uniform in `X`.
The exact centering identity is

```text
theta sum_(e in E)1/e = 1/b.
```

## 3. Actual variance

Define

```text
sigma_E^2
 = theta(1-theta) sum_(e in E)1/e^2.
```

Let

```text
U_2=sum_(p in P)1/p^2.
```

Dyadic block density gives

```text
U_2 asymp 1/(X log X).
```

Hence

```text
sum_(p<q in P)1/(p^2 q^2)
 = (U_2^2-sum_p1/p^4)/2
 asymp 1/(X^2 (log X)^2).
```

For the full `b`-family,

```text
sum_(rq in E_b)1/(r^2 q^2)
 = (sum_(r|b prime)1/r^2)(sum_(q in B)1/q^2)
 = O_b(1/(Z log Z))
 = O_b(1/(X^3 log X)).
```

Therefore

```text
sigma_E^2 asymp_b 1/(X^2 (log X)^2),
sigma_E asymp_b 1/(X log X),
1/sigma_E asymp_b X log X.
```

The ratio of the auxiliary square load to the pair square load is

```text
O_b(log X/X)=o_b(1).
```

Thus the full top sensitivity family is variance-negligible but not removed from
the exact variance definition.

## 4. Minimum denominator and cubic load

For sufficiently large `X`, every denominator in `E_pair` is at least `X^2`, and
every denominator `rq in E_b` is at least

```text
2 * Z/2 = Z = X^3 > X^2.
```

Hence

```text
min_(e in E)e >= X^2.
```

Let

```text
S_2=sum_e1/e^2,
S_3=sum_e1/e^3.
```

The minimum-denominator inequality gives

```text
S_3 <= S_2/X^2.
```

Since `S_2 asymp_b sigma_E^2`, for every fixed `C`, uniformly on

```text
|m|<=C/sigma_E,
```

one has

```text
|m|^3 S_3
 <= C^3 S_2/(sigma_E^3 X^2)
 <<_(b,C) 1/(sigma_E X^2)
 <<_(b,C) log X/X
 ->0.
```

Also

```text
max_e |m/e|
 <= C/(sigma_E X^2)
 <<_(b,C) log X/X
 ->0.
```

Thus every local phase enters a fixed Taylor disk and the aggregate cubic remainder
tends to zero uniformly throughout the major window.

## 5. Direct complex Taylor expansion

For `theta in I_b`, compactness gives constants `rho_b,M_b>0` such that, for
`|z|<=rho_b`, the principal logarithm satisfies

```text
log((1-theta)+theta exp(2 pi i z))
 = 2 pi i theta z
   -2 pi^2 theta(1-theta)z^2
   + R_theta(z),
|R_theta(z)|<=M_b|z|^3.
```

The Fourier term at the genuine integer frequency `m` is

```text
F(m)
 = product_(e in E) K_theta(m/e) * exp(-2 pi i m/b).
```

Summing the linear terms gives

```text
2 pi i m theta sum_e1/e - 2 pi i m/b = 0
```

exactly.  Therefore, uniformly for `|m|<=C/sigma_E`,

```text
log F(m)
 = -2 pi^2 m^2 sigma_E^2 + delta_m,
|delta_m| <= M_b |m|^3 S_3 = o_(b,C)(1).
```

Choose `X` large enough that `|delta_m|<=delta_0`, where

```text
exp(-delta_0) cos(delta_0) >= 1/2.
```

Then

```text
Re F(m)
 >= (1/2) exp(-2 pi^2 m^2 sigma_E^2)
```

uniformly in the whole major window.

## 6. Positive major lower bound

Choose

```text
N=ceil(C/sigma_E)
```

with fixed `C>=1`.  For large `X`, the integer residues `|m|<=N` are distinct
modulo `L`.

Restricting to

```text
|m|<=1/(2 sigma_E)
```

gives

```text
exp(-2 pi^2 m^2 sigma_E^2) >= exp(-pi^2/2).
```

This interval contains `>>1/sigma_E` integers.  Hence there is a constant
`c_maj=c_maj(b)>0` such that

```text
Re sum_(|m|<=N) F(m)
 >= c_maj/sigma_E.
```

No scaffold variance, comparison constant `K_b`, or reservoir-size threshold occurs.

## 7. Gaussian lane immediately outside the major arc

For

```text
N<|m|<=X^2/4,
```

all prime coordinates and all coordinates dividing `b` decode to `m`; the skeleton
is the genuine integer frequency.  Since `|m|/e<=1/4`,

```text
|F(m)| <= exp(-c_b m^2 sigma_E^2)
```

for one fixed `c_b>0`.

The discrete Gaussian tail satisfies

```text
sum_(|m|>C/sigma_E) exp(-c_b m^2 sigma_E^2)
 <= C_b/sigma_E * integral_(C-1)^infinity exp(-c_b t^2) dt.
```

Choose `C` so large that this is at most

```text
c_maj/(8 sigma_E).
```

This is the only terminal choice made before the scale.

## 8. Remaining lanes at fixed C

After `C` is fixed, the other corrected lanes satisfy as `X->infinity`:

### Adaptive complete-pair lane

```text
sum_(X^2/4<|m|<=M_dec)|F_skeleton(m)|
 <= O(M_dec) exp(-c X^2/(log X)^2)
 = o(1/sigma_E).
```

### Large cold top-label lane

With `sigma_B asymp1/(Z log Z)` and
`M_dec=XZ/(log Z)^2`,

```text
sum_(|m|>M_dec,cold) A_B(m)
 <= C/sigma_B * exp(-c X^2/(log Z)^6)
 = o(1/sigma_E).
```

The prefactor ratio is only polynomial:

```text
(1/sigma_B)/(1/sigma_E) asymp X^2.
```

### Energetic top lane

```text
sum_(Q_B>=F_B) A_B
 <= C exp(-c Z/(log Z)^3)
 = o(1/sigma_E).
```

### Non-decoder fibres

```text
Z_B(exp(Delta)-1)
 <= O(Z log Z) * Z^2 exp(-c Z/(log Z)^3)
 = o(1/sigma_E).
```

Thus for sufficiently large `X`, the sum of these four lanes is at most

```text
c_maj/(8 sigma_E).
```

Together with the Gaussian lane, the total absolute minor contribution is at most

```text
c_maj/(4 sigma_E),
```

strictly below the major lower bound.

## 9. Terminal order and conclusion

The exact order is

```text
1. fix b and the finite forbidden set;
2. fix the compact load interval and Taylor constants;
3. choose C from the Gaussian-tail budget;
4. choose X above one finite maximum of all remaining thresholds.
```

Equivalently, after the fixed problem data,

```text
C -> X.
```

The complete Fourier sum has positive real part.  The weighted congruence
coefficient is positive, and no-wrap converts the congruence to the exact reciprocal
identity.

## 10. Verdict

The full-top `E_b` strengthening preserves and simplifies the complex major arc.
The previous fixed-`G` variance comparison is unnecessary.  The direct actual-family
variance gives a uniform positive major lower bound and a strict terminal budget.

Classification:

```text
DIRECT FULL-FAMILY MAJOR ARC PROVED AT ARGUMENT LEVEL /
FULL E_b CUBIC REMAINDER NEGLIGIBLE /
TERMINAL ORDER C -> X CLOSED /
NOT INDEPENDENTLY REVIEWED.
```
