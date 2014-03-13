---
name: "positioning: absolute"
slug: positioning-absolute
summary: Absolutely position an element and assign its coordinates, all in one line of SCSS.
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
    <div class="eg-absolute-container">
      <div class="eg-absolute eg-absolute-1">Top left</div>
      <div class="eg-absolute eg-absolute-2">Bottom right</div>
    </div>
---

You'll save years of your life, and probably lose weight.