---
name: "list: custom"
slug: list-custom
summary: Fully customize your list-item markers, with either characters or counters.
type: mixin only
categories:
  - layout
args:
  - variable: $content
    default: "\"\\2022\" (bullet)"
    comment: |
      A character to mark list items; *or* enter `count` to indicate that you want to use a counter, optionally followed by 1) a string to follow the counter, and 2) a `list-style-type` for the counter. See examples.
  - variable: $marker-width
    default: 0.75em
    comment: |
      A width for the list-item marker-space &mdash; a.k.a the left-margin of the list-item content.
  - variable: $pad
    default: 0
    comment: |
      Padding *to the left of* the list-item marker.
  - variable: $no-margin
    default: "false"
    comment: If `true`, top and bottom margins will be removed from the list. *Note that the default here is `false`, unlike for the other list mixins.*
contentblock: |
  A content block passed to this mixin will be applied to the list-item markers.
example:
  html: |
    <ul class="eg-list-custom-1">
      <li>short item</li>
      <li>medium item medium item medium item medium item</li>
      <li>long item long item long item long item long item long item long item long item long item long item long item long item long item</li>
    </ul>
    <ul class="eg-list-custom-2">
      <li>short item</li>
      <li>medium item medium item medium item medium item</li>
      <li>long item long item long item long item long item long item long item long item long item long item long item long item long item</li>
    </ul>
    <ul class="eg-list-custom-3">
      <li>short item</li>
      <li>medium item medium item medium item medium item</li>
      <li>long item long item long item long item long item long item long item long item long item long item long item long item long item</li>
    </ul>
    <ul class="eg-list-custom-4">
      <li>short item</li>
      <li>medium item medium item medium item medium item</li>
      <li>long item long item long item long item long item long item long item long item long item long item long item long item long item</li>
    </ul>
references:
  - description: "CSS-Tricks: \"Numbering In Style\""
    url: "http://css-tricks.com/numbering-in-style/"
  - description: "Gabriele Romanato: \"How To Benefit From CSS Generated Content and Counter\" (<cite>Smashing Magazine</cite>)"
    url: "http://coding.smashingmagazine.com/2013/04/12/css-generated-content-counters/"
  - description: "MDN: \"Using CSS Counters\""
    url: "https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Counters"
---

This utility creates the list-item marker as an absolutely positioned `:before` psuedo-element, which can be given any `$content` you'd like and styled just like any other element.

Pass a string or unicode value as `$content` and things should explain themselves. Consider using [`scut-characters`](characters.html).

Or if you want a counter, pass `count`, optionally followed by 1) a string to follow the counter (e.g. in this list I'm using ")" after the counter), and 2) a `list-style-type` for the counter (refer to <a href="https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type">MDN's reference list</a>).

Spacing is set with the `$marker-width` and `$pad` arguments. And any amount of customization can happen in the `@content` block.

Refer to the examples, please, for further clarification. Please.