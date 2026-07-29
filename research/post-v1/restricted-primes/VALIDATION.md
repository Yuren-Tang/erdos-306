# Validation — fixed-progression restricted semiprimes

## Validation target

The validated claim is Theorem A in
`FIXED_PROGRESSION_RESTRICTED_SEMIPRIMES.md` for a fixed modulus `m` and a fixed nonempty union `C` of reduced residue classes modulo `m`.

The validation is source-comparative and mathematical.  No manuscript build, Lean build, workflow, release, DOI, or publication operation is part of this role.

## 1. Control and branch validation

- Authorised starting head: `f03105e95dc2ec5595a931293f6ca951e4bc424a`.
- Dedicated branch checked before mutation: `research/e306-post-v1-restricted-primes-v1`.
- Comparison before ACK: branch and authorised head were identical (`ahead_by=0`, `behind_by=0`).
- ACK posted to `Yuren-Tang/research-workbench#116` before the first write.
- Write scope is confined to the four files under `research/post-v1/restricted-primes/` named in the role packet.

## 2. Arithmetic-input validation

Let `delta=|C|/phi(m)`.

### Fixed-ratio count

The fixed-modulus PNT/AP gives, after summing over `C`,

`pi_C(x)=delta Li(x)+o(x/log x)`.

For every fixed `0<u<v`, subtraction at `uy` and `vy` gives

`#(P_C intersect [uy,vy])=(delta(v-u)+o(1))y/log y`.

Only fixed ratios occur: the anchor interval, the variance interval, and the adaptive interval after its scale `y=sqrt|n|` is chosen.  The modulus remains the original fixed `m`.

### Reciprocal first moment

Partial summation gives

`S_1=sum_{X<=p<X^A,p in P_C}1/p=delta log A+o(1)`.

With

`A=exp(sqrt(3/2)/delta)`,

one obtains

`S_1=sqrt(3/2)+o(1)`

and hence

`(S_1^2-S_2)/2=3/4+o(1)`.

### Reciprocal-square moments

Dyadic upper bounds and the lower contribution from `[X,2X)` yield

`sum_{X<=p<X^A,p in P_C}1/p^2=Theta(delta/(X log X))`.

Therefore the complete-pair square load is

`Theta(delta^2/(X^2 log^2 X))`.

On the anchor interval,

`M=Theta(delta Z/log Z)`,

`V_B=Theta(delta/log Z)`,

`W_B=Theta(delta/(Z log Z))`.

All density powers used later are consistent with these moments.

## 3. Load and Bernoulli validation

The complete-pair load tends to `3/4`; the fixed target-row load is `o(1)`.  Thus fixed constants may be chosen with

`1/2<lambda_-<3/4<lambda_+<1`

and eventually

`lambda_-<Lambda<lambda_+`.

For every fixed `b>=2`,

`theta=1/(bLambda)`

lies in a compact subinterval of `(0,1)`.  For `b=2`, the strict lower bound `Lambda>1/2` is exactly what ensures `theta<1`.  For every `b>=2`, `Lambda<1` supplies the no-wrap bound.

The target-row square load is

`O_b(delta/(Z log Z))`.

Its ratio to the bulk pair square load is

`O_b(X^2 log^2 X/(delta Z log Z))=o(1)`

because `Z=X^A` and `A>2`.

Hence

`sigma_E^{-1}=Theta_{b,m,C}(X log X)`.

## 4. Density-loss ledger

| Component | Unrestricted scale | Restricted scale | Source of loss |
|---|---:|---:|---|
| allowed primes in anchor | `Z/log Z` | `delta Z/log Z` | one vertex count |
| anchor square scale | `1/(Z^2log^2Z)` | `delta^2/(Z^2log^2Z)` | two anchor endpoints |
| nondominant forcing | `Z/log^3Z` | `delta^3 Z/log^3Z` | cubic cardinality term |
| exact-rigidity floor | `Z/log^3Z` | `c_delta Z/log^3Z` | same cubic term and integer closure |
| fingerprint entropy | `exp(o(R))` | `exp(o_delta(R))` | reduced available vertex count; no exponent-order loss |
| anchor partition | `O(ZlogZ)` | `O_delta(ZlogZ)` | constants only |
| lower-row distance | `Z/log^3Z` | `delta^3 Z/log^3Z` | cubic row-neighbour count |
| target-row distance | `Z/log Z` | `delta Z/log Z` | one neighbour count |
| decoder cutoff | `XZ/log^2Z` | `delta XZ/log^2Z` | calibrated against lower-row distance |
| adaptive residual energy | `|n|/log^2|n|` | `delta^2|n|/log^2|n|` | two retained endpoints |
| Sector IV exponent | `X^2/log^6Z` | `delta^4X^2/log^6Z` | decoder squared times anchor square scale |

