# E306-AB1 Source Audit

Workstream: `E306-AB1-01`  
Audit date: 2026-07-16  
Scope: publication source chain, historical/source-role classification, and bounded read-only Mathlib availability scan.

The supplied `pnt_mertens_references.txt` and any auxiliary note are discovery leads only. No claim below relies on them without independent verification.

## 1. Recommended source chain

The recommended paper backend needs only one load-bearing external theorem:

\[
\pi(x)\sim x/\log x.
\]

The local reciprocal-prime block law is then proved in the paper by Abel/partial summation. This is preferable to citing a second theorem whose error convention must itself be audited.

### Publication recommendation

- Cite **Soundararajan (2006), Lecture 1, opening paragraph (p. 1)** as the directly checkable modern statement of PNT.
- Cite **Ingham, Theorem 23** as the standard monograph locator.
- Optionally cite **Hadamard (1896)** in a historical note, not as the reader's principal locator.
- Cite **Rosser--Schoenfeld (1962)** only in the formalization/release paragraph, where its two exact results are genuinely load-bearing for `v0.0.3`.
- Do not cite ordinary reciprocal-prime Mertens as though it implied the local dyadic law.

## 2. Verified source table

| Source | Exact locator | Audited role | What the source supplies | Relation to AB1 claim | Metadata status |
|---|---|---|---|---|---|
| K. Soundararajan, “The distribution of prime numbers” | Lecture 1, opening paragraph, arXiv:math/0606408, p. 1 in the 20-page version | **directly checkable modern theorem statement** | explicitly states `pi(x) ~ x/log x` | exact load-bearing statement; AB1 proves the local bridge | arXiv title, author, version, length, subject, and DOI `10.48550/arXiv.math/0606408` verified on the official record and full text |
| A. E. Ingham, *The Distribution of Prime Numbers* | Theorem 23; Cambridge Tracts in Mathematics 30; 1990 reprint of the 1932 edition | standard monograph locator | Prime number theorem in the standard asymptotic form | exact theorem; corroborating standard source | edition, series, theorem locator, publisher, and ISBN cross-checked; no DOI used |
| J. Hadamard, “Sur la distribution des zéros de la fonction zeta(s) et ses conséquences arithmétiques” | *Bull. Soc. Math. France* 24 (1896), 199--220 | historical original | one of the independent 1896 proofs of PNT | historical context, stronger provenance than exposition | Numdam metadata and DOI `10.24033/bsmf.545` verified |
| J. B. Rosser and L. Schoenfeld, “Approximate formulas for some functions of prime numbers” | Cor. 3, eq. (3.8), p. 69; Thm. 5, eqs. (3.17)--(3.18), p. 70 | **formal/release theorem source** | explicit dyadic prime-count lower bound and explicit reciprocal-prime prefix bounds | exact current nonstandard inputs of `v0.0.3`; stronger and more explicit than eventual paper needs | journal, volume, pages, year, DOI `10.1215/ijm/1255631807`, and internal locators verified against the frozen source transcription and release evidence |
| F. Mertens, “Ein Beitrag zur analytischen Zahlentheorie” | eq. (13), p. 52; *J. reine angew. Math.* 78 (1874), 46--62 | historical original / rejected as local backend | reciprocal-prime theorem with an explicit classical error of order `1/log x` | sufficient for fixed power windows; not sufficient as stated for a single dyadic `1/log x` main term | publisher metadata and DOI `10.1515/crll.1874.78.46` verified |
| M. B. Villarino, “Mertens' Proof of Mertens' Theorem” | arXiv:math/0504289v3 | explanatory bridge | modern exposition of Mertens' original argument and constants | background only; not needed for recommended proof | arXiv record and DOI `10.48550/arXiv.math/0504289` verified |

## 3. Exact theorem statements recommended for publication

### 3.1 Prime number theorem

Let `pi(x)` be the number of primes at most `x`. Then

\[
\lim_{x\to\infty}
\frac{\pi(x)}{x/\log x}=1.
\]

**Directly checkable source:** Soundararajan, “The distribution of prime numbers,” Lecture 1, opening paragraph (p. 1), arXiv:math/0606408.  
**Standard monograph locator:** Ingham, *The Distribution of Prime Numbers*, Theorem 23.

**Use in the paper:** apply Abel summation on `[x,2x]` to prove

\[
\sum_{x\le p<2x}\frac1p
=
\frac{\log2}{\log x}+o(1/\log x).
\]

The latter implication should be written out, not delegated to the citation.

### 3.2 Rosser--Schoenfeld Corollary 3

For `x >= 20.5`,

\[
\frac{3x}{5\log x}<\pi(2x)-\pi(x).
\]

