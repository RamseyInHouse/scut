---
name: key-value punctuation
slug: key-val
summary: Style (and punctuate) key-value pairs that you have semantically marked-up as definition lists.
type: mixin, with default-values placeholder
categories:
  - typography
args:
  - variable: $divider
    default: "\":\""
    comment: Content (most likely punctuation) to divide the *term* from the *description*.
  - variable: $pad
    default: 0.25em
    comment: Horizontal space between the `$divider` and the description.
  - variable: $indent
    default: 1em
    comment: Indentation of the description.
  - variable: $spacing
    default: 0
    comment: Vertical space between term-description pairs.
  - variable: $pad-left
    default: 0
    comment: Horizontal space between the `$divider` and the term.
example:
  show-html: true
  html: |
    <div class="eg-key-val-c">
      <dl class="eg-key-val-1">
        <dt>Name</dt>
        <dd>Lorem Ipsum</dd>
        <dt>Occupation</dt>
        <dd>Placeholder</dd>
        <dt>Children</dt>
        <dd>None</dd>
        <dt>Excuses</dt>
        <dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. </dd>
      </dl>
      <dl class="eg-key-val-2">
        <dt>Consolation</dt>
        <dd>Alleviation of misery or distress of mind</dd>
        <dt>Depression</dt>
        <dd>A sinking of the spirits</dd>
        <dt>Equanimity</dt>
        <dd>A state of resistance to elation, depression, anger, etc.</dd>
      </dl>
      <dl class="eg-key-val-3">
        <dt>Doom</dt>
        <dd>Fate decreed or determined; fixed fortune; irrevocable destiny.</dd>
        <dt>Waggle</dt>
        <dd>To cause to wag frequently and with short motions; move first one way and then the other.</dd>
        <dt>Pantaloon</dt>
        <dd>In early Italian comedy, a character usually represented as a lean and foolish old man (properly a Venetian), wearing spectacles and slippers.</dd>
      </dl>
    </div>
references:
  - description: WhatWG on the <code>&lt;dl&gt;</code> element
    url: "http://www.whatwg.org/specs/web-apps/current-work/multipage/grouping-content.html#the-dl-element"
  - description: HTML5 Doctor on the <code>&lt;dl&gt;</code> element
    url: "http://html5doctor.com/the-dl-element/"
---

You've probably been wondering how to *semantically mark-up your lists of keys and values* &mdash; your labelled bits of information. You've probably been gnawing your fingernails to nubs, panicked with uncertainty. Well wait 'till you hear this: The answer seems to be *description (or <i>association</i>) lists* &mdash; the `<dl>`, `<dt>`, and `<dd>` elements. (See the References listed below.)

**WhatWG says "The dl element represents an association list consisting of zero or more name-value groups (a description list)."** There you have it. What you've been looking for.

One traditional manner of *styling* such associative lists is with *colon-separated name-value pairs*, the first line flush left and following lines indented (the fabled ["hanging indent"](hanging-indent.html)). This mixin should help make that dream a reality. And it also enables many other common key-value formats, a couple of which are shown in the examples below.

**Apply the mixin to your `<dl>` element.**

*A note about spacing*: There are several spacing variables &mdash; so this might clear things up:
- On the *first line*, you have: `[term][$pad-left][$divider][$pad][description]`
- On *following lines* the description is indented with `$indent` (see Example 1). (You will also notice the effects of `$indent` on the first line if it is wider than your term &mdash; as in Examples 2 and 3.)
- Vertical spacing between term-description groups is controlled with `$spacing` (see Example 2).