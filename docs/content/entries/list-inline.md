---
name: "list: inline"
slug: list-inline
summary: De-style a list and inline its items.
type: mixin, with default-values placeholder
categories:
  - layout
args:
  - variable: $space
    default: "false"
    comment: Spacing to separate the inline list items.
  - variable: $no-margin
    default: true
    comment: If `true`, top and bottom margins will be removed from the list.
example:
  html: |
    <ul class="eg-list-inline eg-list-inline-1">
      <li>list item 1</li>
      <li>list item 2</li>
      <li>list item 3</li>
    </ul>
    <ul class="eg-list-inline eg-list-inline-2">
      <li>list item 1</li>
      <li>list item 2</li>
      <li>list item 3</li>
    </ul>
---

Use an inline list if you don't mind that your list items might be spaced out a little extra, like inline words. If you *need* them flush, with no interstitial space, try a [floated list](list-floated.html).

Only the list's immediate children are inlined (`ul > li`): Scut does not presume to know what you might plan to do with sub-lists.