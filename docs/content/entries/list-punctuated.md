---
name: "list: punctuated"
slug: list-punctuated
summary: Punctuate an HTML list.
type: mixin, with extension placeholder(s)
categories:
  - layout
args:
  - variable: $divider
    default: "\", \""
  - variable: $display
    default: inline
    comment: Change to `inline-block` if you don't want your list items spanning lines.
  - variable: $no-margin
    default: true
    comment: If `true`, top and bottom margins will be removed from the list.
compatibility: |
  This utility uses the `:not` and `:last-child` selectors, which are not supported in IE8 without a polyfill.
example:
  html: |
    <ul class="eg-punctuated-list">
      <li>list item</li>
      <li>list item</li>
      <li>list item</li>
    </ul>
    <ul class="eg-semicolon-list">
      <li>list item</li>
      <li>list item</li>
      <li>list item</li>
    </ul>
    <ul class="eg-circle-list">
      <li>list item</li>
      <li>list item</li>
      <li>list item</li>
    </ul>
---

Keep your HTML semantic and your punctuation traditional.

Since the most common punctuated list uses commas, commas are the default `$divider` and the comma list is available as its own placeholder:

- **`%scut-list-comma`**

Only the list's immediate children are punctuated (`ul > li`): Scut does not presume to know what you plan to do with sub-lists.