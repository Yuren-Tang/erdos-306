# E306-PD-A11–A13 — arithmetic closure and formal theorem correspondence

**Ledger correspondence:** manuscript P0–P3, P33 and formal-conjecture bridge  
**State:** `COMPLETE-DRAFT`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Input:** structural avoiding representation for every squarefree \(b\ge3\)

## 1. Exact theorem

A positive rational \(q\), written in lowest terms as \(q=a/b\), is a finite
sum of reciprocals of distinct squarefree semiprimes if and only if \(b\) is
squarefree.

Here a squarefree semiprime is a product \(pq\) of two distinct primes.
Equivalently,
\[
 \omega(n)=\Omega(n)=2.
\]

The formal release proves the sufficiency direction and then restates it in
the community tuple formulation as `Erdos306.erdos_306`. The necessity
direction is elementary and is supplied below.

## 2. Necessity

Let \(S\) be a finite set of squarefree positive integers and put
\[
 r=\sum_{n\in S}\frac1n.
\]
Let
\[
 M=\operatorname{lcm}\{n:n\in S\}.
\]
Every \(n\mid M\), so
\[
 r=\frac{\sum_{n\in S}M/n}{M}.
\]
The reduced denominator of \(r\) divides \(M\). Since an lcm of squarefree
integers is squarefree, the reduced denominator of \(r\) is squarefree.

Every squarefree semiprime is squarefree, hence the necessity direction
follows.

No cancellation issue is hidden here: cancellation can only replace \(M\)
by a divisor, and every divisor of a squarefree integer is squarefree.

## 3. Avoiding representations

For a finite obstruction set \(T\), write \(\operatorname{Rep}_T(r)\) when
there is a finite set \(S\) of squarefree semiprimes such that
\[
 S\cap T=\varnothing,\qquad
 \sum_{n\in S}\frac1n=r.
\]

The article-core construction proves:

### Structural theorem

If \(b\ge3\) is squarefree, then
\[
 \operatorname{Rep}_T(1/b)
\]
holds for every finite \(T\).

The obstruction parameter is essential. It permits repeated use of the unit
numerator theorem while preserving distinctness globally.

## 4. The case \(b=2\)

Choose
\[
 S_3\quad\text{with}\quad
 \sum_{n\in S_3}\frac1n=\frac13,\qquad S_3\cap T=\varnothing.
\]
Next choose
\[
 S_6\quad\text{with}\quad
 \sum_{n\in S_6}\frac1n=\frac16,\qquad
 S_6\cap(T\cup S_3)=\varnothing.
\]
Both denominators \(3\) and \(6\) are squarefree and at least \(3\). The sets
are disjoint and avoid \(T\), and
\[
 \sum_{n\in S_3\cup S_6}\frac1n
 =\frac13+\frac16=\frac12.
\]
Thus \(\operatorname{Rep}_T(1/2)\).

This is `egyptian_rep_eq2_R2`.

## 5. The case \(b=1\)

First construct an avoiding representation \(S_2\) of \(1/2\). Then construct
\(S_3\) avoiding \(T\cup S_2\), and finally \(S_6\) avoiding
\(T\cup S_2\cup S_3\). The three sets are pairwise disjoint, and
\[
 \frac12+\frac13+\frac16=1.
\]
Therefore \(\operatorname{Rep}_T(1)\).

This is `exists_semiprime_egyptian_one_R2`; the released
`circle_method_positivity_R2` combines the cases \(b=1,2\) and \(b\ge3\).

## 6. Arbitrary numerator

Assume that \(\operatorname{Rep}_T(1/b)\) holds for every finite \(T\). We
prove by induction on \(a\ge1\) that \(\operatorname{Rep}_T(a/b)\).

For \(a=1\), this is the hypothesis. Suppose \(S_a\) represents \(a/b\) and
avoids \(T\). Apply the unit-numerator theorem with obstruction set
\[
 T'=T\cup S_a
\]
to obtain a set \(U\) representing \(1/b\). Then \(U\cap S_a=\varnothing\),
and
\[
 \sum_{n\in S_a\cup U}\frac1n
 =
 \frac ab+\frac1b
 =
 \frac{a+1}{b}.
\]
The union remains a set of distinct squarefree semiprimes avoiding \(T\).

