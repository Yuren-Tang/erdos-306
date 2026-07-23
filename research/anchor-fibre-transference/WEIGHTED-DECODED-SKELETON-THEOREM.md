# Weighted decoded-skeleton theorem

**Workstream:** `E306-AFT-01`  
**Status:** `GENERAL DETERMINISTIC THEOREM / PROVED`  
**Source boundary:** extracted independently from the frozen checkpoint
`research/e306-frontier-v1@55b05ee5ca7e0c2f47ba4f17c6773defa5ac3951`  
**Authority:** research only; no E306 route correctness is assumed

## 1. Purpose

A fibre argument is useful only if its error is normalized by the actual anchor
partition.  Multiplying an unweighted row error by the raw number of anchor
assignments is generally false and, even when true, usually destroys the estimate.

This note proves the exact deterministic inequality behind weighted anchor--fibre
compression.  The sharp expression is tensorized.  The familiar
`exp(Delta)-1` and `Delta exp(Delta)` bounds are corollaries, not the primary
statement.

The theorem treats:

- arbitrary finite anchor and row-coordinate sets;
- complex amplitudes;
- zero anchor weights;
- zero decoder weights;
- empty coordinate families;
- nonunique decoders;
- factors which are not assigned to a row.

## 2. Exact tensorized theorem

Let `Y` be a finite set and `R` a finite, possibly empty, set.  For each
`r in R`, let `X_r` be a finite nonempty set.  Put

```text
X=product_(r in R) X_r.
```

For each `y in Y`, suppose we are given:

1. an anchor weight `W_y>=0`;
2. row magnitudes
   ```text
   a_(r,y):X_r->[0,infinity);
   ```
3. a chosen decoder `d_r(y) in X_r`;
4. a residual complex factor
   ```text
   H_y:X->C,   |H_y(x)|<=1.
   ```

Write

```text
alpha_(r,y)=a_(r,y)(d_r(y)),
beta_(r,y)=sum_(x_r!=d_r(y)) a_(r,y)(x_r),
d(y)=(d_r(y))_(r in R).
```

Define the complex amplitude

```text
F(y,x)=W_y [product_(r in R) a_(r,y)(x_r)] H_y(x).
```

Empty products are `1`.

### Theorem 2.1 — exact weighted decoded skeleton

One has

```text
sum_(y in Y) sum_(x in X) |F(y,x)|
 <= sum_y W_y [product_r alpha_(r,y)] |H_y(d(y))|
    + sum_y W_y {
        product_r(alpha_(r,y)+beta_(r,y))
        -product_r alpha_(r,y)
      }.
```

More precisely, the complex sum decomposes as

```text
sum_(y,x) F(y,x)
 = sum_y F(y,d(y)) + E_fib,
```

where

```text
|E_fib|
 <= sum_y W_y {
      product_r(alpha_(r,y)+beta_(r,y))
      -product_r alpha_(r,y)
    }.
```

#### Proof

Fix `y`.  Separate the single tuple `d(y)` from all other tuples.  On the
complement use `|H_y(x)|<=1`.  The pure product sum is exactly

```text
sum_x product_r a_(r,y)(x_r)
 =product_r sum_(x_r in X_r)a_(r,y)(x_r)
 =product_r(alpha_(r,y)+beta_(r,y)).
```

The pure product weight of the decoder tuple is `product_r alpha_(r,y)`.
Therefore the total off-decoder absolute mass is at most the difference of the
two displayed products.  Multiplication by `W_y` and summation over `y` proves
the absolute inequality.  Applying the triangle inequality only to the
complex off-decoder sum proves the decomposition and its error bound.  `square`

### Sharpness

For fixed row weights, the tensorized error is optimal among deterministic
bounds using only `alpha` and `beta`: take `H_y(d(y))` arbitrary and set
`|H_y(x)|=1` on every off-decoder tuple.  Then the off-decoder absolute mass is
exactly

```text
W_y {product_r(alpha_r+beta_r)-product_r alpha_r}.
```

Thus `exp(Delta)-1` is convenient but not optimal.

## 3. Normalized forms

Assume now that every `alpha_(r,y)>0`.  Put

```text
epsilon_(r,y)=beta_(r,y)/alpha_(r,y),
A_y=W_y product_r alpha_(r,y),
Delta_y=sum_r epsilon_(r,y).
```

Then Theorem 2.1 becomes

```text
|E_fib|
 <=sum_y A_y {product_r(1+epsilon_(r,y))-1}.
```

Since `1+u<=exp(u)` for `u>=0`,

