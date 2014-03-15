---
name: reverse italics
slug: reverse-italics
summary: Italicize a section of text while *de-italicizing* those elements that would normally be italicized &mdash; such as `<em>`, `<cite>`, and `<i>`.
type: mixin, with default-values placeholder
categories:
  - typography
args:
  - variable: $elements
    default: "false"
    comment: "A list (not comma separated) of CSS selectors for elements that you do *not* want italicized (`<em>`, `<cite>`, and `<i>` are already taken care of: see below). *Wrap your selectors in quotes.*"
example:
  show-html: true
  html: |
    <p class="eg-reverse-italics-default">DEFAULT:
      <em>Some &lt;em&gt; text</em> sit amet, consectetuer adipiscing elit.
      <cite>Some &lt;cite&gt; text</cite>, aenean commodo ligula eget dolor.
      <strong>Some &lt;strong&gt; text</strong> Cum sociis natoque penatibus
      <i>some &lt;i&gt; text</i> et magnis dis parturient montes, nascetur ridiculus mus
      <b>some &lt;b&gt; text</b>.
      <span class="no-italics">And a &lt;span&gt; with the classname "no-italics".</span>
    </p>
    <p class="eg-reverse-italics-variant">VARIANT:
      <em>Some &lt;em&gt; text</em> sit amet, consectetuer adipiscing elit.
      <cite>Some &lt;cite&gt; text</cite>, aenean commodo ligula eget dolor.
      <strong>Some &lt;strong&gt; text</strong> Cum sociis natoque penatibus
      <i>some &lt;i&gt; text</i> et magnis dis parturient montes, nascetur ridiculus mus
      <b>some &lt;b&gt; text</b>.
      <span class="no-italics">And a &lt;span&gt; with the classname "no-italics".</span>
    </p>
---

This is common typographical practice: In non-italicized text, italics provide mild stress; but in an italicized passage, it is the *non-italicized* text that is stressed. (Everything is relative and nothing means anything.)

The elements `<em>`, `<cite>`, and `<i>`, which browsers typically italicize, are by default de-italicized. To de-italicize *more* elements, include their selectors in a list that you pass to the mixin.