This is `reduction_to_unit_numerator_avoiding`, used by
`erdos_306_unconditional`.

## 7. Passage from a positive rational to natural numerator and denominator

Let \(q>0\), let
\[
 a=q.\mathrm{num.toNat},\qquad b=q.\mathrm{den}.
\]
Positivity gives \(a>0\), and the rational normalization gives
\[
 q=\frac ab,\qquad b>0.
\]
If `Squarefree q.den`, the released theorem
`erdos_306_unconditional a b` supplies a finite semiprime set \(S\) with
\[
 q=\sum_{n\in S}\frac1n.
\]

The set is nonempty, because an empty sum is \(0\) while \(q>0\).

## 8. Finite set to strictly increasing tuple

Let \(|S|=m+1\), and enumerate \(S\) increasingly by the order embedding
\[
 g:\operatorname{Fin}(m+1)\hookrightarrow\mathbf N.
\]
Define
\[
 n:\operatorname{Fin}(m+2)\to\mathbf N
\]
by
\[
 n(0)=1,\qquad n(j+1)=g(j).
\]

Every squarefree semiprime is greater than \(1\), so the anchor \(1\) is
strictly smaller than the first genuine denominator. The map \(g\) is
strictly increasing, hence so is \(n\).

For every noninitial index,
\[
 \omega(n_i)=\Omega(n_i)=2.
\]
Finally,
\[
 q=\sum_{i=1}^{m+1}\frac1{n_i}.
\]

The dummy value \(n_0=1\) is not part of the Egyptian sum; it exists solely
to match the community theorem's nonempty strictly increasing tuple
interface.

This is the complete bridge in `Erdos306FormalConjectures.lean`:

- `isSemiprime_omega_Omega`;
- `isSemiprime_one_lt`;
- `Erdos306.erdos_306`.

## 9. Exact formal statement

The released community-form theorem is
```lean
∀ (q : ℚ), 0 < q → Squarefree q.den →
  ∃ k : ℕ, ∃ n : Fin (k + 1) → ℕ,
    n 0 = 1 ∧ StrictMono n ∧
    (∀ i ∈ Finset.Icc 1 (Fin.last k),
      ω (n i) = 2 ∧ Ω (n i) = 2) ∧
    q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / n i
```

The human set formulation and this tuple formulation are extensionally
equivalent:

- a finite set has a unique increasing enumeration;
- a strictly increasing tuple has distinct values;
- the initial anchor is excluded from the sum;
- \(\omega=\Omega=2\) is equivalent to being a product of two distinct
  primes.

## 10. Formal dependency path

```text
exists_arcConstruction_final
  -> exists_pos_weighted_ge3_R2
  -> egyptian_rep_ge3_R2
  -> egyptian_rep_eq2_R2 / exists_semiprime_egyptian_one_R2
  -> circle_method_positivity_R2
  -> fourier_positivity_unconditional_R2
  -> erdos_306_unconditional
  -> Erdos306.erdos_306
```

The exact headline axiom audit remains:

1. `propext`;
2. `Classical.choice`;
3. `Quot.sound`;
4. `RosserSchoenfeld.rosser_schoenfeld_cor3`;
5. `RosserSchoenfeld.rosser_schoenfeld_thm5`.

The PNT paper backend does not alter this released audit.

## 11. Edge cases

- The theorem is stated only for \(q>0\); no representation of \(0\) is
  asserted.
- The denominator of a normalized rational is positive.
- The cases \(b=1,2\) are not fed into the \(b\ge3\) construction.
- Repeated numerator addition enlarges the obstruction set before every new
  call.
- The finite set is nonempty before it is enumerated.
- The formal anchor \(1\) is not a semiprime and is deliberately outside the
  indexed summation range.

## 12. Status conclusion

The arithmetic closure from the structural avoiding theorem to the public
Erdős 306 statement is fully explicit. No kernel-residual estimate and no
new mathematical input remains in this unit.

`E306-PD-A11–A13` is `COMPLETE-DRAFT`.
