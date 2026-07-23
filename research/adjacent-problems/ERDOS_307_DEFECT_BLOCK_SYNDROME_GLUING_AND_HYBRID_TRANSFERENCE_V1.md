# Erdős 307: defect block-syndrome gluing and hybrid transference

**Programme:** `E306-RL-ADJ-22`  
**Status:** `GENERAL EQUIVALENCE / BLOCK CODE / CONSTRUCTION INTERFACE`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The core-30 E307 problem is equivalent to finding an odd squarefree integer `N`, with a
distinguished factor `31`, such that

```text
N-D(N)=900,
```

plus one affine output-prime condition.  Primewise, every factor `p|N` must satisfy

```text
N/p=-900 mod p.
```

This note packages those many local conditions into exact block syndromes.  The result separates
the construction problem into:

```text
MULTIPLICATIVE CRT:
  complementary blocks must hit unique residue classes;

ARCHIMEDEAN LOAD:
  the reciprocal masses of the blocks must sum to just below one.
```

The two requirements together are sufficient, not merely necessary.

## 2. Defect notation

For a positive integer `n`, put

```text
delta(n)=n-D(n).                                    (2.1)
```

If `n` is squarefree, then

```text
delta(n)/n=1-sum_(p|n)1/p.                          (2.2)
```

Throughout, `C` is a positive integer and all blocks are squarefree.

## 3. Two-block gluing theorem

Let `A,B` be coprime squarefree positive integers and put

```text
N=AB.
```

The product rule gives

```text
D(N)=B D(A)+A D(B),                                 (3.1)
```

and hence

```text
delta(N)=AB-BD(A)-AD(B).                            (3.2)
```

### Theorem 3.1 — exact block-syndrome gluing

Assume

```text
0<C<AB.
```

Then

```text
delta(AB)=C                                          (3.3)
```

if and only if all three conditions hold:

```text
B D(A)=-C mod A,                                     (3.4)
A D(B)=-C mod B,                                     (3.5)
D(A)/A+D(B)/B<1.                                     (3.6)
```

### Proof

If `(3.3)` holds, reducing `(3.2)` modulo `A` and modulo `B` gives `(3.4)--(3.5)`.  Positivity of
`C` gives `(3.6)` by `(2.2)`.

Conversely, let

```text
E=delta(AB).
```

Condition `(3.4)` gives

```text
E=C mod A,
```

and `(3.5)` gives

```text
E=C mod B.
```

Since `gcd(A,B)=1`,

```text
E=C mod AB.                                          (3.7)
```

Condition `(3.6)` gives

```text
0<E<AB.
```

Together with `0<C<AB`, congruence `(3.7)` forces `E=C`. `square`

### Interpretation

Neither the local congruences nor the reciprocal load alone is sufficient.  Exact defect is the
intersection of a non-Archimedean code condition and an Archimedean positivity window.

## 4. Unique complement residues

For squarefree `A`,

```text
gcd(A,D(A))=1.                                      (4.1)
```

Indeed, modulo every prime `p|A`,

```text
D(A)=A/p !=0 mod p.
```

Assume also `gcd(A,C)=1`.  Define the block syndrome

```text
theta_C(A)=-C D(A)^(-1) mod A.                      (4.2)
```

Then `(3.4)` is exactly

```text
B=theta_C(A) mod A.                                 (4.3)
```

Thus every squarefree block emits one unique allowed residue class for its complete complement.
The second block emits the reciprocal condition

```text
A=theta_C(B) mod B.                                 (4.4)
```

The construction problem is therefore a mutual fixed-point problem for two moving residue maps.

## 5. Multi-block theorem

Let

```text
N=A_1 A_2 ... A_k
```

be a product of pairwise coprime squarefree blocks, and put

```text
B_i=N/A_i.
```

### Theorem 5.1 — complete block-code criterion

Assume `0<C<N`.  Then

```text
N-D(N)=C                                             (5.1)
```

if and only if:

```text
B_i D(A_i)=-C mod A_i       for every i,             (5.2)
```

and

```text
sum_i D(A_i)/A_i<1.                                  (5.3)
```

### Proof

Modulo `A_i`, every derivative term except the derivative of `A_i` contains the factor `A_i`.
Hence

```text
D(N)=B_iD(A_i) mod A_i.
```

The same CRT and size argument as in Theorem 3.1 proves the result. `square`

### Block factor graph

Condition `(5.2)` says that each block observes the product of all other blocks through its first
arithmetic jet:

```text
D(A_i) product_(j!=i) A_j=-C mod A_i.                (5.4)
```

This is a complete multiplicative factor graph.  A block may contain many primes, but it contributes
only one modulus and one jet coefficient at the gluing level.

## 6. Relation to the primewise Korselt conditions

