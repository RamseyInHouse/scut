---
name: "list: divided"
slug: list-divided
summary: Create a floated list with a dividing pseudo-element between list items.
type: mixin, with extension placeholder(s)
categories:
  - layout
args:
  - variable: $divider
    default: "\"|\""
  - variable: $space
    default: 0.5em
    comment: Spacing to separate your dividers (on both sides) from your list items.
  - variable: $dir
    default: left
    comment: The `float` direction.
  - variable: $height
    default: false
    comment: Manually set a height for the list items so that you can use tall dividers. See examples below.
  - variable: $no-margin
    default: true
    comment: If `true`, top and bottom margins will be removed from the list.
contentblock: |
  A content block passed to this mixin will be applied to the dividing pseudo-elements.
example:
  html: |
    <ul class="eg-list-bar">
      <li>list item 1</li>
      <li>list item 2</li>
      <li>list item 3</li>
    </ul>
    <ul class="eg-list-breadcrumb">
      <li>list item 1</li>
      <li>list item 2</li>
      <li>list item 3</li>
    </ul>
    <ul class="eg-list-divided-1">
      <li>list item 1</li>
      <li>list item 2</li>
      <li>list item 3</li>
    </ul>
    <ul class="eg-list-divided-2">
      <li>list item 1</li>
      <li>list item 2</li>
      <li>list item 3</li>
    </ul>
---

A couple of common variations have their own placeholders:

- **`%scut-list-bar`**
- **`%scut-list-breadcrumb`**

But, of course, all things are possible.

The `$height` argument is kind of tricky: If you want a `$divider` *taller* than your list items, you need include a `$height` argument to ensure nice neat vertical alignment. See the example below.

Only the list's immediate children are divided (`ul > li`): Scut does not presume to know what you plan to do with sub-lists.