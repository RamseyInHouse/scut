---
name: "positioning: relative"
slug: positioning-relative
summary: Relatively position an element and assign its coordinates, all in one line of SCSS.
type: mixin only
categories:
  - layout
args:
  - variable: $coordinates
    default: [n n n n]
    comment: "See information about [`scut-coords`](positioning-coords.html)."
example:
  html: |
    <p>Some of <span class="eg-relative-1">these</span> words <span class="eg-relative-2">are</span> positioned in <span class="eg-relative-3">strange</span> ways.</p>
---