# E306-PD-PAPER-FIRST-01 — dependency and parameter ledger

**State:** `READY-FOR-PAPER-FIRST-MANUSCRIPT`  
**Proof controlled by:** `proof-development/PAPER-FIRST-HUMAN-PROOF.md`  
**Purpose:** certify logical closure, non-circular parameter choice, and the
absence of hidden formal or computational premises

## 1. Authority and premise ledger

The standalone proof has one external mathematical premise:

- the prime number theorem `pi(x)~x/log x`.

It is used only to prove:

1. two-sided prime counts in every dyadic block between `X` and `X^3`;
2. `sum_{X<=p<X^3}1/p=log3+o(1)`;
3. `sum_{X<=p<X^3}1/p^2=O(1/(X logX))`.

Every later statement is finite combinatorics, elementary real/complex analysis,
Chinese remaindering, or unique factorization. No Rosser–Schoenfeld inequality,
Lean theorem, unpublished dossier, or software-generated finite inequality is a
premise.

## 2. Theorem dependency ledger

| Node | Statement | Direct inputs | Status |
|---|---|---|---|
| `H0` | headline iff theorem | `H1`, `H2`, `H3` | proved |
| `H1` | squarefree-denominator necessity | lcm identity | proved |
| `H2` | numerator induction with avoidance | avoiding unit theorem | proved |
| `H3` | reductions `b=1,2` | avoiding unit theorem for `b>=3` | proved |
| `A1` | uniform dyadic prime density | PNT | proved |
| `A2` | reciprocal load tends to `log3` | PNT + Abel summation | proved |
| `A3` | reciprocal-square upper bound | `A1` | proved |
| `D1` | complete-pair load tends to `(log3)^2/2` | `A2`, `A3` | proved |
| `D2` | distinct semiprime family and period divisibility | unique factorization | proved |
| `D3` | compact Bernoulli interval and no-wrap | `D1` | proved |
| `F1` | exact finite Fourier identity | character orthogonality | proved |
| `F2` | Fourier-energy upper bound | `D3`, sine inequality | proved |
| `R1` | deterministic reciprocal dispersion | prime congruence fibres | proved |
| `R2` | cross-label energy | `R1`, centred CRT identity | proved |
| `R3` | nondominant forcing | `R2`, explicit covering dichotomy | proved |
| `R4` | exact label on every cold block | `R1`, `R3` | proved |
| `R5` | fingerprint rigidity | `R1`, centred CRT difference identity | proved |
| `R6` | energetic-block entropy | `R5`, explicit fingerprint count | proved |
| `R7` | adjacent-label penalty | `R1`, `R4` | proved |
| `G1` | global level-set estimate | `R4`, `R6`, `R7` | proved |
| `G2` | localization below the forcing floor | `R4`, `R7` | proved |
| `G3` | global CRT tail | `G1`, `G2`, Gaussian integral | proved |
| `V1` | variance comparability | `A1`, `A3`, bottom-block pairs | proved |
| `M1` | Taylor major lower bound | `D3`, `V1`, exact expected mass | proved |
| `m1` | block-minor bound | `F2`, `G3`, exact fibre size `b` | proved |
| `m2` | sibling damping | squarefree `b`, common reservoir | proved |
| `P1` | strict Fourier positivity | `M1`, `m1`, `m2` | proved |
| `P2` | exact reciprocal equality | `P1`, no-wrap | proved |
| `H4` | avoiding unit theorem | `P2`, `D2` | proved |

There is no unresolved node and no node whose proof is “the formalization checks
it”.

## 3. Fixed data

At the beginning of the avoiding theorem, fix:

```text
b >= 3 squarefree;
T finite;
lambda_-, lambda_+ with
  1/3 < lambda_- < (log 3)^2/2 < lambda_+ < 1;
rho in (0,1/4).
```

The block proof then chooses one sufficiently small `c_w=c_w(rho)>0`. This is a
mathematical output of the explicit nondominant and exception estimates:

- `c_w` is below the forcing constant obtained in Proposition 9;
- `C_rho c_w<1`, so a cold block has zero exceptional coordinates.

