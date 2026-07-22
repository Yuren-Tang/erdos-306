# E306-PD-OA1-01 — dependency and parameter ledger

**Proof controlled by:** `proof-development/ONE-ANCHOR-HUMAN-PROOF.md`  
**Purpose:** expose every premise, quantifier, fibre factor, scale threshold, and terminal dependency.

## 1. Premise ledger

The proof has one external mathematical premise:

```text
PNT: pi(x) ~ x/log x.
```

It is used only through ordinary deductions proved in the human proof:

1. tail-uniform prime counts on fixed-ratio intervals;
2. `sum_(X<=p<X^3)1/p=log3+o(1)` by Abel summation;
3. `sum_(X<=p<X^3)1/p^2=O(1/(XlogX))`;
4. `|B|asymp Z/logZ` for `B=[Z/2,Z)`;
5. top-block reciprocal and square-reciprocal estimates;
6. prime supply in `[2sqrt(|m|),3sqrt(|m|)]`.

No PNT in arithmetic progressions is used.  In particular, the fixed row `r|b` is handled term by term rather than by an equidistribution claim.

Every other input is finite Fourier inversion, CRT, unique factorization, elementary combinatorics, Gaussian summation, or compact Taylor expansion.

## 2. Fixed arithmetic data

At the beginning of the avoiding theorem, fix:

```text
b>=3 squarefree;
T finite;
lambda_-,lambda_+ with
  1/3<lambda_-<(log3)^2/2<lambda_+<1;
rho in (0,1/4).
```

The repaired one-block proof then fixes:

```text
A_rho large enough for the bad-degree bound;
c_D,c_E>0 from dispersion;
c_w>0 below both the nondominant forcing constant
  and the zero-exception constant.
```

These constants are independent of `X` and are never redefined.

## 3. Scale-defined objects

After the terminal scale `X` is chosen, define

```text
Z=X^3;
P={p prime:X<=p<Z};
B={q prime:Z/2<=q<Z};
S_b={r prime:r|b};
E_pair={pq:p,q in P,p<q};
E_b={rq:r in S_b,q in B};
E=E_pair disjoint-union E_b;
L=b product_(p in P)p;
Lambda=sum_(e in E)1/e;
theta=1/(bLambda).
```

The objects depend on the already fixed data and the final scale only.

## 4. Compact Fourier constants

The load interval gives

```text
I_b=[1/(b lambda_+),1/(b lambda_-)] subset (0,1).
```

Compactness determines fixed constants:

```text
nu_b=min_(theta in I_b)theta(1-theta)>0;
kappa_b>0 with
 |(1-theta)+theta e(t)|<=exp(-kappa_b||t||^2);
rho_b>0 and M_b<infinity for the uniform logarithmic Taylor expansion;
a_b>0 and c_maj>0 for the real major lower bound;
c_G>0 for the Gaussian tail.
```

None depends on `C` or `X`.

## 5. Theorem dependency table

