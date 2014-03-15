---
name: side-lined
slug: side-lined
summary: Create horizontal lines extending from either side of center-aligned text.
type: mixin, with default-values placeholder
categories:
  - typography
args:
  - variable: $height
    default: 1px
    comment: The height of the lines.
  - variable: $space
    default: 0.5em
    comment: Horizontal spacing between the text and the lines (on both sides).
  - variable: $color
    default: inherit
    comment: The color of the lines.
  - variable: $style
    default: solid
    comment: The `border-style` of the lines.
  - variable: $v-adjust
    default: false
    comment: Vertical adjustment to the lines, adding space *from the bottom*. See examples below.
  - variable: $double
    default: false
    comment: Double your lines by adding *a value for the distance between the two lines you want*.
example:
  html: |
    <p class="eg-side-lined-1">Variation 1</p>
    <p class="eg-side-lined-2">Variation 2</p>
    <p class="eg-side-lined-3">Variation 3</p>
    <p class="eg-side-lined-4">Variation 4</p>
---

Woman- and mankind have always loved this flourish. Look at the examples below. You want to do that!

By default, the lines will be vertically aligned with the text's centerline &mdash; but sometimes that will look off to your discerning eye, and you'll want to tweak that vertical position. So add some height to the `$v-adjust` argument, which will push your lines *up*, away from the bottom of the element.

By default, the mixin produces one line; but if you add a height value to the `$double` argument, you'll get two lines (separated by that height). (You could also use a `$style` of `double`, which would act the same as any double border-style.)