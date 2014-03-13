---
name: "list: unstyled"
slug: list-unstyled
summary: Remove default styling from a list.
type: mixin, with default-values placeholder
categories:
  - layout
args:
  - variable: $no-margin
    default: true
    comment: If `true`, top and bottom margins will be removed from the list.
example:
  html: |
    <ul class="eg-unstyled-list-1">
      <li>list item</li>
      <li>list item</li>
      <li>list item</li>
    </ul>
    <ul class="eg-unstyled-list-2">
      <li>list-with-margins item</li>
      <li>list-with-margins item</li>
      <li>list-with-margins item</li>
    </ul>
---

Specifically, remove `padding-left`, `list-style-type`, and optionally `margin-top` and `margin-bottom`.