| Node | Statement | Direct inputs | Status |
|---|---|---|---|
| `H0` | headline iff theorem | `H1`,`H2`,`H3`,`H4` | proved |
| `H1` | squarefree necessity | lcm identity | proved |
| `H2` | avoiding unit theorem | `P2`,`D2` | proved |
| `H3` | numerator induction | `H2` with enlarged forbidden set | proved |
| `H4` | cases `b=1,2` | elementary identities + avoidance | proved |
| `A1` | tail-uniform fixed-ratio prime count | PNT | proved |
| `A2` | power-interval reciprocal sum | PNT + Abel summation | proved |
| `A3` | reciprocal-square bounds | `A1` | proved |
| `D1` | complete-pair load | `A2`,`A3` | proved |
| `D2` | distinctness, avoidance, period divisibility | unique factorization | proved |
| `D3` | full-top auxiliary load and square load | `A1`,`A3` | proved |
| `D4` | compact `theta`, no-wrap | `D1`,`D3` | proved |
| `D5` | `sigma_E^2 asymp 1/(X^2log^2X)` | bottom pair lower bound + `A3`,`D3` | proved |
| `F1` | exact finite Fourier identity | character orthogonality | proved |
| `F2` | Fourier-energy majorant | `D4` + sine inequality | proved |
| `B1` | reciprocal dispersion | congruence-fibre count | proved |
| `B2` | repaired cross-label energy | `B1`, explicit `s>=16` | proved |
| `B3` | repaired nondominant forcing | `B2`, zero case, corrected class sum | proved |
| `B4` | zero-exception label theorem | `B1`,`B3` | proved |
| `B5` | fingerprint rigidity | `B1` | proved |
| `B6` | uniform fingerprint entropy | `B5`, two energy ranges | proved |
| `T1` | top forcing floor | `B4` on `B` | proved |
| `T2` | top high-energy tail | `B6`,`F2` | proved |
| `T3` | full top partition `O(ZlogZ)` | `T1`,`T2`, Gaussian sum | proved |
| `R1` | multiplicity cyclic lemma | elementary residue count | proved |
| `R2` | uniform row distance for `P\B` | `R1`,`A1` | proved |
| `R3` | strong fixed row distance for `r|b` | each nonzero residue has distance `>=1/r` | proved |
| `R4` | row product tail | `R2` or `R3`,`F2` | proved |
| `R5` | summed row error `Delta` | `R4`, row count | proved |
| `S1` | retained-skeleton inequality | product expansion | proved |
| `S2` | globally summed fibre error | `S1`,`R5`,`T3` | proved |
| `C1` | prime-coordinate decoder identification | `R2`,`A3` | proved |
| `C2` | `b`-coordinate decoder identification | `R3`,`A3` | proved |
| `C3` | decoded frequency equals integer for small labels | `C1`,`C2`, squarefree `b` | proved |
| `I1` | adaptive interval containment | definitions of `M_dec`,`Z` | proved |
| `I2` | adaptive prime supply | `A1` | proved |
| `I3` | adaptive pair energy | `I1`,`I2`,`C1` | proved |
| `X1` | exact five-sector partition | `T1`,`S1`, coordinate bijection | proved |
| `M1` | positive Taylor major | `F1`,`D4`,`D5`,`C3` | proved |
| `m1` | Gaussian tail | `F2`,`D5`,`C3` | proved |
| `m2` | adaptive sector | `I3` | proved |
| `m3` | top-label tail | `T1`, top variance | proved |
| `m4` | noncoherent/fibre sector | `T2`,`S2` | proved |
| `P1` | strict Fourier positivity | `M1`,`m1`–`m4` | proved |
| `P2` | exact reciprocal equality | `P1`,`D4` no-wrap | proved |

There is no unresolved node.

## 6. Exact coordinate and denominator ledger

Because `b` is squarefree and `P` excludes its prime support,

```text
L=product_(r in S_b)r * product_(p in P)p
```

is squarefree.  The CRT map from frequencies to all prime coordinates is a bijection.  Therefore:

- a fixed complete coordinate tuple has exactly one frequency modulo `L`;
- a fixed top assignment has exactly `product_(r in R_rows)r` lower coordinate points, with no extra multiplicity;
- after all rows decode in the small range, there is exactly one genuine integer frequency;
- there is no factor `b`, no family of `b` lifts, and no sibling remainder.

The denominator assignment in the retained-skeleton proof is exact:

| denominator | assigned component |
|---|---|
| `qq'`, `q,q' in B` | internal top factor `T_B` |
| `rq`, `r in P\B`, `q in B` | lower-prime row kernel `A_r` |
| `rq`, `r|b`, `q in B` | fixed `b`-row kernel `A_r` |
| `pp'`, `p,p' in P\B` | retained residual product `G` |

These classes are disjoint and cover `E`.  No denominator factor is used twice.

## 7. Quantitative scale ledger

Write

```text
M=|B|asymp Z/logZ;
sigma_B0^2=sum_(q<q' in B)1/(q^2q'^2)
asymp 1/(Z^2log^2Z);
F_Basymp Z/log^3Z;
M_dec=XZ/(logZ)^2.
```

The row estimates are:

```text
r in P\B:
  mu_r<=Z/(2r)+1,
  D_r>>M^3/(mu_r^2r^2)>>Z/log^3Z;

r|b:
  D_r>=M/r^2>>_b Z/logZ;

delta_r<=r exp(-cD_r);
Delta<=Z^2exp(-cZ/log^3Z).
```

The decoder comparisons are:

```text
E_r(m)<=m^2W_B/r^2,
W_B=O(1/(ZlogZ));

|m|<=M_dec, r>=X:
  E_r(m)<=O(Z/log^5Z)=o(Z/log^3Z);

|m|<=X^2/4, r|b:
  E_r(m)=O_b(X/logX)=o_b(Z/logZ).
```

The top/fibre error is:

```text
P_top<=CZlogZ;
P_top(exp(Delta)-1)
 <=CZlogZ * O(Z^2exp(-cZ/log^3Z))=o(1).
```

The adaptive estimate is:

```text
X^2/4<|m|<=M_dec
 => [2sqrt|m|,3sqrt|m|] subset [X,Z/2)
 => K_m>>sqrt|m|/log|m|
 => Q_pair(m)>>|m|/(log|m|)^2.
```

The top-label exponent is:

```text
M_dec^2sigma_B0^2>>X^2/log^6Z.
```

Every non-Gaussian minor term therefore tends to zero faster than any reciprocal power required by `1/sigma_Easymp XlogX`.