The frozen Lean statement uses the corresponding floor endpoints for real `x`.

**Source:** Rosser--Schoenfeld (1962), Corollary 3, equation (3.8), p. 69.

**Use:** release/formal audit only. At `x=2^k`, `k>=5`, it gives more than the manuscript's target coefficient `1/2`.

### 3.3 Rosser--Schoenfeld Theorem 5

There is a constant `B` such that

\[
\log\log x+B-\frac1{2\log^2x}
<\sum_{p\le x}\frac1p
\qquad(x>1),
\]

and

\[
\sum_{p\le x}\frac1p
<\log\log x+B+\frac1{2\log^2x}
\qquad(x\ge286).
\]

**Source:** Rosser--Schoenfeld (1962), Theorem 5, equations (3.17)--(3.18), p. 70.

**Use:** release/formal audit only. Subtraction at `2^{3k_0+1}` and `2^{k_0}` yields the exact inclusive-window theorem; the release takes `k_0>=20`.

## 4. Source-role separation

### Theorem source

A source cited at the point where the proof invokes a theorem. For the recommended paper backend, Soundararajan gives the directly checkable modern statement and Ingham, Theorem 23, gives the standard monograph locator.

### Historical original

A source establishing provenance but not necessarily offering the cleanest modern notation or shortest reader verification. Hadamard and Mertens belong here. Historical citation must not replace the modern theorem locator in the proof.

### Explanatory bridge

A source explaining notation, historical formulation, or a modern derivation. Soundararajan also serves this explanatory role while supplying the directly checkable PNT statement; Villarino is a bridge for Mertens. Neither should be represented as the exact formal trust boundary.

### Formal/release source

The source matching an external axiom or an auditable formal input. Rosser--Schoenfeld is in this class for `v0.0.3`. The conceptual PNT backend is not.

## 5. Rejected, insufficient, or misleading candidates

### 5.1 The unverified reference note

Rejected as authority. It correctly points toward PNT and Mertens literature but does not itself verify locators, edition data, or the crucial remainder distinction. In particular, prose that moves from ordinary Mertens to a local dyadic block without auditing the error scale would be misleading.

### 5.2 Ordinary Mertens `+o(1)` as a source for `A_k ~ 1/k`

Insufficient. Subtracting at `2x` and `x` leaves `o(1)`, whereas the main term is only `Theta(1/log x)`.

### 5.3 Classical Mertens `+O(1/log x)` as a local source

Insufficient without an explicit small constant or local cancellation theorem. The error is of the same order as the dyadic main term. Mertens' original explicit bound is excellent historical evidence and is sufficient for the long window, but it is not the desired one-block theorem.

### 5.4 PNT plus ordinary Mertens as two independent paper assumptions

Mathematically valid but rejected as the principal architecture. PNT already yields the local law by a short partial-summation proof; adding Mertens duplicates the analytic handoff and hides the unity of the two construction supplies.

### 5.5 Search snippets, encyclopedia statements, and unspecific textbook mentions

Rejected for load-bearing citation. They were useful for discovery and cross-checking, but the recommended chain terminates in Soundararajan and Ingham for PNT, the primary historical records, the Rosser--Schoenfeld paper, and official arXiv/publisher records.

### 5.6 Treating `codex/pushlinter` as a released artifact

Rejected. The frozen architecture commit is context only and has no release or publication status beyond the accepted RV1 evidence.

## 6. BibTeX candidates

The following entries were normalized after metadata verification.

