---
name: padding
slug: padding
summary: A slight but useful variation on vanilla CSS's padding shorthand, to ease development.
type: mixin only
categories:
  - layout
args:
  - variable: $padding
    comment: |
      A list (1 to 4 values) will set padding rules on multiple sides. `n` abbreviates `null` and creates no rule.
example:
  html: |
    <div class="eg-padding-container">
      <div class="eg-padding eg-padding-1">Variation 1</div>
    </div>
    <div class="eg-padding-container">
      <div class="eg-padding eg-padding-2">Variation 2</div>
    </div>
    <div class="eg-padding-container">
      <div class="eg-padding eg-padding-3">Variation 3</div>
    </div>
---

Pass a list (1 to 4 values, not comma-separated) and `scut-padding` will

- **create all paddings as separate rules** (that is, it *will not* use the shorthand, but will instead create `padding-top`, `padding-right`, etc.); and
- **allow you to pass `n` to avoid creating a rule on any side**. (As elsewhere in Scut, `n` stands for `null` and results in no rule being created.)

By using the mixin in this way, you will avoid some troubles that can occur when *changing* paddings on an element (in a media query, for instance; or overriding a cascaded style). *The point is to make it easier to override the values you want to override without affecting those you want to leave alone.*

If you like this one, you will like [`scut-margin`](margin.html).