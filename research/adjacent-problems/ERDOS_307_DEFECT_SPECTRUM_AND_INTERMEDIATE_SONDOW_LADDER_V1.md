# Erdős 307: defect spectrum and the intermediate Sondow ladder

**Programme:** `E306-RL-ADJ-23`  
**Status:** `GENERAL EXACT IDENTITIES / TERMINAL-PORT INTERPRETATION / SEARCH REORGANIZATION`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

For a positive integer `n`, write

```text
delta(n)=n-D(n).
```

The standard core-30 coordinate asks for an odd squarefree integer `N` with

```text
delta(N)=900,
31 exactly divides N,
(N-930)/961 prime.
```

The existing two-prime divisor port factors one norm integer.  This note identifies the factors:
they are precisely the defects of the two possible one-prime intermediate states.  More generally,
every prime factor of a defect-`C` state determines one exact cofactor defect.

This gives a defect spectrum and reorganizes terminal construction as a ladder of quotient-one
Sondow states.

## 2. One-prime deletion formula

Let `N` be squarefree and suppose

```text
delta(N)=C>0.                                      (2.1)
```

For a prime `p|N`, put

```text
K_p=N/p,
d_p=delta(K_p).                                   (2.2)
```

### Theorem 2.1 — exact cofactor defect

For every `p|N`,

```text
p d_p=K_p+C,                                       (2.3)
```

and hence

```text
d_p=(K_p+C)/p
   =(N+Cp)/p^2.                                    (2.4)
```

### Proof

By the product rule,

```text
D(N)=D(K_p p)=pD(K_p)+K_p.
```

Since `D(N)=N-C=pK_p-C`,

```text
pD(K_p)+K_p=pK_p-C.
```

Rearranging gives

```text
p{K_p-D(K_p)}=K_p+C,
```

which is `(2.3)`. `square`

### Consequences

1. `p^2|N+Cp` for every `p|N`.  This is the prime-square Korselt condition.
2. Every one-prime cofactor has positive defect:
   ```text
   d_p>0.
   ```
3. The terminal prime is recovered from its cofactor by
   ```text
   p=(K_p+C)/delta(K_p).                            (2.5)
   ```
4. Conversely, if squarefree `K` has positive defect `d`, and
   ```text
   p=(K+C)/d
   ```
   is a new prime, then
   ```text
   delta(Kp)=C.                                    (2.6)
   ```

Thus every final prime of a defect-`C` number is a one-prime terminal port from its complementary
cofactor.

## 3. Normalized defect spectrum

Dividing `(2.4)` by `K_p=N/p` gives

```text
d_p/K_p=1/p+C/N.                                   (3.1)
```

Therefore

### Proposition 3.1 — spectrum mass identity

If `k=omega(N)`, then

```text
sum_(p|N) delta(N/p)/(N/p)
  =1+(k-1)C/N.                                     (3.2)
```

### Proof

Sum `(3.1)` over `p|N` and use

```text
sum_(p|N)1/p=D(N)/N=1-C/N.
```

`square`

The spectrum is nearly a partition of one when `N` is large compared with `C`, but each coordinate
carries the same positive offset `C/N` beyond the reciprocal `1/p`.

## 4. Two-prime deletion and intermediate defects

Let

```text
N=Hqt
```

be squarefree, where `q,t` are distinct new primes.  Put

```text
c=delta(H),
d_q=delta(Hq)=cq-H,
d_t=delta(Ht)=ct-H.                                 (4.1)
```

Assume

```text
delta(N)=C.
```

### Theorem 4.1 — intermediate-defect factorization

One has

```text
d_q d_t=H^2+C c.                                   (4.2)
```

Moreover,

```text
q=(d_q+H)/c,
t=(d_t+H)/c,                                      (4.3)
```

and

```text
d_q t=Hq+C,
d_t q=Ht+C.                                       (4.4)
```

### Proof

The identities `(4.3)` are the definitions in `(4.1)`.  Since appending `t` to `Hq` gives final
defect `C`, the one-prime transition gives

```text
C=t d_q-Hq,
```

which is the first identity in `(4.4)`.  Substitute `(4.3)` to get

```text
d_q(d_t+H)=H(d_q+H)+Cc,
```

and cancel `Hd_q`, proving `(4.2)`.  The second identity is symmetric. `square`

Thus the classical divisor-port factors

```text
cq-H,
ct-H
```

are not formal algebraic factors.  They are exactly the two intermediate defects.

## 5. Defect ladder interpretation

A two-prime terminal closure is a ladder

```text
(H,c)
  --q--> (Hq,d_q)
  --t--> (Hqt,C).                                  (5.1)
```

At each step,

```text
new defect=(new prime)(old defect)-(old product).   (5.2)
```

The first step may be chosen through any divisor

```text
d_q|H^2+Cc,
d_q=-H mod c.                                      (5.3)
```

The second prime is then

```text
t=(Hq+C)/d_q.                                      (5.4)
```

### Special intermediate defects

#### `d_q=1`

Then `Hq` is an odd squarefree defect-one state, and

