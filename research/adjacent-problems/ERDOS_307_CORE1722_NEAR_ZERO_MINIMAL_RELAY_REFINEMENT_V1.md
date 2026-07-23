# Erdős 307: near-zero refinement of the minimal-support core-1722 relay

**Programme:** `E306-RL-ADJ-26`  
**Status:** `EXPLICIT REFINEMENT / NEAR-ZERO POSITIVE RELAY / WOLFRAM-VERIFIED`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

A first core-1722 construction produced a positive-return relay on the minimal total-support layer
`61`.  Its relative return margin was approximately

```text
D^2(Y)/Y-1=2.9662*10^(-5).
```

That block was selected for a small CRT starting point, not for proximity to the exact residual-square
surface.  This note uses the closest reciprocal-threshold block among the one-replacement admissible
family and constructs a second minimal-support relay whose return margin is about twenty-two times
smaller.

## 2. Near-threshold block

Let `Q` be the product of the following `55` primes:

```text
5, 11, 13, 17, 19, 23, 29, 31, 37, 43, 47,
53, 59, 61, 67, 71, 73, 79, 83, 89, 97,
101, 103, 107, 109, 113, 127, 131, 137, 139,
149, 151, 157, 163, 167, 173, 179, 181, 191,
197, 199, 211, 223, 227, 229, 233, 239, 241,
251, 257, 263, 269, 271, 277, 353.
```

This is obtained from the first `55` core-1722 admissible primes by deleting `193` and inserting
`353`.

The exact product is

```text
Q=
93166110938234728595873169855344436912322243286564426841779790209575779362214538795866692057176639901666061895.
```

Its arithmetic derivative is

```text
A=D(Q)=
93112162672844963169648726234391088053151204938525964246637485343306937564594477230886985698163985983118248179.
```

The mass satisfies

```text
1722/1723<A/Q<1,
```

and the excess above the exact threshold is

```text
A/Q-1722/1723
 =1.3284497357307732...*10^(-6).                    (2.1)
```

Among the `143` one-replacement blocks tested for local CRT admissibility, this block has the
smallest positive threshold excess.

## 3. Affine prime solution

As in the companion relay note, seek primes `t,m,r` satisfying

```text
Qt=1723m+1722,                                     (3.1)
At+Q=1722r.                                        (3.2)
```

The CRT class for `t` is

```text
t=2121977 mod 2967006.
```

Writing

```text
t=2121977+2967006 k,
```

small-prime wheel sieving and exact primality tests find

```text
k=21396,
t=63484182353.
```

The corresponding prime outputs are

```text
m=
3432718732398561480033590225395721917914085644516706969533648334727099746838608136288214812093266691729068056792550631,
```

and

```text
r=
3432723295295154259057946190368253207746617472422403433533830902126389211736514104752932881993386873116603650905465881.
```

All three are prime.

## 4. Explicit near-zero relay

Define

```text
X=1722m
 =5911141657190322868617842368131433142648055479857769401536942432400065764056083210688305906424605243157455193796772186582,
```

```text
Y=Qt
 =5914574375922721430097875958356828864565969565502286108506476080734792863802921818824594121236698509849184261853564738935,
```

and

```text
Z=1722r
 =5911149514498255634097783339814132023739675287511378712545256813461642222610277288384550422792612195506791486859212247082.
```

Then

```text
D(X)=Y,
D(Y)=Z.
```

The next derivative is

```text
D(Z)=1723r+1722
 =5914582237793550788356841286004500276947421904983801115978790644363768611822013802489303355674605582379908090510117714685.
```

The exact ordering is

```text
X<Z<Y<D(Z).
```

The positive return overshoot is

```text
D(Z)-Y=
7861870829358258965327647671412381452339481515007472314563628975748019091983664709234437907072530723828656552975750.
```

## 5. Relative margin

The derivative ratios are

```text
D(Y)/Y
 =0.9994209454126728...,
```

and

```text
D^2(Y)/Y
 =1.0000013292369542874745812843995480058....       (5.1)
```

Thus

```text
D^2(Y)/Y-1
 =1.3292369542874746...*10^(-6).                    (5.2)
```

This is approximately:

```text
22 times smaller than the first core-1722 relay margin;
850 times smaller than the recorded core-858 relay margin.
```

The relay remains on the positive side, but is much closer to the exact-zero residual-square
hypersurface.

## 6. Support and independent verification

As before,

```text
omega(Y)=55+1=56,
omega(X)=omega(1722)+1=5,
```

so the total support is the minimal value

```text
61.
```

A Wolfram-language calculation independently returned:

```text
all 55 Q-factors prime = True;
t prime = True;
m prime = True;
r prime = True;
Qt=1723m+1722 = True;
At+Q=1722r = True;
X<Z<Y<D(Z) = True;
omega(Y)=56;
omega(X)=5;
gcd(X,Y)=gcd(Y,Z)=1;
1722/1723<A/Q<1 = True;
return margin
 =1.329236954287474581284399548005817...*10^(-6).
```

## 7. Mechanism assessment

The existence of two minimal-layer core-1722 relays, including one arbitrarily selected for a small
CRT start and one selected for threshold proximity, shows that:

1. minimal-support positive relays are not isolated arithmetic accidents;
2. reciprocal mass can be tuned very close to the residual-square threshold while preserving a
   simultaneous three-prime affine solution;
3. support and return margin are separate optimization coordinates;
4. exact zero is a lattice/intersection problem, not a mere approximation problem.

The next exact search should use this near-zero block as one reservoir in a balanced complement-jet
meet-in-the-middle, but should not attempt local one-prime replacements: previous defect-exchange and
ordered-tail diagnostics show that exact complements have high code distance.

## 8. Classification

```text
CORE-1722 NEAR-THRESHOLD 55-PRIME BLOCK — CONSTRUCTED
THREE AFFINE PRIME FORMS — SOLVED EXPLICITLY
MINIMAL SUPPORT 61 — ATTAINED
RELATIVE RETURN MARGIN 1.32924*10^(-6) — VERIFIED
EXACT ZERO — NOT ATTAINED
CORE-1722 E307 FILLING — OPEN
```

No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed.
