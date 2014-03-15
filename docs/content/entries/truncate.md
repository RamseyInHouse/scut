---
name: truncate
slug: truncate
summary: Truncate text to a *single line*, clipped with an ellipsis.
type: mixin, with default-values placeholder
categories:
  - typography
example:
  show-html: true
  html: |
    <div class="eg-truncate">This string of text is bound to be longer than a single line will allow but you will not see the whole thing because it will be truncated at the end of the displayed line and ended with an ellipsis and just to ensure that that example works even on your gigantic fancy-boy screen I'll duplicate that sentence content starting now this string of text is bound to be longer than a single line will allow but you will not see the whole thing because it will be truncated at the end of the displayed line and ended with an ellipsis.</div>
---

A quick and dirty method of tailoring content to fit layout.

(In order to truncate without clipping words, truncate to character counts, or truncate multi-line strings generally, the most reliable and flexible methods seem to lie outside of CSS (in your templating language, or JavaScript, etc.).)