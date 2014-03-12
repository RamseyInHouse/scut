---
name: triangle
slug: triangle
summary: Create a wide variety of CSS triangles.
type: mixin, with a default-values placeholder
categories:
  - general
args:
  - variable: $direction
    default: right
    comment: "The direction that the triangle points: `up`, `down`, `right`, `left`. Or, for right triangles, the *corner of the right angle*: `top-right`, `top-left`, `bottom-right` or `bottom-left`."
  - variable: $size
    default: 0.75em
    comment: One or two values determining the size of the triangle. Two values translate to `width` and `height`. One value will make a triangle equally wide and tall.
  - variable: $color
    default: inherit
example:
  show-html: true
  html: |
    <div class="eg-triangle-container">
      <span class="eg-triangle-default"></span>
      <span class="eg-triangle-equilateral"></span>
      <span class="eg-triangle-top-right"></span>
      <span class="eg-triangle-bottom-left"></span>
    </div>
    <div>
      <button class="eg-triangle-button m-down">Dropdown</button>
      <button class="eg-triangle-button m-up">Dropdown</button>
      <button class="eg-triangle-button m-right">Read more</button>
    </div>
---

The mixin can produce acute triangles pointing up, down, left, and right; or right triangles with their right angles in the top right, top left, bottom right, and bottom left corners.

(The default placeholder extension is a little triangle pointing right &mdash; the kind you'd see on a "Read More" link, the last example.)

*When choosing `width` and `height` values, consider how their ratio will determine the form.* For example, to create an equilateral triangle pointing up, you'll want your `height` value to be ~86.6% of your `width` value (1/2 x &radic;3 x `width`). Anybody remember high school geometry?

The best way to understand this mixin is to play around with it, so besides looking at the examples below, you should [tinker with this Codepen Pen](http://codepen.io/davidtheclark/pen/oelbk).