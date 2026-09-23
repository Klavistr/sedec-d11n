# Repository instructions

This repository contains Japanese DITA documentation for 性DEC.

## Before editing

- Read `README.md` and `style/writing-guide.md`.
- Treat Markdown files such as `first_announce.md` as source material, not generated output.
- Do not silently turn tentative event information into confirmed information.

## DITA conventions

- Put shared topics in `dita/topics/common/` and role-specific topics in the matching role directory.
- Use lowercase English snake_case for filenames and XML IDs.
- Give every topic one clear purpose and a descriptive Japanese title.
- Prefer links and map references over copied content. Introduce conref/keyref only when there is real reuse.
- Add new topics to every applicable map in `dita/maps/`.
- Preserve valid DITA 1.3 structure and `xml:lang="ja-JP"`.

## Verification

- Run `make validate` after changing DITA XML.
- Run the relevant HTML/PDF target when changing maps, resources, or output styling.
- Do not commit files under `build/`.

## Scope

- Treat this repository as the source of truth for event-wide visual design, livestreaming responsibilities, and operating procedures; keep implementations and production assets in their owning repositories.
- Keep generated artifacts and local tooling state out of Git.
- Do not add Python or Node dependencies unless the task actually requires them.
- Update `README.md` when setup, commands, or directory layout changes.
