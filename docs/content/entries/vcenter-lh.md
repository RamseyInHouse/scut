---
name: "v-center: line-height method"
slug: vcenter-lh
summary: Vertically center text (or other inline elements) by equalizing an element's `height` and `line-height`.
type: mixin only
categories:
  - layout
args:
  - variable: $height
example:
  html: |
    <button class="eg-vcenter-lh eg-vcenter-lh-1">Vertically centered text</button>
    <button class="eg-vcenter-lh eg-vcenter-lh-2">Same height, smaller font-size</button>
---

This method is simple, requires none of the extra `<div>`'s that make us all second-guess ourselves, and works in many common vertical-centering-situations.

However, it is also limited. Below I'll list some caveats &mdash; and if any of them mean this mixin doesn't fit your situation, try one of the other vertical-centering methods in Scut ([via inline-block](vcenter-ib.html), [via table display](vcenter-td.html), and [via transform](vcenter-tt.html)).

- This method only works for inline content (usually text) that *will not exceed a single line.* So it's good for buttons and headings with backgrounds and things like that.
- The line-height set by this method will cascade into inner elements, so you have to make sure to override it as needed.
- If your element has a border and `box-sizing: border-box` this method will be a little off, because the `line-height` will start *beneath* the top border but the height will *include* the top border. To avoid this issue, you can either set `box-sizing: content-box` or use a different vertical-centering method.