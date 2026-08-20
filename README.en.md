# dsh-smart-writing-mode

A DeepSeek Harness (DSH) agent preset — **Smart Writing Mode** — a professional assistant for fiction and screenwriting.

It ships a "genre → structure → beats → benchmark" creative system and a long-form novel incremental-writing protocol, covering idea development, novels, film/TV/stage scripts, micro-dramas (short dramas), novel-to-screenplay adaptation, and revision.

> 中文版：[README.md](README.md)

## Features

- **6 professional writing Skills**: idea development, novels, film scripts, micro-dramas, adaptation, and revision.
- **Genre / structure / beats / benchmark system**: 8 short-drama core types, 8 standard film genres, a classic dramatic-structure library, the 120-minute 15-beat film sheet, the short-drama 10-beat sheet, and director-master style benchmarks.
- **Long-form support**: novels (e.g. 400k characters) are written via "incremental file output + per-chapter files + single-source-of-truth setting sheets", with the manuscript persisted to disk.
- **Full tooling**: inherits `standard`'s file I/O, shell, background jobs, planning, subagents, workflows, and web research.
- **Extensible**: add a skill, change the persona, or mount a custom tool by editing the corresponding file.

## Quick start

```bash
./install.sh
```

Then: start a new session → pick **智能写作模式** from the mode picker → give it an idea.

Example:

> I want a comeback short drama: the heroine is humiliated at her engagement party, then awakens a miracle-doctor power and fights back.

The assistant loads `short-drama-writing` and produces an episode outline (each episode with a hook) and script, following "pick type → 爽剧打脸 structure → 10 beats → benchmark director".

## Creative pipeline

> Pick type → pick structure → apply beats → benchmark style → outline/draft

- **Pick type**: choose from the 8 short-drama core types or 8 standard film genres.
- **Pick structure**: choose from the classic dramatic-structure library.
- **Apply beats**: the 15-beat sheet for film, the 10-beat sheet for short drama.
- **Benchmark style**: match a director master by genre (with named creative-style labels).

## Built-in Skills

| Skill | Purpose |
|---|---|
| `story-development` | Idea development & outline: logline, theme, world/characters, classic structure library, chapter/scene outline, project directory |
| `novel-writing` | Novel writing: prose craft, genre playbooks, long-form incremental-writing protocol (per-chapter files + single-source-of-truth sheets) |
| `screenplay-writing` | Film/TV/stage scripts: standard format, 8 film genres, 120-minute 15-beat sheet, film director benchmarks |
| `short-drama-writing` | Micro-drama: 8 short-drama core types, type→structure mapping, 10-beat sheet, per-episode timing budget, short-drama director benchmarks |
| `novel-to-screenplay` | Novel adaptation: extract / cut / restructure / transcribe to film (15 beats) or short drama (10 beats) |
| `writing-revision` | Revision: layered proofreading, cross-chapter consistency, beat/hook audit, long-form global review |

## Knowledge system

- **Genres**: 8 short-drama core types (comeback / revenge / sweet romance / angsty romance / family melodrama / mystery / fantasy-power / realistic-era); 8 standard film genres (action / comedy / romance / mystery / thriller / sci-fi / crime / drama).
- **Structures**: classic dramatic structure library (three-act, hero's journey, eight-step, Save the Cat, five-act, minimal hit, mystery triple-reversal, comeback face-slap).
- **Beat sheets**: film 120-minute 15 beats; short-drama 10 beats + platform notes + per-episode timing budget.
- **Benchmarks**: film director masters (Cameron / Nolan / Spielberg / Jiaozi, etc.); short-drama director masters (Gao Feng / Yang Huan / Wu Xingxing / Li Ran, etc.).

## Long-form support

Novels (e.g. 400k characters) use "incremental file output + per-chapter files + single-source-of-truth setting sheets":

- The manuscript is always written to `正文/第00N章.md`, never held in the chat context.
- `设定/` (characters / timeline / foreshadowing) is updated as you write and serves as the single source of truth for consistency.
- `进度.md` drives continuation; `goal` tracks the total; resume after an interruption via the progress sheet.

See the "long-form incremental-writing protocol" and "cross-chapter consistency check" in `novel-writing`.

## Usage examples

| Need | Example prompt |
|---|---|
| Short drama | "Write a 60-minute, 30-episode comeback short drama: the heroine is jilted, awakens a miracle-doctor power, and fights back." |
| Film script | "Write a 120-minute mystery film in the style of Nolan's mind-bending reversals." |
| Novel | "Write a 400k-character mystery novel about a detective captain reopening a decade-old cold case." |
| Adaptation | "Adapt this novel excerpt into short-drama episode 1: apply the 10 beats and end each episode on a hook." |
| Revision | "Revise chapter 1: give concrete edits and a revised draft." |

## Directory structure

```
dsh-smart-writing-mode/
  agent.cordis.yml      # composition (standard base + writing persona + built-in skills)
  preset.yml            # display metadata
  install.sh            # installer
  skills/<name>/SKILL.md
```

## Installation

```bash
./install.sh
```

Equivalently, copy this directory (excluding `.git` and README files) to `${DSH_HOME:-$HOME/.dsh}/.agent-presets/writing/`. A new session will then show **智能写作模式** in the mode picker.

## Extending

- **Add a Skill**: create `skills/<name>/SKILL.md` (frontmatter requires kebab-case `name` and `description`); the directory name must match `name`.
- **Change the persona**: edit the `persona` row in `agent.cordis.yml`.
- **Custom tool**: add a `.mjs` file and mount it with a relative-path row (`./tool-xxx.mjs`), following the community preset `anchored-standard`'s `tool-bootstrap.mjs`.

## Roadmap (v2)

- Split out deeper skills: `character-design` (character bible), `worldbuilding` (setting bible).
- New skills: `web-fiction` (serialized web novels), `short-fiction`, `copywriting`.
- `publishing-export`: Markdown → docx/PDF/EPUB (pandoc), whole-book merge & export.
- Custom tools: word-count stats, project scaffolding, character/timeline/foreshadowing consistency checks, beat/hook density audit.

## Disclaimer

This preset is a community work, not an official DeepSeek preset, and is neither affiliated with nor endorsed by DeepSeek. Director/revenue figures are user-supplied creative benchmarking references intended only as style anchors, not factual assertions.
