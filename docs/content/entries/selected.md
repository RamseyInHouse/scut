---
name: selected
slug: selected
summary: Apply rules to `:hover` and `:focus` (and, optionally, `:active`) states.
type: mixin only
categories:
  - general
args:
  - variable: $active
    default: "false"
    comment: Declare whether or not to target the `:active` state, in addition to `:hover` and `:focus`.
contentblock: |
  A content block passed to this mixin will apply to <i>the selected states</i> (`:hover` and `:focus` &mdash; and, optionally, `:active`).
example:
  html: |
    <p><button class="eg-selected eg-selected-1">This button turns blue on hover and focus</button></p>
    <p><button class="eg-selected eg-selected-2">This button turns blue on hover, focus, and active</button></p>
---

Make your site more friendly for keyboard navigation, especially, by accounting for the various means of targeting elements.