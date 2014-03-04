---
name: bookends
slug: bookends
summary: Create and style pseudo-elements on both sides of an element.
type: mixin only
categories:
  - typography
args:
  - variable: $space
    default: 0.5em
    comment: Spacing to separate the bookends from the element's content
  - variable: $content
    default: "\"\""
    comment: One or two `content` values for the pseudo-elements. Use a list to pass different content values to the left (`:before`) and right (`:after`), respectively; or pass one value to both.
contentblock: |
  A content block passed to this mixin will be applied to both `:before` and `:after` pseudo-elements.
example:
  html: |
    <div class="eg-bookends m-1">Variation 1</div>
    <div class="eg-bookends m-2">Variation 2</div>
    <button class="eg-bookends m-3">Variation 3</button>
    <div class="eg-bookends m-4">Variation 4</div>
---

A common typographical usage is to place decorative ornaments on either side of some heading. But the mixin can prove useful for anything that involves pseudo-elements on both sides. Absolutely anything.

Pass `false` as both arguments if you want to modify bookend pseudo-elements that have already been created. See example variation 3.