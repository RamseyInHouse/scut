---
name: size
slug: size
summary: Define both of an element's dimensions in one fell swoop.
type: mixin only
categories:
  - layout
args:
  - variable: $size
    comment: A single value apply to both dimensions, making a square; a list of two (`width` then `height`) will make a rectangle.
example:
  html: |
    <div class="eg-size eg-size-1">A square</div>
    <div class="eg-size eg-size-2">A rectangle</div>
---

[(You may want to read about the origin of the phrase "one fell swoop.")](http://www.straightdope.com/columns/read/1698/whats-the-origin-of-one-fell-swoop)

If a single value is passed, it will be applied to both `width` and `height`, producing a square. To make a rectangle, pass a two-value list: `width` then `height`.