Every loss is by a fixed positive power of the fixed number `delta`; none changes the asymptotic sign of a required divergence or decay.

## 5. Moving-row-prime audit

The lower-row argument does not use the distribution of allowed primes modulo the row prime `r`.

The only multiplicity estimate is the ambient one:

`mu_r <= Z/(2r)+1 <= 2Z/r`.

It holds for every subset of the interval `[Z/2,Z)`, hence in particular for the allowed anchor primes.  Combining it with

`M=Theta(delta Z/log Z)`

gives

`D_r >= c M^3/(mu_r^2r^2) >= c_delta Z/log^3Z`.

This closes the principal hidden-assumption risk identified by the feasibility return.

## 6. Target-coordinate observability audit

For every `r|b`, support admissibility gives `r in P_C`; therefore all target-star denominators `rq`, `q in B`, belong to the authorised family.

For a coordinate shift `d mod r`, the row phases are indexed by `d q^{-1} mod r`.  Since every `q` is invertible modulo `r`, vanishing of all row syndromes implies `d=0`.  Thus the sensor map has trivial kernel.

Quantitatively, every nonzero syndrome has squared distance at least `1/r^2`, and there are `M` neighbours, so

`D_r>=M/r^2=Omega_{b,m,C}(delta Z/log Z)`.

At the Sector II cutoff `|n|<=X^2/4`, the candidate-to-distance ratio is

`O_b(X^4 W_B/D_r)=O_b(X^4/Z^2)=o(1)`

because `A>2`.

## 7. Scale-chain validation

With

`M_dec=c_0 delta XZ/(log Z)^2`,

the required inequalities are:

1. `sigma_E^{-1}=Theta(XlogX)=o(X^2)`;
2. `X^2=o(M_dec)`;
3. `M_dec=o(Z^2)`;
4. `M_dec^2 sigma_{B,0}^2=Theta(delta^4X^2/log^6Z)->infinity`;
5. `3sqrt(M_dec)=o(Z)`, so the adaptive interval lies below the anchor;
6. target candidate energy divided by target distance is `O_b(X^4/Z^2)=o(1)`.

All follow from fixed `delta>0`, fixed `A>2`, and `Z=X^A`.

## 8. Five-sector audit

- **Sector I:** `N=floor(C/sigma_E)=Theta(XlogX)`.  Exact centring removes the linear phase.  The cubic Taylor remainder is `O_{b,m,C}(C^3 log X/X)=o(1)`.
- **Sector II:** all lower and target rows are decoded through `X^2/4`; the actual-family variance gives the Gaussian tail.
- **Sector III:** for `y=sqrt|n|`, fixed-ratio PNT/AP supplies `Theta(delta y/log y)` allowed primes in `[2y,3y]`; complete retained pairs give `Omega(delta^2|n|/log^2|n|)` energy.
- **Sector IV:** the exponent `M_dec^2 sigma_{B,0}^2` tends to infinity.
- **Sector V:** the noncoherent anchor tail and summed fibre error decay exponentially in `c_delta Z/log^3Z`, dominating polynomial partition factors.

The sectors are disjoint and exhaust all frequency labels after CRT fibre compression, exactly as in the source architecture.

## 9. Closure and avoidance audit

- Finite avoidance is obtained by choosing `X` so that every constructed denominator exceeds the largest forbidden denominator.
- For supported squarefree `b>=2`, the Fourier proof directly gives an avoiding representation of `1/b`.
- `b=2` is included precisely when `2 in P_C`; the calibrated load makes the Bernoulli parameter admissible.
- Numerator induction repeatedly invokes the avoiding `1/b` theorem with all previously used denominators added to the forbidden set.
- For `b=1`, choose an allowed auxiliary prime `r_0`, prove `1/r_0`, and use numerator induction up to `r_0/r_0=1`; then induct on the integer numerator.

## 10. Necessity audit

The least common multiple of all chosen denominators is squarefree and has prime support contained in `P_C`.  The reduced denominator divides this LCM.  Hence squarefreeness and allowed-prime support are both necessary.  No converse condition has been omitted.

## 11. Exclusion audit

The dossier does not claim:

- a theorem for moving moduli;
- a Chebotarev theorem;
- an arbitrary positive-density-set theorem;
- deletion resilience;
- a graph-transference theorem;
- bipartite factor restrictions;
- any manuscript or Lean modification.

## Validation disposition

All required source mechanisms admit the displayed fixed-density substitutions, and every scale inequality closes for the load-calibrated fixed exponent `A=exp(sqrt(3/2)/delta)>2`.  No exact remaining mathematical obstruction was found for the stated fixed-progression theorem.

**Disposition: proved at authorial-dossier level; ready for independent mathematical audit.**