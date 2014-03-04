---
name: hanging indent
slug: hanging-indent
summary: Apply a "hanging indent," which applies to all lines but the first &mdash; as opposed to the "normal" indent, applying to only the first line, that you're accustomed to from those print publications you may have seen.
type: mixin, with default-values placeholder
categories:
  - typography
args:
  - variable: $indent
    default: 1em
example:
  html: |
    <div class="eg-hanging-indent m-1">Lastname, Firstname. <cite>Title of the Work</cite>. City, State: Publisher, YEAR. Print.
    </div>
    <div class="eg-hanging-indent m-2">Lastnameofanotherlady, Firstname. <cite>Title of Another Work</cite>. City, State: Publisher, YEAR. Print.
    </div>
---

My&nbsp;<cite>Chicago Manual of Style</cite>&nbsp;also calls it the <i>flush-and-hang</i> style. I like that.

Hanging indents are standard fare for indexes and works cited, but may seem obscure to you if you're no scholar ... until one day you realize that you do need them, and have needed them all along ...