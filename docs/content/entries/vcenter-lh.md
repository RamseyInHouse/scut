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

Although this method is soothingly, reassuringly simple, requiring none of the extra `<div>`'s that make us all second-guess ourselves, it is also limited. **This method only works for inline content (usually text) that will not exceed a single line.** So it's good for buttons and headings with backgrounds and things like that.

If you need to vertically center something else, try one of the v-center mixins.