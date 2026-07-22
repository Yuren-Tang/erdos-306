# Erdős 306 article / formalization correspondence

> Repository-only control record. This file is excluded from the public arXiv source package.

Task: `E306-P1-REV3`  
Public formalization citation: `10.5281/zenodo.20767389`

## Public boundary

The article cites the machine-checked formalization solely through the Zenodo record.  It contains no GitHub identifier, development checkpoint, internal review record, workflow instruction, or Lean declaration inventory.  The public code-availability note states only that:

- the article gives a PNT-based analytic presentation;
- the archived formalization uses explicit Rosser-Schoenfeld estimates;
- the formalization represents the finite denominator set by a finite increasing tuple;
- that tuple representation is equivalent bookkeeping, not a stronger public theorem;
- the archive supports verification but does not replace the printed proof.

## Mathematical correspondence

| Article component | Formalization relationship |
|---|---|
| Squarefree-semiprime criterion and headline theorem | Same public mathematical content. |
| PNT and Abel-summation local law | Article-only analytic presentation. |
| Eventual dyadic density and inclusive reciprocal mass | Same construction consequences; the archive obtains them from explicit estimates. |
| Finite Fourier identity and no-wrap conversion | Same finite argument. |
| Control graph, low-energy blocks, level sets, and localization | Same construction architecture, stated mathematically in the article. |
| Pair family, weights, major/minor estimates, and positivity | Same finite construction, with all load-bearing estimates printed. |
| Finite set versus finite increasing tuple | Equivalent finite representations; no infinite sequence and no stronger endpoint. |

## Citation rule

Public text and metadata should use:

`Tang, Yuren. A Machine-Checked Proof of Erdős Problem 306 in Lean 4. Zenodo. doi:10.5281/zenodo.20767389.`

No public statement should imply that the article's PNT bridge is formalized in the archive or that formal verification substitutes for a missing paper proof.
