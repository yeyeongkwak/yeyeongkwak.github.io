# Yeyeong Kwak — Dev Log

Personal site for <https://yeyeongkwak.github.io>. It is a [Jekyll](https://jekyllrb.com/) site using the [minima](https://github.com/jekyll/minima) theme. GitHub Actions builds it and deploys to GitHub Pages.

There are no mission posts yet. Subject pages stay empty until you add one.

## Structure

```
.
├── _config.yml
├── _data/subjects.yml          # subject order, titles, and one-line summaries
├── _layouts/                   # daily index, subject index, mission note
├── assets/main.scss
├── daily-dev-coding/
│   ├── index.md                # all subjects, grouped
│   ├── hardware-test-automation/index.md
│   ├── embedded-c/index.md
│   ├── aws-saa/index.md
│   ├── ai-editors/index.md
│   ├── debugging-with-ai/index.md
│   ├── github-automation/index.md
│   └── portfolio/index.md
├── templates/mission.md        # copy this when adding a note
├── index.md
├── about.md
└── .github/workflows/pages.yml
```

Mission notes do not go in `_posts`. A note is any Markdown file in a subject folder other than `index.md`.

## Add a post

1. Copy `templates/mission.md` to:

   ```
   daily-dev-coding/<subject>/YYYY-MM-DD-short-slug.md
   ```

   `<subject>` is one of:

   - `hardware-test-automation`
   - `embedded-c`
   - `aws-saa`
   - `ai-editors`
   - `debugging-with-ai`
   - `github-automation`
   - `portfolio`

   Example path (do not create this file until the mission happened):

   ```
   daily-dev-coding/embedded-c/2026-11-22-read-a-datasheet.md
   ```

2. Replace the front matter. `subject` must match the folder name. `date` is the mission day as `YYYY-MM-DD` (the sample date below is only a format example). The filename should start with that same date. Use lowercase hyphenated words after the date. Do not name the file `index.md`.

3. Commit to `master`. The Pages workflow publishes the note. With `permalink: pretty`, the URL is `/daily-dev-coding/<subject>/<filename-without-md>/`.

### Front matter

```yaml
---
layout: mission
title: "Short mission title"
date: 2026-11-22
subject: embedded-c
tags:
  - tag
mission: "What the mission was, in one sentence."
what_i_did: |
  What I did.
what_i_learned: |
  What I learned.
ai_prompt_used: |
  The prompt I used. Leave this blank if I did not use one.
next_step: |
  What I will do next.
---

Optional longer notes in Markdown. Delete this paragraph if you do not need it.
```

`layout` can be omitted because files under `daily-dev-coding/` default to `mission`, except the `index.md` listing pages. Keeping `layout: mission` in the file makes the note obvious. The page prints Mission, What I did, What I learned, AI prompt used, and Next step when those fields are non-empty. The same file is listed on the subject page and on the Daily Dev Coding index.

To add a new subject later, add a row in `_data/subjects.yml` and a `daily-dev-coding/<slug>/index.md` that uses `layout: subject` and `subject: <slug>`.

## Local build

```bash
bundle install
bundle exec jekyll build
bundle exec jekyll serve
```

Then open <http://127.0.0.1:4000/>.

## GitHub Pages

The workflow `.github/workflows/pages.yml` builds the site with `bundle exec jekyll build` and deploys the `_site` artifact. Deploy runs only for the `master` branch. Pull requests build only.

You must turn Pages on once, by hand:

**Settings → Pages → Build and deployment → Source: GitHub Actions**

Until that source is selected, the site does not go live. If the first Actions run failed before Pages was enabled, use **Re-run jobs** after saving the setting. The public URL is <https://yeyeongkwak.github.io/>.
