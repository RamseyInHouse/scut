---
name: "list: floated"
slug: list-floated
summary: De-style a list and float its items.
type: mixin, with default-values placeholder
categories:
  - layout
args:
  - variable: $space
    default: "false"
    comment: Spacing to separate the floated list items.
  - variable: $dir
    default: left
    comment: The `float` direction.
  - variable: $no-margin
    default: true
    comment: If `true`, top and bottom margins will be removed from the list.
example:
  html: |
    <ul class="eg-list-floated eg-list-floated-1">
      <li>list item 1</li>
      <li>list item 2</li>
      <li>list item 3</li>
    </ul>
    <ul class="eg-list-floated eg-list-floated-2">
      <li>list item 1</li>
      <li>list item 2</li>
      <li>list item 3</li>
    </ul>
    <ul class="eg-list-floated eg-list-floated-3">
      <li>list item 1</li>
      <li>list item 2</li>
      <li>list item 3</li>
    </ul>
---

Float items to the left or to the right, with or without spacing between them.

Use a floated list instead of an inline list (see [`scut-list-inline`](list-inline.html)) when you want your list items snuggled right next to each other.

Only the list's immediate children are floated (`ul > li`): Scut does not presume to know what you might plan to do with sub-lists.