---
name: link bottom-bordered
slug: link-bb
summary: Replace standard link underlining with a bottom border.
type: mixin, with default-values placeholder
categories:
  - typography
args:
  - variable: $color
    default: inherit
    comment: A `border-bottom-color` value. `inherit` will use the text color.
  - variable: $style
    default: solid
    comment: A `border-bottom-style` value.
  - variable: $width
    default: 1px
    comment: A `border-bottom-width` value.
example:
  html: |
    <p class="eg-link-bb-1">Default values: <a href="#link-with-bottom-border">Link text</a></p>
    <p class="eg-link-bb-2">Variant values: <a href="#link-with-bottom-border">Link text</a></p>
---

People seem to like this trick, at least some people (I do), because it provides a little extra space between the text and the line. Other pleasing effects are also possible by passing arguments.

Of course, as always, you can add your own rules after the mixin to further customize. For example, if you want to define a special color for the bottom-border on hover, just do it (see Example 2).