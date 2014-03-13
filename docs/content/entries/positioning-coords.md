---
name: "positioning: coordinates"
slug: positioning-coords
summary: A shorthand for assigning coordinates to an element.
type: mixin only
categories:
  - layout
args:
  - variable: $coordinates
    default: [n n n n]
    comment: |
      A list: `top`, `right`, `bottom`, and `left` coordinates. `n` abbreviates `null`. `a` is interchangeable with `auto`. See below.
---

You *may* want to use this mixin on its own &mdash; but **this mixin's primary purpose is to facilitate the positioning mixins: [`scut-absolute`](positioning-absolute.html), [`scut-relative`](positioning-relative.html), and [`scut-fixed`](positioning-fixed.html)**, which pair your coordinates with a `position` value.

Some guidlines for this mixin and its followers:

- **`n` (the default value) signifies `null` or "nothing" or "no"** &mdash; so any coordinate assigned `n` is simply ignored, creating no rule in your compiled CSS.
- **`a` can abbreviate `auto`** (both will work).
- **All four values must be passed**, so use `n` as needed.