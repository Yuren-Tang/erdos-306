# Erdős 307: bilateral terminal ports and anti-inheritance

**Programme:** `E306-RL-ADJ-04`  
**Status:** `NEW THEOREMS / COMPUTATIONAL PROBE / OPEN CONSTRUCTION FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Motivation

The arithmetic-derivative reformulation of E307 is

```text
D(x)=y,
D(y)=x
```

for coprime squarefree integers `x,y>1`.

Recent work on E313/primary pseudoperfect numbers uses one-sided residual ports

```text
Delta_(R,c)(B)=cB-RD(B)
```

and a composition law to grow solutions.  E307 invites a bilateral analogue, but the
period-two equation behaves in the opposite way: genuine cycles cannot be inherited by
multiplying new factors.

This note proves that obstruction and derives the exact one-prime-per-side terminal
completion formula for unfinished prefixes.

## 2. Bilateral completion equations

Fix coprime squarefree prefixes `x,y`.  Let `A,B` be squarefree positive integers coprime to
`xy` and to each other.  The enlarged pair

```text
X=xA,
Y=yB
```

is an arithmetic-derivative two-cycle precisely when

```text
A D(x)+x D(A)=yB,                         (2.1)
B D(y)+y D(B)=xA.                         (2.2)
```

These are the bilateral filling equations.  Unlike a one-sided port, each filler changes the
target of the other equation.

Define the bilateral defect vector

```text
Delta_(x,y)(A,B)
 =(
    yB-A D(x)-xD(A),
    xA-B D(y)-yD(B)
  ).
```

Then `(A,B)` fills the prefix pair `(x,y)` exactly when this vector is `(0,0)`.

## 3. Anti-inheritance theorem

### Theorem 3.1 — a genuine cycle has no nontrivial multiplicative extension

Suppose

```text
D(x)=y,
D(y)=x
```

with `x,y>1`.  If positive integers `A,B` satisfy

```text
D(xA)=yB,
D(yB)=xA,
```

then

```text
A=B=1.
```

### Proof

Using the product rule and the base cycle,

```text
D(xA)=A D(x)+xD(A)=Ay+xD(A)=yB.
```

Hence

```text
y(B-A)=xD(A)>=0,
```

so `B>=A`.

Similarly,

```text
D(yB)=Bx+yD(B)=xA,
```

and therefore

```text
x(A-B)=yD(B)>=0,
```

so `A>=B`.

Thus `A=B`.  Both displayed equalities then force

```text
D(A)=D(B)=0.
```

The only positive integer with zero arithmetic derivative is `1`; hence `A=B=1`. `square`

### Consequence

E307 is structurally opposite to E313.

```text
E313 primary-pseudoperfect solutions:
  admit inheritance and block extensions.

E307 derivative two-cycles:
  are globally multiplicatively primitive.
```

Any E307 construction must create the whole coupled cycle rather than grow it from a smaller
cycle.

## 4. One-prime-per-side terminal completion

Take unfinished coprime squarefree prefixes `x,y` and seek new primes `p,q` such that

```text
D(xp)=yq,
D(yq)=xp.
```

The product rule gives the linear system

```text
D(x)p-yq=-x,
xp-D(y)q=y.
```

Put

```text
Delta=xy-D(x)D(y)
     =xy(1-(D(x)/x)(D(y)/y)).
```

### Theorem 4.1 — unique terminal-prime formula

If `Delta!=0`, the unique rational solution is

```text
p=(xD(y)+y^2)/Delta,
q=(yD(x)+x^2)/Delta.
```

Hence the prefix pair can be completed by one prime on each side if and only if:

1. `Delta>0`;
2. both displayed rational numbers are integers;
3. they are distinct primes;
4. neither divides `xy`;
5. the resulting prime sets remain disjoint.

### Proof

Apply Cramer's rule to the two linear equations.  Both numerators are positive, so positive
solutions require `Delta>0`.  The remaining conditions are exactly the squarefree and
coprimality requirements. `square`

### Degenerate case

If `Delta=0`, then

```text
D(x)D(y)=xy.
```

For coprime squarefree `x,y`, the same reduced-denominator argument as in the E307 two-cycle
theorem forces

```text
D(x)=y,
D(y)=x.
```

Thus the prefix is already a genuine cycle, and Theorem 3.1 forbids any nontrivial extension.

## 5. Interpretation as a bilateral terminal port

The scalar quantity

```text
Delta=xy-D(x)D(y)
```

measures the deficit of the product of reciprocal logarithmic derivatives from one:

```text
Delta/(xy)
 =1-(sum_(p|x)1/p)(sum_(q|y)1/q).
