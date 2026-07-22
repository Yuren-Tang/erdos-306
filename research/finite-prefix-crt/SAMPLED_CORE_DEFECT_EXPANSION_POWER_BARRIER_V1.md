# A square-root power barrier for sampled-core defect expansion

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-STCP-BARRIER-01`  
**Status:** `ARGUMENT / CONDITIONAL METHOD-CLASS BARRIER / NOT A PROBLEM LOWER BOUND`  
**Date:** 2026-07-23

## 1. Scope

The square-root GFF candidate

```text
gamma_N << p_N^(-1/2)(log p_N)^(7/2)
```

comes from a target-adaptive prime core and decoder-defect expansion.  This note
separates the power `1/2` from the disposable logarithmic exponents.

The conclusion is deliberately conditional.  It applies to proofs with all of the
following features:

1. the Fourier damping constant is linear in a small target parameter `q`;
2. every outside CRT row is suppressed by an absolute-value one-fibre estimate;
3. the row certificate uses a finite common core of bounded-energy phase
   coordinates;
4. the core quotient is bounded by explicit enumeration of its residue
   assignments;
5. off-diagonal core assignments are killed only by a deterministic witness floor
   of size `Z^(1+o(1))` before multiplication by the kernel coefficient.

It is not a lower bound for the Gap-Free Floor problem and does not cover
oscillatory cancellation, joint decoding, adaptive quotient-dependent sensors, or
non-enumerative synchronization.

## 2. A degree lower bound forced by the weak kernel

Let a row use `M` core phase coordinates.  Every squared circle distance is at
most `1/4`, so its unweighted row code distance satisfies

```text
D<=M/4.
```

For a Bernoulli parameter `theta asymp q`, the absolute kernel bound has exponent

```text
exp(-c q D).
```

To sum sibling errors over polynomially many rows and residues, the proof needs

```text
qD>=A log Z
```

for some sufficiently large fixed `A`.  Hence necessarily

```text
M>=4D>>log Z/q.
```

This implication is independent of how the core columns are selected.  It is the
small-parameter version of the prefix-bounded row-degree obstruction.

## 3. Explicit core enumeration costs at least the square-root balance

A core of `M` prime coordinates below `Z` has at most

```text
Z^M
```

residue assignments.  A proof which controls the quotient by this explicit count
pays logarithmic complexity

```text
H_core=M log Z.
```

Using the degree requirement above, its implemented entropy budget satisfies

```text
H_core>> (log Z)^2/q.
```

Suppose the deterministic synchronization theorem supplies an unweighted
witness floor

```text
F_Z=Z^(1+o(1)).
```

The weak Bernoulli kernel turns this into weighted damping

```text
qF_Z.
```

For the explicit entropy-versus-floor estimate to close, one must have

```text
qF_Z>>H_core.
```

Therefore

```text
q^2 Z^(1+o(1))>>(log Z)^2,
```

and in particular

```text
q>=Z^(-1/2-o(1)).
```

### Theorem 3.1 — conditional square-root power barrier

No proof satisfying the five hypotheses in Section 1 can reach a floor

```text
q=Z^(-alpha+o(1))
```

with `alpha>1/2`.

The theorem is a barrier for the proof architecture, not for the arithmetic
problem.

## 4. Concrete logarithmic balance

Suppose the available full-population row mean is

```text
mu_Z>>(log Z)^(-b),
```

and simultaneous concentration over polynomially many tests is obtained by a
common sample.  To achieve unweighted distance `D~log Z/q`, the natural sample
size is

```text
M~(log Z)^(b+1)/q.
```

The explicit core entropy is then

```text
H_core~(log Z)^(b+2)/q.
```

If the deterministic witness floor is

```text
F_Z~Z/(log Z)^a,
```

then the absolute Gibbs balance is

```text
qF_Z>>H_core,
```

equivalently

```text
q^2 Z>>(log Z)^(a+b+2).
```

For the current route,

```text
a=3,
b=2,
```

which gives

```text
q^2Z>>(log Z)^7
```

and hence

```text
q>>Z^(-1/2)(log Z)^(7/2).
```

## 5. What can improve without changing the power

The logarithmic exponent can improve in at least two ways.

1. **Better top-scale reciprocal dispersion.**  If the worst-test population mean
   could be improved from `1/(log Z)^2` to a constant, then `b=0` and the same
   witness theorem would give
   ```text
   q^2Z>>(log Z)^5.
   ```
2. **Stronger deterministic synchronization floor.**  Replacing
   `Z/(log Z)^3` by `Z/(log Z)^a` with smaller `a` improves the logarithmic
   exponent by the same amount.

Neither change alters the power `1/2` while the core size is proportional to
`1/q` and the core assignments are explicitly enumerated.

## 6. Genuine routes past the square-root power

To obtain `q=Z^(-alpha+o(1))` with `alpha>1/2`, at least one of the following must
replace the present mechanism.

1. **Non-enumerative core synchronization.**  Bound the core Gibbs partition by
   an internal entropy theorem, polymer expansion, or arithmetic spectral gap
   whose cost is sublinear in `M log Z`.
2. **Joint low-coordinate decoding.**  Avoid demanding polynomial suppression
   independently in every row, so that a core of size `Omega(log Z/q)` is no
   longer forced.
3. **Oscillatory cancellation.**  Use complex cancellation rather than absolute
   Gibbs weights, allowing suppression stronger than `exp(-cqD)`.
4. **Target-dependent weighted interactions.**  Use kernels or multiplicities
   whose effective energy per core coordinate grows as `q` decreases without
   violating the reciprocal-load budget.
5. **Adaptive sensors depending on the quotient assignment.**  This leaves the
   common-core model and requires a different summation order.
6. **A witness mechanism with superlinear small-parameter damping.**  The present
   Bernoulli modulus is intrinsically linear in `q`; a different probabilistic or
   Fourier model would be needed.

## 7. Relation to prefix load--distance optimality

The existing prefix-bounded theorem gives, for worst-row distance `D_*`,

```text
Lambda_sensor>=4H_1(R)D_*/Z,
W2_sensor>=4H_2(R)D_*/Z^2.
```

At small parameter `q`, effective distance requires `D_*>>log Z/q`.  Thus the
same `1/q` cost appears in reciprocal and inverse-square sensor budgets as well as
in the core degree.  Sparse placement or multiscale placement alone cannot remove
it.

The barrier is therefore compatible with, and conceptually supported by, the
previous load--distance theory.

## 8. Disposition

Established:

```text
SQUARE-ROOT POWER BARRIER FOR THE EXPLICIT SAMPLED-CORE / ABSOLUTE-GIBBS METHOD.
```

Not established:

```text
A LOWER BOUND FOR GAP-FREE FLOOR,
OPTIMALITY OF THE (log Z)^(7/2) FACTOR,
IMPOSSIBILITY OF CANCELLATION OR JOINT-DECODING ROUTES.
```

Current frontier:

- improve the logarithmic factor by strengthening top-scale reciprocal
  dispersion or the witness floor;
- or seek a genuinely non-enumerative / cancellation-based mechanism to cross
  the power `1/2` barrier.

No proof-development, manuscript, Curator, review, Lean, release, DOI, arXiv, or
canonical status changes through this note.