No later construction changes `rho` or `c_w`.

## 4. Constants determined before the terminal choice

The compact load interval determines

```text
I_b = [1/(b lambda_+), 1/(b lambda_-)];
nu_b = min_{theta in I_b} theta(1-theta) > 0;
c_b  = 8 nu_b;
beta_b = sqrt(1-4 nu_b/b^2) < 1.
```

The PNT density constants and the chosen scaffold determine a variance comparison
constant `K_b` such that, after a scale threshold,

```text
sqrt(nu_b) sigma <= sigma_E <= K_b sigma.
```

`K_b` is chosen independently of the reservoir size. After the finite reservoir
size `G` is fixed, the bottom scale is increased until its `O(GX^-6)`
reciprocal-square contribution fits into the spare part of the same constant.
This removes a possible circularity.

Compact Taylor theory on `I_b` determines:

```text
r_b > 0;
M_b < infinity;
a_b > 0;
c_maj > 0.
```

These constants depend on `b` and the fixed load interval, not on `X`, `C`, or
`G`.

## 5. Terminal parameter order

The terminal choices are made exactly as follows.

### Step 1 — high-floor allowance

Choose `eta>0` with

```text
b eta < c_maj/(6 K_b).
```

The global CRT-tail theorem with exponent `c_b` then supplies a finite constant
`K_{c_b}` and an eventual scale threshold.

### Step 2 — diagonal cutoff

Choose `C` satisfying both

```text
C > 1/sqrt(nu_b)
```

and

```text
b K_{c_b} exp(-c_b C^2/2) < c_maj/(6 K_b).
```

Such a `C` exists because the Gaussian tends to zero.

### Step 3 — common reservoir size

Choose an integer `G>=1` with

```text
b(2C+3) beta_b^G < c_maj/(6 K_b).
```

Such a `G` exists because `0<beta_b<1`.

### Step 4 — bottom scale

Only after `eta`, `C`, and `G` are fixed, choose `n` and `X=2^n` above the finite
maximum of all thresholds in Section 6.

No parameter is chosen after `n`, except the objects (`P_k`, `E`, `theta`, `L`)
that are defined by the already fixed data and the chosen scale.

## 6. Final threshold ledger

The final `n` is the maximum of thresholds for the following independently
proved eventual statements.

### Analytic thresholds

- tail-uniform two-sided PNT in every block `n<=k<3n`;
- reciprocal sum within the prescribed `lambda_-,lambda_+` margin after the
  auxiliary load is added;
- reciprocal-square estimates;
- at least `G` primes in the top block.

### Arithmetic and avoidance thresholds

- every block prime is outside the support of `b`;
- every product denominator exceeds `max T`;
- all pair and auxiliary products are distinct;
- the period is larger than the major interval.

### Rigidity thresholds

- uniqueness of dominant labels;
- all inequalities in the covering dichotomy of Proposition 9;
- exact cold labels and zero exception count;
- adjacent-label dispersion and monotonicity of `w_k`, `Pi_k`;
- the fingerprint size lies in `[16,N/2]` in its nontrivial range;
- the trivial high-energy range satisfies `O(X)<=epsilon R`;
- the label-window costs are paid by the preceding hot or boundary charge.

### Global-tail thresholds

- `sigma<=1` and `sigma<=C sigma_n`;
- the forcing floor is the bottom hot-block floor;
- `2^n/n^4` dominates the affine block entropy;
- the high-floor shell sum is below `eta/sigma`;
- the Gaussian integral estimate applies.

### Fourier thresholds

- `2N+1<L` and distinct main residues;
- every denominator is at least `X^2`;
- `|m/e|<=r_b` for `|m|<=N`;
- the aggregate cubic Taylor remainder is below the fixed allowance;
- the major interval contains `|m|<=1/(2sigma_E)`;
- every reservoir prime satisfies `s>2N`;
- `(2N+1)sigma<=2C+3`;
- the auxiliary reciprocal-square mass is below the spare variance budget.

Every threshold depends only on objects fixed in an earlier step. Their maximum
therefore exists and is non-circular.