```bibtex
@book{Ingham1990,
  author    = {Ingham, A. E.},
  title     = {The Distribution of Prime Numbers},
  series    = {Cambridge Tracts in Mathematics},
  volume    = {30},
  publisher = {Cambridge University Press},
  address   = {Cambridge},
  year      = {1990},
  isbn      = {978-0-521-39789-6},
  note      = {Reprint of the 1932 edition with a foreword by R. C. Vaughan; see Theorem 23}
}

@misc{Soundararajan2006,
  author        = {Soundararajan, Kannan},
  title         = {The Distribution of Prime Numbers},
  year          = {2006},
  eprint        = {math/0606408},
  archivePrefix = {arXiv},
  primaryClass  = {math.NT},
  doi           = {10.48550/arXiv.math/0606408}
}

@article{Hadamard1896,
  author    = {Hadamard, J.},
  title     = {Sur la distribution des z{\'e}ros de la fonction $\zeta(s)$ et ses cons{\'e}quences arithm{\'e}tiques},
  journal   = {Bulletin de la Soci{\'e}t{\'e} Math{\'e}matique de France},
  volume    = {24},
  pages     = {199--220},
  year      = {1896},
  publisher = {Soci{\'e}t{\'e} math{\'e}matique de France},
  doi       = {10.24033/bsmf.545}
}

@article{RosserSchoenfeld1962,
  author  = {Rosser, J. Barkley and Schoenfeld, Lowell},
  title   = {Approximate Formulas for Some Functions of Prime Numbers},
  journal = {Illinois Journal of Mathematics},
  volume  = {6},
  number  = {1},
  pages   = {64--94},
  year    = {1962},
  doi     = {10.1215/ijm/1255631807},
  note    = {Corollary 3, equation (3.8), p. 69; Theorem 5, equations (3.17)--(3.18), p. 70}
}

@article{Mertens1874,
  author  = {Mertens, Franz},
  title   = {Ein Beitrag zur analytischen Zahlentheorie},
  journal = {Journal f{\"u}r die reine und angewandte Mathematik},
  volume  = {78},
  pages   = {46--62},
  year    = {1874},
  doi     = {10.1515/crll.1874.78.46},
  note    = {See equation (13), p. 52}
}

@misc{Villarino2005,
  author        = {Villarino, Mark B.},
  title         = {Mertens' Proof of Mertens' Theorem},
  year          = {2005},
  eprint        = {math/0504289},
  archivePrefix = {arXiv},
  primaryClass  = {math.HO},
  doi           = {10.48550/arXiv.math/0504289}
}
```

## 7. Bounded Mathlib availability audit

This section is deliberately separate from paper mathematics.

### 7.1 Frozen architecture environment

At `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`:

- Lean toolchain: `leanprover/lean4:v4.31.0`;
- Mathlib input release: `v4.31.0`;
- pinned Mathlib commit: `fabf563a7c95a166b8d7b6efca11c8b4dc9d911f`.

### 7.2 Declarations/infrastructure present at the pinned Mathlib ref

1. `Mathlib.NumberTheory.PrimeCounting` provides `Nat.primeCounting` and finite prime-counting infrastructure.
2. `Mathlib.NumberTheory.AbelSummation` is present and is publicly imported by `Mathlib.NumberTheory.Chebyshev`.
3. `Mathlib.NumberTheory.Chebyshev` defines `Chebyshev.theta`, `Chebyshev.psi`, Abel-summation identities relating `theta` and `primeCounting`, and explicit Chebyshev upper/lower bounds. Relevant named declarations include:
   - `Chebyshev.primeCounting_eq_theta_div_log_add_integral`;
   - `Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`;
   - `Chebyshev.eventually_primeCounting_le`;
   - `Chebyshev.pi_ge`.
4. `Mathlib.NumberTheory.SumPrimeReciprocals` proves divergence, notably:
   - `not_summable_one_div_on_primes`;
   - `Nat.Primes.not_summable_one_div`.

These are useful components but do not state PNT, reciprocal-prime Mertens, or the dyadic local asymptotic.

### 7.3 PNT availability

At both pinned Mathlib `v4.31.0` and the bounded current-default-branch check performed on 2026-07-16, Mathlib's `docs/100.yaml` lists the Prime Number Theorem by links to the external `AlexKontorovich/PrimeNumberTheoremAnd` project rather than by a Mathlib declaration.

The referenced external commit

`a5040887e6bb24f7c201db8568e7755c138b3878`

contains, in `PrimeNumberTheoremAnd/Wiener.lean`, the theorem

`WeakPNT : Tendsto (fun N => cumsum Λ N / N) atTop (nhds 1)`

and separately points to stronger error-term work in `MediumPNT.lean`.

This is real formal evidence, but it is not a declaration available merely by importing pinned Mathlib. Integrating it would be a separate engineering/trust-boundary task.

### 7.4 Release environment

Immutable `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe` uses Lean `v4.28.0`. Its exact analytic trust boundary remains the two Rosser--Schoenfeld axioms named above; it does not depend on PNT, Mertens, or the external PNT project.

### 7.5 Formalization recommendation

- Do not let current availability determine the paper's starting theorem.
- Retain Rosser--Schoenfeld for any near-term release-preserving formal work.
- If conceptual alignment is later authorized, first establish an accepted PNT import/upstream route, then formalize the local partial-summation lemma and eventual construction interfaces on a separately assigned branch.

## 8. Source risks and conclusion

No authoritative sources materially disagreed on any load-bearing theorem.

The only material source-risk discovered is terminological: “Mertens' theorem” may denote an `o(1)`, `O(1/log x)`, or much sharper form depending on the source. Those forms are not interchangeable for a single dyadic block. The paper must state the remainder actually used, or avoid the ambiguity by adopting the recommended PNT-only derivation.

The verified source packet is sufficient for publication planning. No unresolved exact locator blocks this bounded review.
