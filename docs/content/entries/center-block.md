---
name: center block
slug: center-block
summary: Give a block element `auto` left- and right-margins and (optionally) set its `max-width`.
type: mixin, with a default-values placeholder
categories:
  - layout
args:
  - variable: $max-width
    default: "false"
    comment: |
      A `max-width` value for the to-be-centered block.
example:
  html: |
    <div class="eg-center-block eg-center-block-1">Variation 1</div>
    <div class="eg-center-block eg-center-block-2">Variation 2</div>
---

You, being wise, probably know that setting `margin-left: auto; margin-right: auto;` on a block element with a defined width will center that element. You probably do it all the time.

So why a utility?

- To make sure you're setting `margin-left` and `margin-right` when that's all you need to set &mdash; instead of also overriding `margin-top` and `margin-bottom` with a rule like `margin: 0 auto;`.
- To organize and name the pattern, describing what is being done &mdash; you are *centering a block* &mdash; whereas `margin: auto;` does not explain itself.
- To provide a little handy shortcut for the all-too-common pattern of setting `auto` left and right margins along with a `max-width`. (`max-width` instead of `width`, so the element shrinks with the viewport, if it comes to that &mdash; I find myself doing it that way most often.)