## 7. Load-bearing proof audit

### “A base prime with few bad neighbours”

This is not an invocation of an unnamed double-counting principle. If `B_0` is
the set of bad unordered pairs, the sum of the bad degrees is exactly
`2|B_0|`; therefore the minimum degree is at most `2|B_0|/N`. The proof inserts
the explicit bound for `|B_0|` and chooses `A_rho` to make the result at most
`rho N/8`.

### “The label cover has few labels”

Every label lies in `[-B,B]` and in one residue class modulo the base prime
`p_0>=X`. The number of such integers is at most `2B/X+2`. This is the complete
count.

### “Nondominance costs energy”

The proof gives an exhaustive dichotomy:

- either small label classes carry a fixed mass, forcing
  `N<=C(B/X+1)^2`;
- or substantial classes carry the mass, and the explicit cross-label energy
  plus power mean forces `R>=cN^4/(M^2X^2)`.

Substitution of `B=A sqrt(R)X^2/N` closes both alternatives algebraically.

### “Cold blocks have no exceptions”

Each exception contributes at least `cN^3/X^2` on a disjoint set of cross
edges. Hence `|E|<=CRX^2/N^3<Cc_w`. The chosen `c_w` makes this strictly below
one, so integer cardinality gives `E=empty`.

### “The encoder is bounded”

The global proof does not use that phrase as an argument. It lists the code:

```text
shell vector;
hot set;
boundary set;
complete hot-block assignments;
one integer label per cold segment.
```

It proves injectivity and supplies a separate quantitative bound for every
layer. The shell count is a geometric generating-function calculation; hot
blocks use the fingerprint theorem; later segment labels are paid by a named
hot or boundary charge.

### “A final threshold absorbs the entropy”

The proof reduces this to the explicit limit

```text
(2^n/n^3)/n = 2^n/n^4 -> infinity.
```

It then writes the required inequality

```text
(c-2gamma)F_0 >= A_gamma J + log(C/eta).
```

This is an ordinary eventual inequality, not a delegated computation.

### “Taylor errors are small”

The aggregate remainder is bounded by

```text
M_b |m|^3 X^-2 sum_e e^-2
 <= C_{b,C}/(sigma X^2)
 <= C'_{b,C} n/X -> 0.
```

The disk condition has the same `n/X` bound. Both estimates are displayed before
choosing the final scale.

### “The variance is comparable”

The full pair square sum is bounded by

```text
(1/2)(sum_{p in P}p^-2)^2 = O(1/(n^2X^2)),
```

while the bottom internal scaffold gives `sigma^2>>1/(n^2X^2)`. The auxiliary
square sum is `O_{b,G}(X^-6)`. This is the complete comparison.

## 8. Exact uses of squarefreeness

Squarefreeness appears in two logically separate places.

1. **Necessity:** the reduced denominator of a reciprocal sum divides an lcm of
   squarefree denominators.
2. **Sibling detection:** if a frequency agrees with a main label modulo every
   prime divisor of squarefree `b`, then it agrees modulo their product `b`.
   Together with agreement modulo the block-prime product, CRT would make it a
   genuine main frequency.

The second statement would be false for nonsquarefree `b`: agreement modulo the
prime support need not imply agreement modulo the full prime powers.

## 9. Exact fibre and cardinality factors

- The map from a frequency modulo `L=bP` to its block assignment fixes its residue
  modulo `P`; it has exactly `b` lifts.
- There are `2N+1` integer labels in the major window.
- Thus the sibling sector contains at most `b(2N+1)` frequencies.
- One common set of `G` high primes supplies `G` distinct damping factors for
  every sibling.

None of these factors is hidden in `O(1)`.

## 10. Closure classification

- **Mathematical gap:** none.
- **External-source gap:** none beyond citing a standard PNT source in the future
  manuscript.
- **Finite computation delegated to software:** none.
- **Formal correspondence obligation:** none.
- **Circular parameter dependence:** none.
- **Blocked frontier:** none.

The proof packet is therefore ready for a fresh paper-first manuscript.
