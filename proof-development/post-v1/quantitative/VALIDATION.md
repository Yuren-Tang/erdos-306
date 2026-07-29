# Validation

## Control validation

- Authorized branch: `proof-development/e306-post-v1-quantitative-v1`.
- Authorized starting head: `f03105e95dc2ec5595a931293f6ca951e4bc424a`.
- Pre-write comparison: branch and authorized head were identical (`ahead_by=0`, `behind_by=0`).
- Required ACK was posted to `Yuren-Tang/research-workbench#115` before the first repository write.

## Scope validation

Only the following four paths are created by this role:

- `proof-development/post-v1/quantitative/QUANTITATIVE_COEFFICIENT_AND_MULTIPLICITY.md`
- `proof-development/post-v1/quantitative/SOURCE_MAP.md`
- `proof-development/post-v1/quantitative/VALIDATION.md`
- `proof-development/post-v1/quantitative/RECOVERY_MANIFEST.md`

No `paper/**`, `lean/**`, workflow, `main`, tag, release, Zenodo, DOI, PR, or `Yuren-Tang/mathematics` surface is modified.

## Mathematical validation checklist

### 1. Coefficient lower bound

Validated directly from the strict budget:

`1 - 1/8 - 3/8 = 1/2`.

Hence `L_XP_X >= c_maj(b)/(2sigma_X)` for all sufficiently large `X` after the article's terminal order of choices.

### 2. Weighted-to-unweighted conversion

For every `k`,

`theta_X^k(1-theta_X)^{M_X-k} <= max(theta_X,1-theta_X)^{M_X}`.

No inequality direction is reversed and no assumption on equal cardinalities is used.

### 3. Iterated local-limit quantifiers

The proof is stated as:

1. fix `C`;
2. take `X->infinity`, using uniform Sector I error, the Sector II limsup bound, and fixed-`C` Sector III--V decay;
3. take `C->infinity`.

No diagonal `C(X)`, natural-scale conditional CLT, or bivariate frequency estimate is invoked.

### 4. Entropy window

With `w_X=ceil(2sqrt(M_X log L_X))`, one has

`sqrt(M_X)<<w_X=o(M_X)`

because `log L_X->infinity` and `log L_X=o(M_X)`.  Hoeffding gives an off-window probability at most `2L_X^{-8}`, which is `o(P_X)` by the coefficient lower bound.  The Bernoulli atom calculation is exact up to a linear displacement term `O_b(w_X)`.

### 5. Exact-cardinality extraction

The number of integers in the window is at most `2w_X+1=exp(o(M_X))`; division by this subexponential number preserves the exponent `H(alpha_b)`.

### 6. Small denominators

The dossier explicitly separates `b=1,2`.  It records only the article's closure constructions and does not transfer one-family constants, local limits, or multiplicity exponents to those cases.

### 7. Deletion counterexample

After deleting `{rq:q in B}` for a fixed `r|b`, every remaining denominator is coprime to `r`; therefore each remaining weight `L_X/e` is divisible by `r`, while `L_X/b` is not.  The deleted row has size asymptotic to `X^3/(6log X)=o(M_X)`.  This disproves arbitrary `o(M_X)` in-family deletion resilience.

## Exclusion validation

The dossier contains no claim of:

- conditional CLT at `sqrt(M_X)` scale;
- bivariate local limit theorem;
- prescribed-cardinality asymptotic;
- structural deletion resilience;
- quantitative `b=1,2` theorem;
- manuscript or publication action.

## Validation outcome

All seven required proof-development items are discharged within the stated theorem boundary.  The dossier is ready for independent mathematical audit; it is not yet an audited theorem source and must not be represented as incorporated into the article.