```

The terminal formulas can therefore be read as:

```text
missing prime on one side
 = explicit affine numerator / reciprocal-product deficit.
```

This is the two-sided analogue of terminal-prime formulas in primary-pseudoperfect port
searches.  The essential difference is that the two unknown primes are coupled through one
shared deficit.

## 6. Computational probe

A Wolfram-language search used the first ten primes

```text
2,3,5,7,11,13,17,19,23,29
```

and all disjoint prefix sets of sizes `1` through `4`.  Among `33360` ordered prefix pairs
with `Delta>0`:

- no pair produced two integers `p,q>1`;
- hence no pair produced a prime terminal completion;
- the only exact integer rational solutions were degenerate cases with one completion equal
  to `1`;
- several nontrivial prefixes gave rational completions very close to integer pairs.

This computation has no exclusion force for E307, since any actual solution is already known
to require at least sixty primes in the union.  Its value is methodological: the bilateral
terminal coordinates create a sharply filtered Diophantine search problem.

## 7. Search architecture suggested by the theorem

A useful search should not enumerate arbitrary pairs of prime sets.  It should build prefixes
with the following state:

```text
x, D(x), y, D(y), Delta,
p*=(xD(y)+y^2)/Delta,
q*=(yD(x)+x^2)/Delta.
```

Rank states by:

1. distance of `p*,q*` to positive integers;
2. congruence divisibility of the two numerators by `Delta`;
3. primality or almost-primality of rounded terminal candidates;
4. reciprocal-product deficit `Delta/(xy)`;
5. squarefree derivative profile;
6. mutual reciprocal-syndrome constraints.

Appending one prime `r` to `x` updates

```text
x -> xr,
D(x) -> rD(x)+x,
```

in constant arithmetic time once factorization data are stored.  The same holds on the `y`
side.  This makes beam search, meet-in-the-middle, and modular pruning natural.

## 8. A possible bilateral-port composition programme

For larger fillers `A,B`, equations (2.1)--(2.2) suggest a two-coordinate residual calculus.
The next algebraic questions are:

1. whether a useful composition law exists for partial fillers `(A_1,B_1)` followed by
   `(A_2,B_2)`;
2. whether terminal two-prime or three-prime blocks admit discriminant criteria analogous to
   E313 ports;
3. whether the anti-inheritance theorem implies a canonical notion of bilateral primitive
   filling;
4. whether reciprocal numerator smoothness can be encoded as local ports rather than global
   factorization.

Unlike E313, a successful formalism must preserve two coupled targets and cannot inherit from
an already closed cycle.

## 9. Relation to current literature

Han Wang's 2026 preprint *Port Fillings for Primary Pseudoperfect Numbers* develops the
one-sided port equation for E313, proves new primary pseudoperfect examples, and records
composition and terminal-prime criteria.  The bilateral formulas above are independently
derived for E307 and are not asserted to appear in that work.

A dedicated novelty audit is required before publication-level claims.

## 10. Classification

```text
BILATERAL DEFECT EQUATIONS — PROVED
ANTI-INHERITANCE OF E307 CYCLES — PROVED
UNIQUE ONE-PRIME-PER-SIDE TERMINAL FORMULA — PROVED
SMALL PREFIX SEARCH — NO NONDEGENERATE INTEGER COMPLETIONS
BILATERAL PORT COMPOSITION / LARGE-BLOCK CONSTRUCTION — OPEN FRONTIER
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, or canonical status
changes through this adjacent-problem theorem.