Taking each block to be one prime `p` gives

```text
D(p)=1,
B_p=N/p,
```

so `(5.2)` becomes

```text
N/p=-C mod p.                                       (6.1)
```

Thus Theorem 5.1 is exactly the block compression of the standard `mu`-Sondow / Korselt criterion.
The novelty claim of this note is not the primewise condition.  Its purpose is the exact block-level
sufficiency and the construction interface it supplies.

## 7. Defect 900 and the core-30 programme

For the standard core-30 coordinate,

```text
C=900,
N=31Y.
```

Every eligible solution is odd, squarefree, and coprime to `900`.  For any factorization

```text
N=AB,
```

Theorem 3.1 becomes

```text
B D(A)=-900 mod A,                                  (7.1)
A D(B)=-900 mod B,                                  (7.2)
```

and

```text
sum_(p|A)1/p+sum_(q|B)1/q<1.                        (7.3)
```

The exact defect equation then follows automatically.

The additional E307 requirements are:

```text
31|AB exactly once,
(AB-930)/961 is prime and disjoint from AB.          (7.4)
```

## 8. Ambient E313 parity obstruction

Let `K` be an even squarefree primary pseudoperfect number, so

```text
K-D(K)=1.
```

Let `B` be squarefree and coprime to `K`.  Then `B` is odd, while `K D(B)` is even.  Therefore

```text
B-KD(B) is odd.                                     (8.1)
```

### Proposition 8.1

No even primary-pseudoperfect core can be filled by a coprime squarefree block to any even residual:

```text
B-KD(B)=C,  C even,                                 (8.2)
```

has no solution.

In particular, none of the known even PPN cores can produce defect `900` by ambient inheritance,
regardless of the number of new prime factors.  The E313 bridge must use nonambient port pencils or
other block states.

This is stronger than the empty two-prime tests obtained from

```text
(q-K)(r-K)=K^2+900.
```

Their failure is forced by parity before factorization.

## 9. Hybrid transference viewpoint

Fix a partial block `A` with

```text
c_A=A-D(A)>0.
```

The complement equation is the residual port

```text
c_A B-A D(B)=C.                                     (9.1)
```

It has two projections:

```text
MULTIPLICATIVE:
  B=c_A^(-1) C mod A;

RECIPROCAL:
  D(B)/B=c_A/A-C/(AB).                              (9.2)
```

The first is a subset-product / CRT target in `(Z/AZ)^x`.  The second is a reciprocal-load target.
This resembles the mechanism developed for E306:

```text
hot component:
  mix multiplicative residues;

cold component:
  supply reciprocal mass;

terminal component:
  close the exact finite correction C/(AB).
```

The difference is self-modularity: the modulus `A`, the target residue, and the reciprocal correction
all depend on the selected partial block.

## 10. Construction architecture

A genuine meet-in-the-middle programme should store, for every generated block `A`:

```text
A,
D(A),
c_A=A-D(A),
theta_C(A),
D(A)/A,
prime-factor support,
distinguished-factor data.
```

Two blocks `A,B` may be joined only when:

1. `B=theta_C(A) mod A`;
2. `A=theta_C(B) mod B`;
3. their reciprocal masses sum to less than `1`;
4. the final affine E307 output is prime.

The exact target is then automatic by Theorem 3.1.

This replaces low-Hamming repair of one enormous relay by a symmetric block-collision problem.
The defect-exchange determinant describes the rigidity of nearby codewords; Theorem 3.1 describes
how distant codewords may be glued from scratch.

## 11. Research frontier

The highest-value next questions are:

1. construct large block libraries with controlled `theta_900` and reciprocal mass;
2. prove collision or equidistribution results for `theta_C(A)` over structured prime blocks;
3. design a hot-cold multiplicative subset-product model whose terminal closure is exact;
4. exploit the distinguished factor `31` by placing it wholly in one block;
5. determine whether the mutual syndrome equations admit a useful involution or norm form after
   restricting to two-prime terminal blocks.

## 12. Classification

```text
TWO-BLOCK DEFECT GLUING — PROVED
MULTI-BLOCK DEFECT CODE — PROVED
UNIQUE COMPLEMENT RESIDUE — PROVED
AMBIENT EVEN-PPN -> EVEN-DEFECT TRANSFER — IMPOSSIBLE
DEFECT-900 HYBRID MULTIPLICATIVE/RECIPROCAL INTERFACE — PROVED
EXACT DEFECT-900 E307 FILLING — OPEN
```

The `mu`-Sondow primewise criterion and primary-pseudoperfect theory are prior literature.  The
block packaging and research architecture are not independently novelty-audited.  No released E306
theorem, manuscript, Lean authority, review status, DOI, arXiv status, or canonical project state is
changed.
