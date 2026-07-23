# Bipartite plaquette metastability: an exact CRT counterexample

**Programme:** `E306-RL`  
**Research unit:** `E306-RL-PF1A-06`  
**Status:** `EXACT COUNTEREXAMPLE / DESIGN OBSTRUCTION / NOT AN E306 ROUTE FAILURE`  
**Date:** 2026-07-23

## 1. Purpose

The sparse-synchronization route still uses deterministic exact-cold rigidity on the
retained witness block.  A tempting next simplification is to delete the internal
witness energy and argue only from the bipartite core--witness factors, perhaps by
alternating nearest-decoder compression on the two sides.

This note shows that the naive theorem is false.  A bipartite CRT system can have a
non-diagonal mutual nearest-decoder fixed point with very small cross energy.  The
obstruction is a four-cycle or **plaquette mode** supported by an additive rectangle
of moduli.

The counterexample does not invalidate the current sparse-anchor route, because
that route retains the complete internal witness energy.  It explains why that
input is not automatically removable by symmetric fibre compression.

## 2. Bipartite CRT energy

For coprime moduli `r,s`, residues `x mod r`, `y mod s`, let

```text
H_(r,s)(x,y)
```

be the centred CRT lift in `[-rs/2,rs/2)`.  Put

```text
phi_(r,s)(x,y)=H_(r,s)(x,y)/(rs)
```

and use squared energy `phi^2`.

For a bipartite graph with row moduli `R` and column moduli `S`, define

```text
Q(x,y)=sum_(r in R,s in S) phi_(r,s)(x_r,y_s)^2.
```

A mutual nearest-decoder fixed point means:

1. for every row `r`, `x_r` is the unique minimizer of its incident energy with
   the column assignment fixed;
2. for every column `s`, `y_s` is the unique minimizer of its incident energy with
   the row assignment fixed.

The false candidate principle would assert that every sufficiently low-energy
mutual fixed point is induced by one short integer label.

## 3. Exact prime plaquette

Take column primes

```text
S={23,29}
```

and row primes

```text
R={31,37}.
```

They satisfy the additive-rectangle identity

```text
23+37=29+31=60.
```

Choose residues

```text
y_23=0,   y_29=2,
x_31=0,   x_37=23.
```

The four centred edge lifts are exactly

```text
H_(31,23)=0,
H_(31,29)=31,
H_(37,23)=23,
H_(37,29)=60.
```

Indeed:

- `31` is `0 mod 31` and `2 mod 29`;
- `23` is `23 mod 37` and `0 mod 23`;
- `60` is `23 mod 37` and `2 mod 29`.

All four integers lie in the centred ranges of the corresponding products.
Therefore the edge phases are

```text
0,
1/29,
1/37,
60/(37*29).
```

The total bipartite energy is

```text
Q
 =1/29^2+1/37^2+60^2/(37^2*29^2)
 =5810/1151329
 <0.0051.
```

## 4. Exact mutual best-response verification

Every coordinate minimizer is unique.  The following table records the chosen
minimum and the next-smallest energy; all entries are exact rational numbers.

| coordinate | chosen residue | minimum energy | next-smallest energy |
|---|---:|---:|---:|
| row `31` | `0` | `1/841` | `8066/808201` |
| row `37` | `23` | `4441/1151329` | `16592/1151329` |
| column `23` | `0` | `1/1369` | `22100/724201` |
| column `29` | `2` | `4969/1151329` | `12850/1151329` |

These values come from direct enumeration over respectively `31`, `37`, `23`, and
`29` residues.  Since the displayed second value is strictly larger in every row,
the stated assignment is a strict mutual nearest-decoder fixed point.

The complete four-coordinate CRT modulus is

```text
23*29*31*37=765049.
```

The least-absolute common representative of the four vertex residues is

```text
m=-127627.
```

Thus the fixed point is not a short integer diagonal; its four small edge lifts do
not arise from one common small integer.

## 5. Why the plaquette is cheap

The construction is an additive rectangle.  In general, suppose pairwise coprime
moduli `a,b,c,d` satisfy

```text
a+d=b+c=L.
```

On the `K_(2,2)` with columns `a,b` and rows `c,d`, assign

```text
y_a=0,
y_b=c mod b,
x_c=0,
x_d=a mod d.
```

Then the compatible edge lifts are

```text
0, c, a, L.
```

When all moduli are of scale `Z`, the cross energy is `O(Z^(-2))`.  This is a
cycle-space mode: the four small edge representatives fit around one arithmetic
rectangle although no single small integer represents all four vertices.

Prime additive rectangles are not exceptional at the combinatorial level.  A
prime interval containing `N` primes has `N(N-1)/2` positive pair differences but
only `O(Z)` possible difference values.  Once `N^2>>Z`, some prime difference is
repeated, yielding two prime pairs with the same gap and hence an additive
rectangle.  PNT gives `N asymp Z/log Z` in a fixed-ratio top interval, so repeated
gaps occur abundantly for large `Z`.

This observation alone does not embed an isolated plaquette as a low-energy mode
of the full complete bipartite block: extra incident edges may destroy it.  It does
show that any sparse bipartite synchronization theorem must control its cycle
space and cannot rely only on local nearest-decoder conditions.

## 6. Same-side edges destroy the example

For the two row residues, the internal witness edge has phase

```text
phi_(31,37)(0,23)=-10/37
```

and energy

```text
100/1369 >0.073.
```

For the two column residues, the internal core edge has phase

```text
phi_(23,29)(0,2)=-10/29
```

and energy

```text
100/841 >0.118.
```

Either same-side interaction is more than an order of magnitude larger than the
entire four-edge bipartite energy.  The complete internal witness energy in the
current sparse-synchronization proof therefore removes precisely this kind of
plaquette metastability.

## 7. Consequence for theorem design

The following implication is false in general:

```text
strong row distance
+ strong column distance
+ mutual nearest-decoder fixed point
=> short integer diagonal.
```

Local code distance controls movement of one coordinate with the opposite side
frozen.  It does not control a coordinated move around a bipartite cycle.

Any attempt to remove deterministic witness rigidity must add at least one genuinely
global ingredient, for example:

1. same-side witness interactions;
2. a high-girth or cycle-expansion theorem excluding arithmetic plaquettes;
3. a direct bound on the cycle-space partition rather than only vertex fibres;
4. complex Fourier cancellation among metastable modes;
5. a joint decoder theorem with a hypothesis stronger than mutual local optimality.

The correct remaining frontier is therefore not generic `direct bipartite
rigidity`, but one of:

```text
ARITHMETIC CYCLE-SPACE RIGIDITY
```

or

```text
COMPLEX CANCELLATION OF PLAQUETTE MODES.
```

## 8. Disposition

Established:

```text
EXACT K_(2,2) CRT PLAQUETTE COUNTEREXAMPLE;
STRICT NON-DIAGONAL MUTUAL DECODER FIXED POINT;
SAME-SIDE WITNESS ENERGY KILLS THE MODE.
```

Not established:

```text
an asymptotic counterexample inside the full complete bipartite prime block;
a lower bound proving dense witness rigidity is quantitatively optimal.
```

Hence this note narrows the research frontier without changing the status of the
current sparse-synchronization route.

No proof-development, review, manuscript, Curator, Lean, release, DOI, arXiv, or
canonical status changes through this counterexample.
