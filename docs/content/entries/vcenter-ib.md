---
name: "vertically center: inline-block method"
slug: vcenter-ib
summary: Vertically center descendent elements with the `inline-block` method.
type: mixin, with default-values placeholder
categories:
  - layout
args:
  - variable: $inner
    default: "\".scut-inner\""
    comment: A CSS selector for the inner element. *Wrap your selector in quotes.*
references:
  - description: "CSS-Tricks: \"Centering in the Unknown\""
    url: "http://css-tricks.com/centering-in-the-unknown/"
example:
  show-html: true
  html: |
    <div class="eg-vcenter-ib m-1">
      <p class="scut-inner">
        A vertically centered element, with the default classname "scut-inner".
      </p>
    </div>
    <div class="eg-vcenter-ib m-2">
      <p class="eg-vcenter-ib-inner">
        A vertically centered element, with its own special classname.
      </p>
    </div>
---

**This method requires a container and an inner element.** The mixin applies to the container; the to-be-centered inner element is passed (by its selector) as an argument.

Any to-be-centered element should be an *immediate child* of the container (`container > inner`).

A word of caution: Because `inline-block` results in some unpredictable word-like spacing, this method doesn't always work well if you require exact widths (or if your inner element has a 100% width). If you require exactitude and nothing stands in the way of giving your container `display: table`, try [vertically centering via table display](#v-center_table_display).