---
name: border
slug: border
summary: Shorthand for using a single border value on multiple sides of an element.
type: mixin only
categories:
  - general
args:
  - variable: $style
    comment: |
      A vanilla-CSS `border` shorthand value for the border you wish to create.
  - variable: $sides
    default: n y
    comment: |
      The sides on which to add your border: a list of 2 or 4. `n` abbreviates `null`, passing no value; `y` (or anything other than `n`), will create a rule. See below for details.
example:
  html: |
    <div class="eg-border eg-border-1">Variation 1</div>
    <div class="eg-border eg-border-2">Variation 2</div>
    <div class="eg-border eg-border-3">Variation 3</div>
    <div class="eg-border eg-border-4">Variation 4</div>
---

The `$sides` argument determines which sides get the border. It parallels the established pattern in vanilla CSS: if a list of two is passed, the first value applies to top and bottom, the second to right and left; if a list of four is passed, the values apply, in order, to top, right, bottom, and left.

As elsewhere in Scut, `n` stands for `null` and results in no rule being created. For `scut-border`, `y` (or anything other than `n`) stands for "yes" or `true` and will result in a rule. See the examples below.

(If you don't see the purpose or value of such a silly little shorthand, please read the explanation in <a href="margin.html">`scut-margin`</a>, which applies equally to this mixin.)