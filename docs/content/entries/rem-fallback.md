---
name: REMs with fallback
slug: rem-fallback
summary: Use `rem` values with a `px`-value fallback for IE8- and Opera Mini.
type: mixin only
categories:
  - general
args:
  - variable: $pixels
    comment: |
      The `px`-value you wish to convert to `rem`s. No `px` unit necessary (e.g. `20` is fine, so is `20px`). *Passing a list will result in a list of `rem` values* (see examples).
  - variable: $property
    default: font-size
    comment: |
      The CSS property to which you'll apply the `rem`-value (along with its `px`-value fallback).
references:
  - description: "Jonathan Snook: \"Font Sizing With Rem\""
    url: "http://snook.ca/archives/html_and_css/font-size-with-rem"
example:
  html: |
    <div class="eg-rem-fallback eg-rem-fallback-1">
      Variation 1: with a font-size of 20px.
    </div>
    <div class="eg-rem-fallback eg-rem-fallback-2">
      Variation 2: with a font-size in rems matching 20px, and a true-pixel-value fallback.
    </div>
    <div class="eg-rem-fallback eg-rem-fallback-3">
      Variation 3: Demonstrating 1) the $property argument, 2) that you can pass a list of pixels-values, and 3) that you can include or exclude the px-unit.
    </div>
---

***Note: The base pixel value with which to calculate your `rem`-value is by default `16px`: to change this for your project, you can set your own `$scut-rem-base` variable prior to using this mixin***.

Take a look at [Jonathan Snook's article on the issue](http://snook.ca/archives/html_and_css/font-size-with-rem) to learn about this fallback trick &mdash; why it's necessary and why it works.

**If you don't need to support IE8 and Opera Mini, consider using the [`scut-rem` function](rem.html)**, instead, so you don't have to pass the CSS property as an argument.

Also, have a look at [`scut-rem`'s entry](rem.html) for more information (and references) about `rem` units, how they differ from `em` units, and the compatibility issue.