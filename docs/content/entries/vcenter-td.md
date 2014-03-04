---
name: "vertically center: table display"
slug: vcenter-td
summary: "Vertically center descendent elements with the `display: table` method."
type: mixin, with default-values placeholder
categories:
  - layout
args:
  - variable: $inner
    default: "\".scut-inner\""
    comment: A CSS selector for the inner element. *Wrap your selector in quotes.*
references:
  - description: "CSS-Tricks: \"Centering in the Unknown\""
    url: http://css-tricks.com/centering-in-the-unknown/
example:
  show-html: true
  html: |
    <div class="eg-vcenter-td m-1">
      <span class="scut-inner">
        A vertically centered span, with the default classname "scut-inner".
      </span>
    </div>
    <div class="eg-vcenter-td m-2">
      <div class="eg-vcenter-td-inner">
        A vertically centered div, with its own special classname.
      </div>
    </div>
---

**This method requires a container and an inner element.** The mixin applies to the container; the to-be-centered inner element is passed (by its selector) as an argument.

Any to-be-centered element should be an *immediate child* of the container (`container > inner`).