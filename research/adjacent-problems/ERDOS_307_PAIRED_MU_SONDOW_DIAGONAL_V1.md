# Erdős 307 as a primitive paired `mu`-Sondow diagonal

**Programme:** `E306-RL-ADJ-14`  
**Status:** `EXACT EXISTING-THEORY INTERFACE / PRIMITIVE DIAGONAL FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose and literature boundary

Grau, Oller-Marcén, and Sadornil define a `mu`-Sondow number `n` by any of several equivalent
conditions, including

```text
mu/n+sum_(p|n)1/p is an integer
```

and the prime-power congruences

```text
p^s | n/p+mu for every p^s exactly dividing n.
```

The cases `mu=-1` and `mu=1` contain Giuga and weak primary pseudoperfect numbers,
respectively.  This note identifies the exact subproblem selected by E307.  It is much more
rigid than membership in one `mu`-Sondow set.

## 2. Sondow quotient

For squarefree `n` and an integer `mu`, define

```text
A_mu(n)={D(n)+mu}/n.                            (2.1)
```

Then `n` is `mu`-Sondow precisely when `A_mu(n)` is an integer.  The **quotient-one locus** is

```text
A_mu(n)=1,
```

or

```text
D(n)=n-mu.                                     (2.2)
```

Primary pseudoperfect numbers lie on the quotient-one `mu=1` locus.  The equation
`D(n)=n+1` lies on the quotient-one `mu=-1` locus.

## 3. Exact paired-diagonal theorem

Let `x<y` be coprime squarefree integers and put

```text
h=y-x>0.                                       (3.1)
```

### Theorem 3.1

The following are equivalent.

1. `x,y` form an E307 arithmetic-derivative cycle:
   ```text
   D(x)=y,
   D(y)=x.
   ```
2. `x` and `y` lie on paired quotient-one Sondow loci:
   ```text
   A_(-h)(x)=1,
   A_h(y)=1,
   y-x=h.
   ```
3. The derivative defects are equal and opposite:
   ```text
   D(x)-x=h,
   D(y)-y=-h.
   ```

#### Proof

All statements are direct rewritings using `y=x+h`. `square`

Hence E307 is the diagonal problem

```text
x in S_(-h) at quotient one,
x+h in S_h at quotient one.                   (3.2)
```

The parameter `h` is not external: it is exactly the additive gap between the two numbers.

## 4. Parameter coprimality

### Proposition 4.1

Every E307 paired state satisfies

```text
gcd(x,h)=gcd(y,h)=1.                           (4.1)
```

#### Proof

Since `h=y-x`,

```text
gcd(x,h)=gcd(x,y),
gcd(y,h)=gcd(y,x).
```

The E307 reduced-denominator theorem gives `gcd(x,y)=1`. `square`

Thus E307 uses `mu`-Sondow numbers coprime to their parameter.  This excludes the elementary
scaled constructions in which the parameter `mu` is inserted as a factor of the constructed
number.

### Consequence

For `h>1`, constructions of `h`-Sondow numbers of the form

```text
h*n
```

cannot directly supply the E307 right side, because they share a nontrivial factor with `h`
and generally fail squarefreeness under the standard radical-divisibility construction.
The same warning applies to negative-parameter constructions derived by multiplying Giuga
numbers by `|h|`.

This does not make the existing `mu`-Sondow theory irrelevant; it identifies the exact primitive
subclass which must be studied.

## 5. Prime-factor congruences

Because `x,y` are squarefree, the quotient-one equations are equivalent to local congruences.

### Theorem 5.1 — paired Sondow congruence system

For every prime `p|x`,

```text
p | x/p-h.                                     (5.1)
```

For every prime `q|y`,

```text
q | y/q+h.                                     (5.2)
```

#### Proof

Reduce `D(x)=x+h` modulo `p`.  In the squarefree derivative sum, the unique term not divisible
by `p` is `x/p`, giving

```text
x/p congruent h mod p.
```

The second equation is symmetric. `square`

Since `h` is invertible modulo every prime factor, these can be normalized as

```text
(x/p)h^(-1) congruent 1 mod p,
(y/q)h^(-1) congruent -1 mod q.                (5.3)
```

This is a paired positive/negative Znám-type system.

## 6. Relation with mutual reciprocal syndromes

The E307 two-set formulation gives

```text
sum_(p|x)p^(-1)=0 mod q for every q|y,
sum_(q|y)q^(-1)=0 mod p for every p|x.         (6.1)
```

The Sondow congruences `(5.1)--(5.2)` are self-side conditions, while `(6.1)` is cross-side
observability.  A complete construction must satisfy both layers:

```text
SELF-SIDE:
  each prime sees the gap h with the correct sign;

CROSS-SIDE:
  each opposite prime annihilates the full reciprocal syndrome.
```

Neither layer alone implies the cycle.

## 7. Consecutive case

For `h=1`, Theorem 3.1 becomes

```text
x in S_(-1) at quotient one,
x+1 in S_1 at quotient one.                   (7.1)
```

Thus the consecutive Giuga/primary-pseudoperfect bridge is the first member of the full paired
`+-h` diagonal family.

For general `h`, one may regard E307 as asking whether two opposite generalized Giuga defects
can occur at exactly the parameter separation which they encode.

## 8. Parity sectors

The parameter-coprime diagonal has three parity sectors.

1. If `2|x`, then `y` and `h` are odd; the odd side `y` has an even number of prime factors.
2. If `2|y`, then `x` and `h` are odd; the odd side `x` has an even number of prime factors.
3. If both `x,y` are odd, then `h` is even and both sides have an odd number of prime factors.

These are the earlier E307 parity laws expressed in the gap coordinate.

## 9. Why known one-sided existence conjectures are insufficient

Even a theorem asserting that nontrivial `mu`-Sondow numbers exist for every parameter `mu`
would not solve E307.  One needs simultaneously:

```text
one quotient-one (-h)-Sondow number x,
one quotient-one h-Sondow number y,
y-x=h,
gcd(xy,h)=1,
squarefreeness and cross-syndrome closure.
```

The paired diagonal condition is therefore a genuine two-object correlation problem, not the
union of two one-sided existence questions.

## 10. New research interfaces

The existing `mu`-Sondow framework contributes:

1. prime-power divisibility characterizations;
2. Bernoulli-number and power-sum congruences;
3. known constructions and parameter reductions;
4. data for fixed positive and negative parameters.

For E307, the highest-value questions are:

1. classify quotient-one, parameter-coprime elements of `S_mu`;
2. obtain lower bounds or congruence restrictions uniform in moving `mu=h`;
3. understand correlations between `S_(-h)` and the translate `S_h-h`;
4. combine self-side Sondow congruences with cross-side reciprocal syndromes;
5. seek a monotone or entropy invariant forbidding paired diagonal points, or a port mechanism
   constructing one.

## 11. Classification

```text
E307 <=> PAIRED QUOTIENT-ONE (+-h)-SONDOW DIAGONAL — PROVED
PARAMETER COPRIMALITY — PROVED
PAIRED PRIME-FACTOR CONGRUENCE SYSTEM — PROVED
SCALED MU-SONDOW CONSTRUCTIONS EXCLUDED FROM DIRECT USE — PROVED
CONSECUTIVE GIUGA/PPN CASE AS h=1 — PROVED
PAIRED DIAGONAL EXISTENCE — OPEN
E307 PRIME TWO-CYCLE — OPEN
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, or canonical status
changes through this note.
