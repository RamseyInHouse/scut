---
name: "positioning: fixed"
slug: positioning-fixed
summary: Fix an element's position and assign its coordinates, all in one line of SCSS.
type: mixin, with default-values placeholder
categories:
  - layout
args:
  - variable: $coordinates
    default: [0 n n 0]
    comment: "See information about [`scut-coords`](positioning-coords.html)."
example:
  show-html: true
  html: |
    <div>See the bottom right</div>
    <div class="eg-fixed">Here's your example.</div>
---

Notice the example in the bottom right.