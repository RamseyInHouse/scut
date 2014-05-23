---
name: "v-center: table display method"
slug: vcenter-td
summary: "Vertically center descendent elements with the `display: table` method."
type: mixin, with default-values placeholder
categories:
  - layout
args:
  - variable: $inner
    default: "\".scut-inner\""
    comment: A CSS selector for the inner element. **Can be a single selector or a comma-separated list of selectors.** In either case, *wrap selectors in quotes.*
references:
  - description: "CSS-Tricks: \"Centering in the Unknown\""
    url: http://css-tricks.com/centering-in-the-unknown/
example:
  show-html: true
  html: |
    <div class="eg-vcenter-td eg-vcenter-td-1">
      <span class="scut-inner">
        Using the default classname "scut-inner".
      </span>
    </div>
    <div class="eg-vcenter-td eg-vcenter-td-2">
      <div class="eg-vcenter-td-inner">
        Using a special classname.
      </div>
    </div>
    <p>And illustrating the use of a list of distinct selectors ...</p>
    <div class="eg-vcenter-td eg-vcenter-td-3">
      <div class="special-selector-1">first</div>
      <div class="special-selector-2">second</div>
      <div class="special-selector-3">third</div>
    </div>
---

*This method requires a container and an inner element.* The mixin applies to the container; identify the to-be-centered inner element(s) with the `$inner` argument.

Any to-be-centered element should be an *immediate child* of the container (`container > inner`).