## 8. Five-sector cardinality ledger

Let `N=floor(C/sigma_E)`.  For large `X`, `N<X^2/4<M_dec`.

| Sector | Index set | Count/partition factor | Bound |
|---|---|---|---|
| I | exact labels `|m|<=N` | `2N+1` genuine frequencies | positive `>=c_maj/sigma_E` |
| II | `N<|m|<=X^2/4` | one genuine frequency per label | Gaussian tail `O(sigma_E^-1e^{-cC^2})` |
| III | `X^2/4<|m|<=M_dec` | at most `2M_dec+1` decoded skeletons | `O(X^4e^{-cX^2/log^2X})` |
| IV | coherent `|m|>M_dec` | Gaussian label sum | `O(sigma_B0^-1e^{-cX^2/log^6Z})` |
| V-a | noncoherent top assignments | top entropy shell sum | `O(e^{-cF_B})` |
| V-b | all nondecoder fibres | top partition times row error | `O(ZlogZ(e^Delta-1))` |

No sector contains an unspecified multiplicity.

## 9. Terminal parameter order

There are no terminal parameters `eta` or `G`.  After fixed structural constants, the order is exactly

```text
C -> X.
```

### Step 1 — choose `C`

The major coefficient `c_maj` and Gaussian constant `c_G` are fixed.  Choose `C>=1` such that

```text
K_b exp(-c_GC^2/2)<c_maj/8.
```

This makes Sector II less than one eighth of the major scale.

### Step 2 — choose `X`

Choose `X` above the maximum of all thresholds in Section 10.  The limits for Sectors III–V then make their sum less than, for example,

```text
3c_maj/(8sigma_E).
```

Together with Sector II, the total minor absolute sum is below `c_maj/(2sigma_E)`.

Nothing is chosen after `X` except objects defined by `X`.

## 10. Final threshold ledger

The final `X` is the maximum of thresholds for:

### Analytic supply

- tail-uniform PNT on `[X,X^3)` and `[Z/2,Z)`;
- Abel-sum accuracy placing `Lambda` in `(lambda_-,lambda_+)`;
- reciprocal-square bounds and the lower pair-variance bound;
- uniform PNT on every adaptive interval, whose lower scale is at least `X/2`.

### Arithmetic and avoidance

- every prime in `P` exceeds every prime divisor of `b`;
- all denominators exceed every member of `T` when `T` is nonempty;
- pair/auxiliary distinctness;
- `L` is larger than the centred major-label range;
- `Lambda<1`.

### One-block base

- the dispersion close-residue count;
- `B_0<Y^2/4` in nondominant forcing;
- substantial classes satisfy the repaired `s>=16` hypothesis;
- the corrected `(t-1)` cross-class comparison;
- the strict integer bound giving zero exceptions;
- fingerprint size in `[16,N/2]`;
- the high-energy trivial entropy comparison.

### Top partition

- `F_Basymp Z/log^3Z`;
- exact labels have centred lifts on all top pairs;
- fingerprint entropy coefficient below the Fourier exponent;
- Gaussian top partition `O(ZlogZ)`.

### Row decoding

- `M/mu_r` large uniformly for all `r in P\B`;
- cyclic distance constants;
- `Delta<1`;
- `E_r(m)<D_r/8` in both decoder ranges;
- `N<X^2/4<M_dec`.

### Adaptive interval

- `2sqrt|m|>X` at the strict lower sector boundary;
- `3sqrt(M_dec)<Z/2`;
- at least two primes in every adaptive interval;
- endpoint and integer-rounding changes absorbed by the PNT lower bound.

### Fourier major and budgets

- Taylor disk condition;
- aggregate cubic remainder below the fixed real-part allowance;
- the major interval contains `|m|<=1/(4sigma_E)`;
- Sectors III–V and fibre error satisfy their strict final budget shares.

Every threshold depends only on fixed earlier data and the already chosen `C`; their maximum is finite.  The choice is non-circular.

## 11. Exact uses of squarefreeness

Squarefreeness is used in three transparent places:

1. **necessity:** a reduced denominator divides an lcm of squarefree denominators;
2. **coordinate product:** `L` is squarefree, so all prime coordinates form an exact CRT product with no prime-power coordinates;
3. **decoder closure modulo `b`:** agreement modulo every prime divisor of `b` is agreement modulo `b`.

The second and third uses are the one-anchor replacement for the old sibling analysis.

## 12. Closure classification

- mathematical gap: none found;
- false route step: none after the stated local corrections;
- external-source gap: none beyond a standard PNT citation in a future manuscript;
- hidden formal premise: none;
- hidden fibre factor: none;
- unassigned denominator factor: none;
- circular parameter dependence: none;
- unresolved endpoint: none.

The packet is ready for independent route audit.