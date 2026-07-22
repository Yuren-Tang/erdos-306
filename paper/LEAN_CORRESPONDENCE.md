# Erdős 306 article / formalization correspondence

> Repository-only control record. This file is excluded from the public arXiv source package.

Task: `E306-P1-REV2`  
Public formalization citation: `10.5281/zenodo.20767389`

## Public boundary

The article cites the machine-checked formalization solely through the Zenodo record. It contains no GitHub commit or branch identifier, development checkpoint, internal review record, workflow instruction, or Lean declaration inventory.

The public code-availability statement is intentionally concise:

- the article proves the theorem with a PNT-based analytic presentation;
- the archived Lean formalization uses explicit Rosser-Schoenfeld estimates;
- the archive supports verification but does not replace the mathematical arguments printed in the article.

## Mathematical correspondence

| Article component | Formalization relationship |
|---|---|
| Squarefree-semiprime criterion and finite tuple | Same public theorem content. |
| PNT and Abel-summation local law | Article-only analytic presentation. |
| Eventual dyadic density and inclusive reciprocal mass | Same construction-facing consequences; the archived formalization obtains them from explicit estimates. |
| Finite Fourier identity and no-wrap conversion | Same finite argument. |
| Control graph, cold blocks, level sets, and localization | Same construction architecture, fully stated mathematically in the article. |
| Pair pool, weights, main/minor estimates, and terminal positivity | Same finite construction, with the article displaying the load-bearing estimates. |
| Finite-set-to-tuple bridge | Same public conclusion. |

## Citation rule

Public text and metadata should use:

`Tang, Yuren. A Machine-Checked Proof of Erdős Problem 306 in Lean 4. Zenodo. doi:10.5281/zenodo.20767389.`

No public statement should imply that the article’s PNT bridge is already formalized in the archive, or that formal verification substitutes for a missing paper proof.
