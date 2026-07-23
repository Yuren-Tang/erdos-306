# Target sensitivity as observability

**Workstream:** `E306-AFT-01`  
**Status:** `GENERAL FINITE-GROUP FORMULATION / PROVED`  
**Purpose:** replace route-specific target-coordinate language by a quantitative
observability provider

## 1. Hidden coordinates

Let `H` be a finite abelian group representing target information which is not
already fixed by the anchor.  Let

```text
psi_j:H->R/Z,  j in J,
```

be characters or character-valued phase maps supplied by a family of Fourier
factors.

Define the syndrome map

```text
Sigma:H->(R/Z)^J,
Sigma(h)=(psi_j(h))_(j in J),
```

and the quadratic observability energy

```text
D(h)=sum_(j in J)||psi_j(h)||^2,
D_*=min_(h!=0)D(h).
```

## 2. Three levels of observability

### Character separation

The family separates points when

```text
for every h!=0, some psi_j(h)!=0.
```

Equivalently, `Sigma` is injective, or the characters `psi_j` generate the full
dual group in the appropriate sense.

### Quantitative observability

The family is quantitatively observable when

```text
D_*>0
```

with an explicit lower bound useful at the application scale.

### Robust code distance

For a shifted fibre, one often needs the stronger statement that any two
candidate hidden coordinates have phase vectors separated by at least `D_*`:

```text
sum_j ||psi_j(h)-psi_j(h')||^2>=D_*
```

for `h!=h'`.  Since the maps are characters, this is exactly the preceding bound
applied to `h-h'`.

Mere injectivity is qualitative.  Fourier compression consumes quantitative
observability.

## 3. Bernoulli-kernel consequence

Suppose a Fourier kernel satisfies

```text
|K(t)|<=exp(-kappa||t||^2)
```

for some `kappa>0`.  Fix an arbitrary shift vector `a_j`.  For hidden coordinate
`h`, define

```text
W(h)=product_j |K(a_j+psi_j(h))|.
```

Let `h_*` minimize the shifted quadratic energy.  The parallelogram/nearest-code
argument gives that at most one `h` can have energy below `D_*/4`.  Consequently

```text
sum_(h!=h_*)W(h)
 <=(|H|-1)exp(-kappa D_*/4).
```

The estimate is uniform in the shift.

Thus quantitative observability is exactly a hidden-coordinate row-code
provider for the weighted decoded-skeleton theorem.

## 4. Observability, injectivity, and syndrome language

The full-top target rows in an arithmetic application can be described in three
equivalent qualitative ways:

1. their characters separate hidden coordinates;
2. the syndrome map is injective;
3. no nonzero hidden coordinate lies in the common kernel.

For asymptotic compression, the correct statement is stronger:

4. the syndrome image has a quantitative squared distance `D_*`.

Hence the most honest terminology is

```text
quantitative coordinate observability
```

or, when coding language is useful,

```text
syndrome-map code distance.
```

## 5. Product target groups

Suppose

```text
H=product_(i in I)H_i.
```

A coordinatewise sensor family may be divided into `J_i`, with `psi_j` depending
only on `H_i`.  If

```text
D_i^*=min_(h_i!=0)sum_(j in J_i)||psi_j(h_i)||^2,
```

then the full product distance satisfies

```text
D_*>=min_i D_i^*.
```

If a difference is nonzero in several coordinates, its energy is the sum of the
corresponding coordinate energies.

This is the natural abstract form of assigning a disjoint sensor row to every
prime target coordinate.

## 6. Squarefree denominators as one application

Let `b` be squarefree.  The Chinese remainder theorem gives

```text
Z/bZ isomorphic to product_(r|b, r prime) Z/rZ.
```

For a fixed prime `r|b`, let top sensor indices be units `q mod r` and use
characters

```text
psi_q(d)=d q^(-1)/r mod 1.
```

For every nonzero `d mod r`, each `d q^(-1)` is nonzero.  Therefore

```text
||d q^(-1)/r||>=1/r
```

and

```text
D_r(d)
 =sum_q ||d q^(-1)/r||^2
 >=|J_r|/r^2.
```

Thus ordinary sensor supply already gives quantitative coordinate
observability.  No equidistribution in residue classes is required for fixed
`r`.

The squarefree target family therefore implements more than injectivity: it
provides a code distance growing linearly with the number of sensors.

## 7. Why nonsquarefree rational targets fail for squarefree atoms

Suppose every available atom has squarefree denominator.  The least common
multiple of any finite set of atom denominators is squarefree.  Therefore the
reduced denominator of their sum is squarefree.

In group language, consider a target factor `Z/p^2Z`.  Squarefree-denominator
atoms can supply at most characters factoring through reduction

```text
Z/p^2Z -> Z/pZ.
```

The subgroup

```text
p Z/p^2Z
```

lies in the common kernel.  The syndrome map is not injective, so `D_*=0`.
Quantitative observability fails before any analytic estimate is considered.

This is the finite-group shadow of the elementary denominator obstruction.

## 8. General finite abelian target factors

Write a finite abelian target group in invariant-factor form

```text
H isomorphic to product_i Z/n_iZ.
```

A sensor family is sufficient for exact target sensitivity if:

1. its characters generate the full dual group `Hhat`;
2. the resulting quadratic energy has a usable lower bound `D_*`;
3. decoder identification is uniform over the coherent anchor range;
4. all target factors are represented in the finite Fourier modulus or in a
   retained exact residual character.

For a `p^a` factor, characters sensitive only modulo `p^(a-1)` leave a nonzero
kernel and are insufficient.  The available atom family must support the full
exponent.

## 9. Observability versus exact target centering

Observability distinguishes target coordinates.  It does not by itself center
the major phase.  A separate identity, typically

```text
expected atom sum=target,
```

is needed to cancel the linear Fourier term.

Conversely, exact centering does not imply observability: an expectation may
match a hidden target coordinate while every atom remains trapped in a proper
subgroup.  The two providers must be recorded separately.

## 10. Observability failure and Fourier cancellation

Let

```text
K=intersection_(j in J) ker psi_j.
```

If `K` is nontrivial, frequencies differing by an annihilator character of the
observed quotient cannot be distinguished by the sensor factors.  For a target
outside the observed coset, the omitted hidden characters may cancel the
entire visible major contribution.

Thus the hidden-coordinate counterexample in
`PROVIDER-HYPOTHESES-AND-FAILURE-MODES.md` is not accidental: it is the general
failure mode `K!=0`.

## 11. Provider interface

A target-sensitivity provider should expose exactly:

```text
hidden group H;
sensor characters psi_j;
syndrome map Sigma;
qualitative kernel ker Sigma;
quantitative distance D_*;
row sibling bound (|H|-1)exp(-kappa D_*/4);
coherent-range decoder identification;
major-phase centering identity.
```

This interface is independent of whether the sensors come from primes,
semiprimes, matrix entries, code checks, or another arithmetic family.

## 12. Classification

```text
TARGET SENSITIVITY = QUANTITATIVE OBSERVABILITY — PROVED FORMULATION
SYNDROME INJECTIVITY / CHARACTER SEPARATION — QUALITATIVE LEVEL
CODE DISTANCE D_* — REQUIRED QUANTITATIVE LEVEL
SQUAREFREE-b ROWS — APPLICATION WITH ELEMENTARY DISTANCE
NONSQUAREFREE OBSTRUCTION — COMMON-KERNEL FAILURE
GENERAL FINITE-ABELIAN EXTENSION — PRECISE PROVIDER CONDITIONS.
```
