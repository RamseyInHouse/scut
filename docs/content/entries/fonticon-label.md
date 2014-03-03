---
name: fonticon label
slug: fonticon-label
summary: Pair the icons from your rad icon fonts with text labels, using semantic HTML and no extraneous elements.
type: mixin only
categories:
  - layout
args:
  - variable: $font
    comment: The name of your icon font
  - variable: $glyph
    comment: The Unicode character code for a specific icon from your icon font (please feel free to use variables)
  - variable: $space
    default: 0.25em
    comment: Spacing between the icon and the label
  - variable: $side
    default: before
    comment: |
      `before` or `after`, translating to the pseudo-element for the icon &mdash; so on which side of the label do you want the icon?
contentblock: |
  A content block passed to this mixin will be applied to the icon (either the `:before` or `:after` pseudo-element).
example:
  show-html: true
  html: |
    <p><button class="eg-fonticon-label m-1">Play &amp; Pause</button></p>
    <p><button class="eg-fonticon-label m-2">Stop</button></p>
    <p><button class="eg-fonticon-label m-3">Fast Forwards</button></p>
    <p><button class="eg-fonticon-label m-4">Rewind</button></p>
---

By default, icons are grafted on as `inline-block` pseudo-elements, vertically centered with the label. The mixin also takes care of some common needs: it sets the `font-style` and `font-weight` to `normal` and `-webkit-font-smoothing` to `antialiased`.

Icons can be placed on the left or right of the label and spaced according to your learn&egrave;d discretion. Additional customization is possible by either passing a content block or adding rules to the relevant pseudo-element.

The examples below illustrate some of the possibilities.