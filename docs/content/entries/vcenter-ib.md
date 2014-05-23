---
name: "v-center: inline-block method"
slug: vcenter-ib
summary: Vertically center descendent elements with the `inline-block` method.
type: mixin, with default-values placeholder
categories:
  - layout
args:
  - variable: $inner
    default: "\".scut-inner\""
    comment: A CSS selector for the inner element. **Can be a single selector or a comma-separated list of selectors.** In either case, *wrap selectors in quotes.*
references:
  - description: "CSS-Tricks: \"Centering in the Unknown\""
    url: "http://css-tricks.com/centering-in-the-unknown/"
example:
  show-html: true
  html: |
    <div class="eg-vcenter-ib eg-vcenter-ib-1">
      <span class="scut-inner">
        Using the default classname "scut-inner".
      </span>
    </div>
    <div class="eg-vcenter-ib eg-vcenter-ib-2">
      <div class="eg-vcenter-ib-inner">
        Using a special classname.
      </div>
    </div>
    <p>And illustrating the use of a list of distinct selectors ...</p>
    <div class="eg-vcenter-ib eg-vcenter-ib-3">
      <div class="special-selector-1">first</div>
      <div class="special-selector-2">second</div>
      <div class="special-selector-3">third</div>
    </div>
---

*This method requires a container and an inner element.* The mixin applies to the container; the to-be-centered inner element is passed (by its selector) as an argument.

Any to-be-centered element should be an *immediate child* of the container (`container > inner`).

A word of caution: Because `inline-block` results in some tricky word-like spacing, this method doesn't always work well if you require *exact* widths (or if your inner element has a 100% width). If you require exactitude and nothing stands in the way of giving your container `display: table`, try [vertically centering via table display](vcenter-td.html).