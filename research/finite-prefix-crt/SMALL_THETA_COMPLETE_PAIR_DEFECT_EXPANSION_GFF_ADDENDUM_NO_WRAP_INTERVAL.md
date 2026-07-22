# Square-root GFF route — no-wrap power-interval extension

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-STCP-01-A2`  
**Status:** `CONTROLLING CORRECTION AND STRENGTHENING / ARGUMENT / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-23

## 1. The obsolete upper restriction

The base square-root note imposed

```text
4/3<tau<2
```

for the power interval

```text
Y=Z^(1/tau),
P={p prime:Y<=p<=Z}.
```

The upper restriction `tau<2` was used to ensure `Y^2>Z`, so every pair
denominator exceeded the prefix alias scale.

That is unnecessary.  The total reciprocal load is strictly below one, so every
subset sum and every target lie in a single fundamental interval.  Congruence
modulo the primorial therefore implies exact equality directly by no-wrap.  No
lower bound `pq>=Z` is required.

This addendum recomputes the genuine interval restrictions.

## 2. Load and no-wrap

The complete-pair load tends to

```text
lambda_tau=(log tau)^2/2.
```

For every fixed `tau<=4`,

```text
lambda_tau<=lambda_4=(log 4)^2/2<1.
```

The target-adaptive lower-sensor load is `o(1)` uniformly at and above the
square-root floor.  Hence one may fix

```text
lambda_tau<lambda_+<1
```

and obtain `Lambda<lambda_+` for large `Z`.

Thus no-wrap is valid throughout the enlarged interval.

## 3. Major width versus the reciprocal-label threshold

At

```text
q_0(Z)=C Z^(-1/2)(log Z)^(7/2),
```

the complete-pair variance satisfies

```text
V asymp q/(Y^2(log Y)^2).
```

Therefore

```text
V^(-1/2)
asymp Y log Y/sqrt(q)
asymp Z^(1/tau+1/4)(log Z)^(-3/4).
```

The Gaussian main arc and full-variance tail must fit below `Z/log Z`, where all
lower CRT coordinates decode to the same integer label.  The ratio is

```text
V^(-1/2)/(Z/log Z)
asymp Z^(1/tau-3/4)(log Z)^(1/4).
```

It tends to zero exactly when

```text
tau>4/3.
```

This is the genuine lower endpoint.

## 4. Taylor phase and cubic remainder

The smallest complete-pair denominator is of order `Y^2`.  At the major width,

```text
V^(-1/2)/Y^2
asymp log Y/(Y sqrt(q))
asymp Z^(1/4-1/tau)(log Z)^(-3/4).
```

This tends to zero for

```text
tau<=4.
```

At the endpoint `tau=4` the power is zero but the logarithmic factor still tends
to zero.

The aggregate small-parameter cubic ratio has the same order:

```text
W3_pair/(sqrt(theta) W2_pair^(3/2))
<<log Y/(Y sqrt(q))
=o(1)
```

for every fixed `tau<=4`.

For `tau>4`, the ratio grows by a positive power of `Z`; the present Taylor
assembly no longer closes at the square-root floor.  Thus `tau=4` is the natural
upper endpoint for this proof.

## 5. Lower-sensor variance

The target-adaptive core has

```text
|S|<< (log Z)^3/q.
```

The lower-sensor square load is

```text
W2_low<<|S|/Z^2.
```

Relative to the complete-pair square load,

```text
W2_low/W2_pair
<< |S|Y^2(log Y)^2/Z^2.
```

At `q=q_0(Z)` this is

```text
<<Z^(-3/2+2/tau)(log Z)^(3/2),
```

which tends to zero precisely when `tau>4/3`.  Thus the same lower endpoint also
ensures that the mass family, not the sensor family, controls the variance.

The cubic lower-sensor comparison is weaker and follows on the same interval.

## 6. Correct interval statements

### Lower-band realization

The square-root lower-band argument closes for every fixed

```text
4/3<tau<=4.
```

The earlier restriction `tau<2` is withdrawn.

### Full GFF consequence

Let

```text
gamma_*=0.181...,
tau_CB=exp(sqrt(2 gamma_*)).
```

Central-band overlap requires `lambda_tau>gamma_*`, equivalently
`tau>tau_CB`.  Hence the full GFF consequence is available throughout

```text
tau_CB<tau<=4.
```

Choose any fixed

```text
gamma_*<q_*<lambda_tau<1.
```

For example, `tau=2` already gives

```text
lambda_2=(log 2)^2/2 approximately 0.240>gamma_*,
```

while `tau=4` gives a larger load margin and still satisfies every Taylor and
variance condition.

## 7. Consequences

The extension does not change:

- the core size `O((log Z)^3/q)`;
- the synchronization balance `q^2Z>>(log Z)^7`;
- the square-root exponent `1/2`;
- the logarithmic power `7/2`;
- the reciprocal-label outer lane;
- the direct all-prefix nature of the construction.

It removes an unnecessary alias-derived restriction and makes the analytic
parameter region substantially more robust.

Current controlling interval:

```text
LOWER BAND: 4/3<tau<=4
FULL GFF:    exp(sqrt(2 gamma_*))<tau<=4.
```

Classification:

```text
NO-WRAP INTERVAL EXTENSION — PROVED ARGUMENT
SQUARE-ROOT GFF CANDIDATE STRENGTHENED
NOT INDEPENDENTLY REVIEWED.
```

No proof-development, manuscript, Curator, review, Lean, release, DOI, arXiv, or
canonical status changes through this addendum.
