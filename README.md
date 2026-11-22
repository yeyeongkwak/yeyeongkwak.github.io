# Yeyeong Kwak — Dev Log

Personal site for <https://yeyeongkwak.github.io>. It uses the [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) Jekyll theme. GitHub Actions builds it and deploys to GitHub Pages.

There are no mission posts yet. The subject folders are empty on purpose.

## Structure

```
.
├── _config.yml
├── _data/subjects.yml          # folder slug → category title
├── _plugins/mission_sections.rb
├── _posts/daily-dev-coding/
│   ├── hardware-test-automation/
│   ├── embedded-c/
│   ├── aws-saa/
│   ├── ai-editors/
│   ├── debugging-with-ai/
│   ├── github-automation/
│   ├── portfolio/
│   └── dotnet/
├── _tabs/                      # About, Categories, Tags, Archives
├── templates/mission.md
└── .github/workflows/pages.yml
```

Chirpy shows a light / dark / system toggle when `theme_mode` is empty, and the built-in search box. Categories and tags come from post front matter.

## Add a post

1. Copy `templates/mission.md` to:

   ```
   _posts/daily-dev-coding/<subject>/YYYY-MM-DD-short-slug.md
   ```

   `<subject>` is one of:

   | Folder | `categories` second entry |
   | --- | --- |
   | `hardware-test-automation` | Hardware Test Automation |
   | `embedded-c` | Embedded C |
   | `aws-saa` | AWS SAA |
   | `ai-editors` | AI Editors |
   | `debugging-with-ai` | Debugging with AI |
   | `github-automation` | GitHub Automation |
   | `portfolio` | Portfolio |
   | `dotnet` | .NET |

   Example path (do not create this file until the mission happened):

   ```
   _posts/daily-dev-coding/embedded-c/2026-11-22-read-a-datasheet.md
   ```

2. Set `categories` to `[Daily Dev Coding, <Subject title>]` using the title from the table, not the folder slug. The filename must start with the mission date as `YYYY-MM-DD`, and `date` must be that same day. `2026-11-22` in the template is only a format example. Use a lowercase hyphenated slug after the date.

3. Commit to `master`. The note is listed on the home page, and on **Categories** under Daily Dev Coding, grouped by subject. Chirpy's post URL is `/posts/<title>/`.

### Front matter

```yaml
---
layout: post
title: "Short mission title"
date: 2026-11-22
# Subject title (second category): Hardware Test Automation, Embedded C, AWS SAA,
# AI Editors, Debugging with AI, GitHub Automation, Portfolio, .NET
categories: [Daily Dev Coding, Embedded C]
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

The post page prints Mission, What I did, What I learned, AI prompt used, and Next step when those fields are non-empty. Anything after the front matter is extra notes.

## Local build

```bash
bundle install
bundle exec jekyll build
bundle exec jekyll serve
```

Then open <http://127.0.0.1:4000/>.

## GitHub Pages

`.github/workflows/pages.yml` builds with Ruby 3.2 and deploys the site. Deploy runs for `master` only.

Turn Pages on once, by hand:

**Settings → Pages → Build and deployment → Source: GitHub Actions**

Until that source is selected, the site does not go live. The public URL is <https://yeyeongkwak.github.io/>.
