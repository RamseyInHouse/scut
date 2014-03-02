---
name: Triangle
slug: triangle
summary: Create a wide variety of CSS triangles.
type: mixin, with a default-values placeholder
categories:
  - general
args:
  - variable: $direction
    default: right
    comment: "The direction that the triangle points: `up`, `down`, `right`, `left`. Or, for right triangles, the corner of the right angle: `top-right`, `top-left`, `bottom-right` or `bottom-left`."
  - variable: $size
    default: 0.75em
    comment: One or two values determining the size of the triangle. One value will make a triangle equally wide and tall. Two values translate to `width` and `height`.
  - variable: $color
    default: inherit
example:
  show-html: true
  html: |
    <p>
      <span class="eg-triangle m-default"></span>
      <span class="eg-triangle m-equilateral"></span>
      <span class="eg-triangle m-top-right"></span>
      <span class="eg-triangle m-bottom-left"></span>
    </p>
    <p>
      <button class="eg-triangle-button m-down">Dropdown</button>
      <button class="eg-triangle-button m-up">Dropdown</button>
      <button class="eg-triangle-button m-more">Read more</button>
    </p>
---

(The default placeholder extension is a little one pointing right &mdash; the kind you'd see on a "Read More" link.)

The mixin can produce acute triangles pointing up, down, left, and right; or right triangles with their right angles in the top right, top left, bottom right, and bottom left corners.

When choosing `width` and `height` values, consider how their ratio will determine the form. For example, to create an equilateral triangle pointing up, you'll want your `height` value to be ~86.6% of your `width` value (1/2 x &radic;3 x `width`). Anybody remember high school geometry?

The best way to understand this mixin is to play around with it, so besides looking at the examples below, you should [play around with this Codepen Pen](http://codepen.io/davidtheclark/pen/oelbk).