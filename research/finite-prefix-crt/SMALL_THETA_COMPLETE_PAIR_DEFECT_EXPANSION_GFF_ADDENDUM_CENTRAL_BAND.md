# Square-root GFF route — central-band overlap correction

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-STCP-01-A1`  
**Status:** `CONTROLLING CORRECTION / ARGUMENT / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-23

## 1. Correction

The base note

`SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_V1.md`

correctly derives the lower-band scale

```text
q_0(Z)=C Z^(-1/2)(log Z)^(7/2)
```

for every fixed power exponent `tau in (4/3,2)`.  Its stated bridge from that
lower-band theorem to the full Gap-Free Floor bound, however, needs an additional
load-overlap condition.

Li's Theorem 7.4 supplies the uniform central-band threshold

```text
gamma_* =0.181... <1/5.
```

To overlap that band, the complete-pair reciprocal load must exceed some fixed
`q_*>gamma_*`.  Since

```text
lambda_tau=(log tau)^2/2,
```

this is not true for every `tau in (4/3,2)`.  For example `tau=3/2` gives only
about `0.082`.

The corrected GFF consequence therefore requires

```text
lambda_tau>gamma_*,
```

equivalently

```text
tau>tau_CB:=exp(sqrt(2 gamma_*)).
```

Numerically `tau_CB` is about `1.825`.  One may take, for example,

```text
tau=1.95,
```

for which `lambda_tau` is about `0.223`.

## 2. Correct fixed constants

Choose constants in the following order.

1. Fix
   ```text
   tau in (tau_CB,2).
   ```
2. Choose
   ```text
   gamma_*<q_*<lambda_tau.
   ```
   For `tau=1.95`, one may take `q_*=0.19` after leaving ordinary asymptotic
   margins.
3. Choose load bounds
   ```text
   q_*<lambda_-<lambda_tau<lambda_+<1.
   ```
4. For large `Z`, the actual total load satisfies
   ```text
   lambda_-<Lambda<lambda_+.
   ```
5. For `q<=q_*`,
   ```text
   theta=q/Lambda<=q_*/lambda_-=:theta_*<1.
   ```

Consequently

```text
theta(1-theta)>=c_* q
```

uniformly throughout the whole lower band, including its fixed upper endpoint.

## 3. Analytic scales are unchanged

The two structural interval conditions remain

```text
4/3<tau<2.
```

The stronger lower bound `tau>tau_CB` automatically implies `tau>4/3`.

- `tau<2` gives `Y^2>Z`, so every complete-pair denominator is above the prefix
  alias scale.
- `tau>4/3` gives, at the square-root floor,
  ```text
  V^(-1/2)=o(Z/log Z)
  ```
  and makes the complete-pair square load dominate the sparse lower-sensor square
  load.

Thus moving `tau` close to `2` does not change the exponent or logarithmic power.

## 4. Taylor expansion on the full lower band

The phrase “small-parameter route” refers to the difficult lower endpoint
`q=q_0(Z)`, where `theta tends to zero`.  At the fixed upper endpoint, `theta` may
be a moderate constant, but it remains below `theta_*<1`.

On a fixed small phase disk, uniformly for `0<=theta<=theta_*`,

```text
log(1-theta+theta e(z))
 =2pi i theta z
  -2pi^2theta(1-theta)z^2
  +O_(theta_*)(theta |z|^3).
```

Hence the cumulant calculation in the base note remains uniform from `q_0(Z)` to
`q_*`.  No separate compact-parameter proof is required, although splitting the
range into small and moderate `theta` would also be valid.

## 5. Exactness may use no-wrap directly

For the corrected choice of constants,

```text
Lambda<lambda_+<1,
0<=q<=q_*<1.
```

Every random subset sum lies in `[0,Lambda]`.  Therefore a congruence modulo the
primorial already implies exact equality: both the target and every subset sum lie
in one fundamental interval.

The large-deviation alias estimate in the base note remains true, but is not
needed.  The preferred exactness argument is the same no-wrap transfer used in the
adversarially corrected earlier GFF route.

## 6. Correct theorem split

### Lower-band theorem

For every fixed

```text
4/3<tau<2,
```

the complete-pair defect-expansion argument gives exact coverage of grid targets

```text
q in [C Z^(-1/2)(log Z)^(7/2), q_*]
```

for every fixed `q_*<lambda_tau`, subject to the proof-development obligations in
the base note.

### Full GFF consequence

To infer the full Gap-Free Floor bound through Li's central band, additionally
require

```text
tau in (tau_CB,2)
and
gamma_*<q_*<lambda_tau.
```

Then the lower band overlaps the known central band.  Complement symmetry gives
coverage on the opposite side, and the same exact all-prefix setup yields the
candidate

```text
gamma_N<<p_N^(-1/2)(log p_N)^(7/2).
```

No dyadic recurrence is needed in this route because the construction is made
directly at every prime prefix.

## 7. Disposition

The correction changes:

```text
“any tau in (4/3,2) gives the full GFF consequence”
```

to

```text
“any tau in (4/3,2) gives the lower-band theorem;
 tau in (exp(sqrt(2 gamma_*)),2) gives central-band overlap and the full GFF
 consequence.”
```

It does **not** change:

- the square-root exponent `1/2`;
- the logarithmic power `7/2`;
- the sparse-core size `O((log Z)^3/q)`;
- the decoder-defect synchronization balance;
- the variance, major-width, or outer-label estimates.

Current classification:

```text
CENTRAL-BAND GAP FOUND AND REPAIRED /
SQUARE-ROOT GFF CANDIDATE SURVIVES /
NOT INDEPENDENTLY REVIEWED.
```
