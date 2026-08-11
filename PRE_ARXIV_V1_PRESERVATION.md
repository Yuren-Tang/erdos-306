# E306 pre-arXiv v1 preservation spine

**Created:** 2026-08-11, Europe/Berlin

This branch is the cloud Git-history preservation spine for the manuscript lineage immediately before arXiv v1 submission. It is not a new mathematical assurance event and it does not authorize merge to `main`, release, DOI mutation, journal submission, or arXiv submission.

## Frozen submission object

```text
source ZIP
Erdos-306-arXiv-v1-2856963c-source.zip
sha256 2856963cfab075e1c888212e1960a071922faa69119c42384e14248a9213b85e

reference PDF
Erdos-306-arXiv-v1-7a2b44ef-reference.pdf
sha256 7a2b44ef2410312fbd7db2fbd70727c705edf463772e55c208ac0c7c2948653c
pages 35 A4
```

The Owner retains persistent off-repository cloud copies of both exact artifacts. `research-workbench/intake/2026-08-11-e306-arxiv-v1-submission-freeze-chatgpt.md` records the complete twelve-file source manifest, byte counts, per-file SHA-256 digests, late-review disposition, and submission freeze.

## Manuscript / typography branch tips absorbed into this preservation ancestry

The final preservation commit on this branch is an octopus merge. Its first-parent line contains the former `finalization/e306-ebgaramond-v1` tip; additional parents retain every other current branch whose purpose is manuscript drafting, manuscript integration, typography comparison, or dedication verification.

```text
finalization/e306-ebgaramond-v1
9ab332be9e02248f603b718a4c918e36d595a50b

finalization/e306-gentium-v1
e2d28355a1cd990e9460290132b8b6c0d08ece24

paper/e306-anchor-fibre-v1
b223e3152f608295ec35ac97ffab541879f62ec0

paper/e306-fixed-ratio-garamond-preview-v1
159768d0c35722c1164b34a52b3103d4bed43a86

paper/e306-fixed-ratio-integration-v1
f7a3ef7b41848bb385693e06dfe5303497ab62cd

paper/e306-fixed-ratio-typography-comparison-v2
cab7d53deaf1e8f638ce956931973073f758a5e4

paper/e306-squarefree-denominators-v1
eef554c304805e8cf35fc8b2adce5e0eea281723

verification/e306-dedication-optical-ladder
072b26a2d3b55912039361f40fd2194faf464e2e
```

`paper/e306-anchor-fibre-v1` is already an ancestor of the first-parent tip, but is listed explicitly because PR #9 uses it as its head branch.

## Retirement rule

Preserving a commit by ancestry and retiring a **ref name** are different operations. Several `paper/*` refs above are still named by `research-workbench/knowledge/INTEGRATION_WATERMARK.md`; deleting those refs before a normal integration pass rewrites the watermark/recovery mapping would deliberately break the current strict ref census. They therefore remain until that control-layer migration is dispositioned.

The later-created typography/finalization refs are not part of that 2026-08-09 watermark. Once this preservation commit is verified, they carry no unique history that is not reachable here and may be retired without mathematical loss.

After arXiv v1 is public, add the stable mapping

```text
this preservation commit
<-> source ZIP sha256 2856963c...
<-> reference PDF sha256 7a2b44ef...
<-> public arXiv v1 identifier / arXiv-generated source and PDF
```

and only then complete the remaining manuscript-ref cleanup through the normal workbench integration path.
