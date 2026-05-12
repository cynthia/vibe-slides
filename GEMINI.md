# Design Principles for Googley Typst Presentations

This repository contains a high-fidelity "Googley" Typst theme and a starter deck. Future agents must adhere to the following strict aesthetic and technical mandates derived from user feedback and a reference "Program Review" deck.

## 1. Typography & Slop Prevention
- **Direct Voice:** NEVER use the "*Thing*: Explanation" or "*Topic*: Description" format. It is considered "LLM slop" and is disengaging.
- **Punchy Bullets:** Use direct, conversational, and engineering-focused statements.
- **Font:** Always use `Google Sans` if available.
- **Metrics:** 
  - Tighten line spacing (`leading: 0.35em` or `0.45em`).
  - Tighten character spacing (`tracking: -0.01em`).
- **Hierarchy:**
  - Main Titles: 700 weight, 44pt - 64pt.
  - Section Headers: 500 weight, ~36pt.
  - Card Titles: 600 weight, 0.65em - 0.75em, `UPPERCASE`.
  - Body Text: 400 weight, 18pt - 22pt (Card bodies should be ~2pt smaller than global font).

## 2. Visual Identity (The "Googley" Look)
- **The Gradient:** Must be the exact 7-color spread at `0deg`:
  `rgb("#4285f4"), rgb("#b181db"), rgb("#e04d50"), rgb("#ff902a"), rgb("#debe0f"), rgb("#5fb641"), rgb("#2eaca0")`.
- **The Chrome Logo:** Use `newchromelogo.png`.
  - Title slide height: `1.5cm`.
  - Content slide height (bottom-left): `0.5cm` - `0.7cm`.
- **No Decorations:** Avoid generic "balls" or floating decorations unless specifically requested and placed absolutely so as not to disrupt flow.

## 3. Layout & Structure
- **Googley Cards:** Use rounded-corner blocks (`radius: 0.5em`) with light gray background (`rgb(241, 243, 244)`) and a thick (`0.4em`) colored left-accent stroke.
- **Margins:** Keep outer margins tight (`2cm` - `2.5cm` top/bottom, `1.5cm` x-axis) to avoid content overflow.
- **Equalization:** When using side-by-side cards (e.g., timelines or comparisons), always provide a fixed `height` to the `googley-card` function to ensure vertical alignment.
- **Tight Gaps:** Use `v(0.3em)` between blocks and `v(0.2em)` between card titles and bodies.

## 4. Technical Constraints
- **Submodules:** `polylux` must be included as a submodule.
- **Builds:** Compile using the `typst compile` command.
