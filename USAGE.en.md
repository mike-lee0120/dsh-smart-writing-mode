# Smart Writing Mode · Usage Manual

A how-to guide for fiction and screenwriting. See [README.en.md](README.en.md) for what it is; this manual covers **how to use it**.

## 1. Install & start

```bash
cd dsh-smart-writing-mode
./install.sh
```

Then: start a new session → pick **智能写作模式** from the mode picker → give it an idea.

> Equivalent install: copy this directory (excluding `.git`, `install.sh`, `README*`, `USAGE*`) to `${DSH_HOME:-$HOME/.dsh}/.agent-presets/writing/`.

## 2. Three core concepts (3-minute primer)

**① The creative pipeline** (every writing task follows it):

> Pick type → pick structure → apply beats → match narrative style → outline/draft

**② 6 skills** (the assistant loads the matching skill automatically; you don't name it):

| Skill | When |
|---|---|
| `story-development` | You only have a one-line idea and want planning / outline / structure |
| `novel-writing` | Writing novels (long / short / web novels) |
| `screenplay-writing` | Writing film / TV / stage scripts |
| `short-drama-writing` | Writing micro-dramas (vertical, 1–3 min episodes) |
| `novel-to-screenplay` | Adapting an existing novel into a script |
| `writing-revision` | Polishing, revising, editing drafts |

**③ Content library (references)**：writer/screenwriter style libraries (Jin Yong, Higashino, Liu Heping, Shakespeare…) live in each skill's `references/` and are read on demand — e.g. only consulted when you ask for "a Higashino-style mystery".

## 3. Universal prompt template

Give five things: **genre + form + length + idea + style**.

```
Write a 【genre/type】 【novel / film script / short drama】,
the idea is 【one-line pitch】,
length 【400k chars / 120 min / 30 eps × 1-2 min】,
style benchmarked on 【writer/screenwriter, optional】.
```

## 4. How to use each workflow

### 4.1 Long-form novel

**Example prompt:**

> Write a 400k-character mystery novel: a detective captain reopens a decade-old cold case and finds every clue points to his most trusted partner. Style benchmarked on Keigo Higashino.

**What you get:**
1. Logline + theme + character bible + worldbuilding (from `story-development`)
2. Chapter outline (first several chapters)
3. Project directory: `大纲/`, `设定/`, `正文/`, `进度.md`
4. Chapters written incrementally to `正文/第00N章.md`

**Continue:** just say "continue writing chapter X" — it reads the progress sheet + setting sheets + recent chapters, then continues.

**Note:** the manuscript always lives in files, not in chat; settings (names/timeline/foreshadowing) are updated as you go.

### 4.2 Micro-drama (short drama)

**Example prompt:**

> Write a 30-episode, 1–2-min-per-episode comeback short drama: the heroine is humiliated at her engagement party, then awakens a miracle-doctor power and fights back. Benchmark on Tian Can Tu Dou's underdog-comeback feel.

**What you get:**
1. Logline + theme
2. Type confirmation + structure (爽剧打脸 structure) + benchmarked web-fiction author
3. Episode outline (each episode labeled: function / opening hook / payoff / cliffhanger)
4. Episode scripts (standard short-drama format, each ending on a hook)

**Note:** per-episode ~300–500 chars, ≤ 10–12 lines of dialogue, ≥ 1 payoff + 1 ending hook.

### 4.3 Film / TV / stage script

**Example prompt:**

> Write a 120-minute mystery film, benchmarked on Nolan-style high-IQ storytelling: the protagonist discovers his life is being manipulated and the truth is hidden in his memory.

**What you get:**
1. Genre selection (8 standard film genres)
2. Structure (three-act / hero's journey / Save the Cat) + 15-beat outline
3. Scene-by-scene script (standard format: slugline + action + dialogue)

**Note:** TV uses "episodes + scenes"; stage plays use "acts/scenes".

### 4.4 Novel → screenplay adaptation

**Example prompt:**

> Adapt this novel excerpt into short-drama episode 1 (apply the 10 beats, end on a hook): 【paste text】

**What you get:**
1. Theme extraction + cutting (drop subplots, merge characters)
2. Restructuring (film 15 beats / short-drama 10 beats / TV episodes)
3. Transcription: prose → action + dialogue (inner monologue becomes filmable action)

**Note:** stays faithful to the theme and thinks visually; confirm rights before adapting others' work.

### 4.5 Revision

**Example prompt:**

> Revise chapter 1: give concrete edits and produce a revised draft.

**What you get:**
1. Overall assessment (structure / character / pacing / style)
2. Itemized edits (location → problem → suggestion)
3. Revised draft (each suggestion applied; unapplied ones are annotated with reasons)

## 5. How a 400k-character novel actually runs

1. **Bootstrap**: give it an idea + target length (e.g. 400k chars); it builds the project directory, logline/outline/settings/progress sheet.
2. **Chapter by chapter**: say "start" or "write chapter 1"; it writes 2000–4000 chars per chapter to `正文/` and updates `进度.md` + `伏笔表.md`.
3. **Long run**: `进度.md` + `goal` carry it across many turns; context compaction never touches the on-disk manuscript.
4. **Resume**: come back anytime and say "continue" — it resumes from the progress sheet.
5. **Consistency**: per-chapter self-check (names/timeline/settings/foreshadowing), a cross-chapter spot check every 5–10 chapters, and a global pass on completion.

## 6. Prompt tips

- **Be specific**: genre, length, audience/platform, style, benchmark writer — anything missing will be asked back via `ask_user_question`.
- **One goal at a time**: first "make an outline", approve it, then "write the manuscript" — don't ask for everything at once.
- **Use "continue"**: say "continue chapter X" / "continue episodes 4–6" instead of repeating context.
- **Benchmark a writer**: "benchmark on Higashino" beats "make it good".
- **Steer**: "outline is fine, but make the heroine harder-edged and move the revenge line earlier".

## 7. FAQ

**Q: Can it output 400k characters at once?**
A: No. Per-turn output is bounded; the manuscript is written incrementally to per-chapter files across many turns.

**Q: What if interrupted / new session?**
A: The manuscript is in project files; say "continue" and it resumes from `进度.md`.

**Q: How do I change the style?**
A: Name a benchmark writer, or say "switch to a cold, terse Gulong-style".

**Q: How do I add a benchmark writer?**
A: Edit `skills/<name>/references/*.md` using the "entry template" at the bottom, then re-run `./install.sh`.

**Q: Is output Chinese by default?**
A: Yes, Chinese by default; request English/bilingual if needed.

**Q: Can it export PDF / docx / EPUB?**
A: Not built-in in v1; it can use its shell ability with pandoc (Markdown → PDF/docx/EPUB). A dedicated `publishing-export` is planned for v2.