```text
t=Hq+C.
```

For `C=900`, this route requires an odd primary-pseudoperfect / quotient-one 1-Sondow intermediate
state.  No such large odd state is presently supplied by the known even PPN chains.

#### `d_q=C`

Then `Hq` already has defect `C`, and `(5.4)` would be a one-prime same-defect inheritance.  For
`C>1` this is impossible: defect coprimality gives `gcd(Hq,C)=1`, whereas

```text
C t=Hq+C
```

would force `C|Hq`.

Thus the target divisor `C` is automatically excluded from every genuine terminal factorization.

#### General `d_q`

The intermediate integer `Hq` is a squarefree quotient-one `d_q`-Sondow number:

```text
Hq-D(Hq)=d_q,
gcd(Hq,d_q)=1.                                    (5.5)
```

The terminal prime condition is exactly

```text
d_q|(Hq+C),
(Hq+C)/d_q prime.                                  (5.6)
```

## 6. Parity ladder for defect 900

Suppose `N` is odd, squarefree, has odd support, and

```text
delta(N)=900.
```

Remove one prime `t`.  The cofactor `K=N/t` has even support.  Since every derivative summand of an
odd squarefree number is odd,

```text
delta(K) is odd.                                   (6.1)
```

Remove a second prime `q`, leaving odd-support `H`; then

```text
delta(H) is even.                                  (6.2)
```

Hence every minimal-support two-prime closure has the parity pattern

```text
even partial defect
  --odd prime--> odd intermediate defect
  --odd prime--> even target 900.                  (6.3)
```

This is why only odd divisor factors occur in the terminal norm

```text
H^2+900 delta(H).
```

## 7. The distinguished factor 31

Let `N=31Y` satisfy

```text
delta(N)=900.
```

Applying Theorem 2.1 to `p=31` gives

```text
31 delta(Y)=Y+900.                                  (7.1)
```

Put

```text
d=delta(Y).
```

Then

```text
Y=31d-900,
D(Y)=Y-d=30(d-30).                                 (7.2)
```

The core-30 E307 output is

```text
r=d-30.                                             (7.3)
```

Therefore a defect-900 state with distinguished factor `31` yields an E307 cycle exactly when

```text
delta(N/31)-30
```

is a prime disjoint from `N`.

This is equivalent to the affine formula `(N-930)/961`, but exposes the output prime as a shifted
cofactor defect.

## 8. Why small OEIS Sondow terms do not solve the construction

The OEIS and the `mu`-Sondow literature list many small `mu`-Sondow numbers.  For the present ladder,
what is required is much narrower:

```text
squarefree,
quotient one,
parameter-coprime,
odd,
very large support,
and terminal quotient prime.                       (8.1)
```

Scaled constructions which insert `rad(mu)` into the number violate defect coprimality.  Small
listed terms often have quotient greater than one, are nonsquarefree, are even, or share a prime
with the parameter.  They may provide algebraic examples but not eligible intermediate states.

Moreover, at the 66-prime layer the intermediate defect need not be numerically small.  Even a
small divisor relative to the terminal norm may have hundreds of digits.  The correct search object
is therefore the defect spectrum of large primitive blocks, not a lookup table of small parameters.

## 9. Search consequences

A support-67 defect-900 search may be indexed in either direction.

### Cofactor-first

Generate 66-prime odd squarefree states `K` and store

```text
K,
d=delta(K),
(K+900)/d.                                         (9.1)
```

A completion occurs when the quotient is a new prime and the final integer contains `31` exactly
once.

### Two-prime block-first

Generate 65-prime partial states `(H,c)`, factor or sieve

```text
H^2+900c,
```

and interpret every admissible divisor as an intermediate defect `d` rather than an anonymous
factor.

### Port-tree

Track only

```text
current product,
current defect,
support,
forbidden primes.                                  (9.2)
```

A prime transition is exact and no derivative recomputation is needed.

## 10. Current frontier

Natural blocks, low-Hamming repairs of the explicit relay, and structured odd tails from known
primary-pseudoperfect numbers have produced no integer two-prime terminal closures.  The defect
spectrum shows what must replace those searches:

1. construct large primitive quotient-one `d`-Sondow intermediate states;
2. control the terminal quotient `(K+900)/d`;
3. use block-syndrome gluing to generate such states from distant, rather than locally modified,
   prime blocks;
4. exploit the distinguished `31` condition through `(7.1)--(7.3)`.

## 11. Classification

```text
ONE-PRIME COFACTOR DEFECT FORMULA — PROVED
NORMALIZED DEFECT SPECTRUM — PROVED
TWO-PRIME FACTORS = INTERMEDIATE DEFECTS — PROVED
PARITY LADDER — PROVED
DISTINGUISHED-31 OUTPUT AS SHIFTED DEFECT — PROVED
DEFECT-900 / E307 EXACT FILLING — OPEN
```

The primewise Korselt and `mu`-Sondow characterizations are prior literature.  This note is a
research organization of the terminal-port mechanism and has not received an independent novelty
audit.  No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv status, or
canonical project state is changed.