```text
|E_fib|
 <=sum_y A_y (exp(Delta_y)-1).
```

This weighted average is stronger than a uniform estimate.  If
`Delta_y<=Delta` for every anchor, then

```text
|E_fib|<=Z_dec (exp(Delta)-1),
Z_dec=sum_y A_y.
```

Using `exp(t)-1<=t exp(t)` gives the weaker but sometimes convenient form

```text
|E_fib|<=sum_y A_y Delta_y exp(Delta_y)
```

and, under the same uniform bound,

```text
|E_fib|<=Z_dec Delta exp(Delta).
```

### Corollary 3.1 — decoder-normalized row kernels

Suppose the decoder magnitude of every row kernel is normalized to `1`, so
`alpha_(r,y)=1`, and write

```text
sum_(x_r!=d_r(y)) a_(r,y)(x_r)<=delta_(r,y).
```

Then `A_y=W_y` and

```text
|E_fib|
 <=sum_y W_y {
    product_r(1+delta_(r,y))-1
   }
 <=sum_y W_y(exp(Delta_y)-1),
Delta_y=sum_r delta_(r,y).
```

If `Delta_y<=Delta`,

```text
|E_fib|<=Z_anchor(exp(Delta)-1),
Z_anchor=sum_y W_y.
```

This is the exact form needed when the decoder products have already been
absorbed into the anchor weight.

## 4. Zero weights and degenerate cases

### Zero anchor weights

If `W_y=0`, the anchor contributes nothing to either side.  No convention is
needed.

### Zero decoder weights

If some `alpha_(r,y)=0`, the normalized ratios `epsilon_(r,y)` are not defined.
The exact tensorized theorem remains valid without change.  A proof must not
divide by a decoder weight unless positivity has been established.

If every possible decoder in one row has weight zero but another row value has
positive weight, that row is not decodable in the normalized sense.  The exact
error correctly charges its entire mass.

### Empty coordinate family

If `R` is empty, then `X` is a singleton, all empty products equal `1`, and the
error term is `0`.  The theorem reduces to equality.

### Nonunique decoders

No uniqueness is assumed.  Choose any decoder.  Other minimizers or maximizers
remain in `beta` and are charged as off-decoder mass.  Consequently the theorem
is valid but may be ineffective.  Quantitative uniqueness is a provider
condition, not a logical prerequisite.

### Complex phases

The row functions in Theorem 2.1 are magnitudes.  A complex row kernel
`K_(r,y)(x_r)` is handled by taking `a_(r,y)=|K_(r,y)|`; its phase is retained in
`H_y`.  The theorem does not claim cancellation inside a fibre.

### Unassigned factors

Every factor not deliberately assigned to a row is placed in `H_y`.  The only
compression hypothesis is `|H_y|<=1`.  Evaluating `H_y` on the decoded skeleton
is essential: residual coherent damping and target sensitivity are thereby
retained rather than discarded.

## 5. Conditional and averaged row errors

Uniform row bounds are not necessary.  For each anchor define the exact
normalized tensor error

```text
T_y=product_r(1+epsilon_(r,y))-1.
```

Then

```text
|E_fib|<=sum_y A_y T_y.
```

Hence a weighted average estimate

```text
sum_y A_y T_y<=eta M
```

is sufficient whenever the major contribution has scale `M`.  A small set of
bad anchors is harmless if its total decoded anchor weight is small.  This is
strictly more flexible than requiring one worst-case `Delta`.

Similarly, rows may be divided into deterministic good and bad sets.  Exact
summation over a small bad coordinate set can be combined with Theorem 2.1 on
the remaining rows; the theorem tensorizes in either order.

## 6. Natural interpretation

The theorem is a weighted product-code statement:

```text
anchor Gibbs mass
+ rowwise nearest-codeword concentration
+ retained residual factors
=> decoded-skeleton reduction with a summable error.
```

It is not tied to CRT coordinates, primes, Bernoulli kernels, or reciprocal
sums.  Those enter only through provider estimates for:

- the anchor partition `Z_dec`;
- the row ratios `epsilon_(r,y)`;
- identification of `d(y)`;
- residual damping on the skeleton.

## 7. Classification

```text
EXACT TENSORIZED WEIGHTED SKELETON INEQUALITY — PROVED
AVERAGED AND UNIFORM EXPONENTIAL COROLLARIES — PROVED
ZERO/EMPTY/NONUNIQUE/COMPLEX CASES — INCLUDED
NO ROUTE-SPECIFIC PROVIDER ASSUMED.
```
