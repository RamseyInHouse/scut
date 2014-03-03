---
name: circle
slug: circle
summary: Create a CSS circle.
type: mixin only
categories:
  - general
args:
  - variable: $size
    comment: One value becomes both `width` and `height`.
  - variable: $color
    default: inherit
compatibility: |
  This utility uses `border-radius`, which is not supported in IE8; so IE8 will just get what it deserves: squares.
example:
  html: |
    <div class="eg-circle m-1"></div>
    <div class="eg-circle m-2"></div>
    <div class="eg-circle m-3"></div>
---

By default, the circle will inherit the color of its parent's text. Or you n designate a color yourself.

*If you want to add a border to your circle, you have to declare a color.*
