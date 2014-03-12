---
name: center absolutely
slug: center-absolutely
summary: Center an absolutely positioned element horizontally, vertically, or both ways.
type: mixin only
categories:
  - layout
args:
  - variable: $dimensions
    comment: |
      A two-value list: the `width` and `height` of the element-to-be-centered (both optional). To bypass either and avoid centering in that dimension, pass `n`. See below.
example:
  html: |
    <div class="eg-center-absolutely-container">
      <div class="eg-center-absolutely-1">Centered both horizontally and vertically</div>
    </div>
    <div class="eg-center-absolutely-container">
      <div class="eg-center-absolutely-2">Centered only horizontally</div>
    </div>
    <div class="eg-center-absolutely-container">
      <div class="eg-center-absolutely-3">Centered only vertically</div>
    </div>
---

**This method only works if the element-to-be-centered has a fixed dimension on the relevant axis** &mdash; fixed width to center horizontally, fixed height to center vertically. *If your element cannot have fixed dimensions (and you do not need to support IE8), consider [`scut-center-transform`](center-transform.html).*

If you do not want to center horizontally &mdash; only vertically &mdash; pass `n` (short for `null`, "no," "nothing," etc.) for the `width` value. Same goes for height, if you do not want to center vertically. See the examples below for clarification.