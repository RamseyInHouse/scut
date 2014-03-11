---
name: pixels-to-rems
slug: rem
summary: Convert pixel-values to `rem`-values.
type: function
categories:
  - functions
args:
  - variable: $pixels
    comment: |
      The `px`-value you wish to convert to `rem`s. No `px` unit necessary (e.g. `20` is fine, so is `20px`). *Passing a list will result in a list of `rem` values* (see examples).
compatibility: |
  IE8 and Opera Mini do not support `rem` units. If you want to support these browsers you must provide a fallback in pixels &mdash; which Scut can do with the [`scut-rem-fallback` mixin](rem-fallback.html).
example:
  show-html: true
  html: |
    <div class="eg-rem eg-rem-1">
      Variation 1: 24px font-size, in regular pixels
    </div>
    <div class="eg-rem eg-rem-2">
      Variation 2: 24px font-size converted to rems
    </div>
    <div class="eg-rem-3-container">
      <div class="eg-rem eg-rem-3">
        Variation 3: 24px font-size wide in rems, nested inside a div with a font-size of 1000px. No effect!
      </div>
    </div>
    <div class="eg-rem eg-rem-4">
      Variation 4: Showing that a list of px values can be passed, and that the px unit is optional.
    </div>
---

*Pass a single value or a list of values.*

***Note: The base pixel value with which to calculate your `rem`-value is by default `16px`: to change this for your project, you can set your own `$scut-rem-base` variable prior to using this function***. *(Unlike [`scut-em`](em.html), it is presumed that you will only need to set this variable *once* per project, so it is not also an argument in the function.)*

Like [`scut-em`](em.html), this function makes (limited parts of) life easier for those of us who appreciate the many benefits of relative units but still find themselves thinking in pixels, or (what's especially common) dealing with tools or other people that speak in pixels.

For a good description of the differences between `em` and `rem` units, coupled with some examples of why `rem`s are handy, read ["In Defense of Rem Units" on the Harvest blog](http://techtime.getharvest.com/blog/in-defense-of-rem-units). For an alternative perspective, in favor of `em`s, try [Filament Group's  "On ems and rems"](http://filamentgroup.com/lab/on_ems_and_rems/). The example below illustrates the main difference: `rem`s are always relative to the root `html` element, not to the subject-element's parent.

**Please note the compatibility issue with this utility: If you need a `px`-value fallbacks to support IE8 and Opera Mini, use the [`scut-rem-fallback` mixin](rem-fallback.html) instead of this function.**

If you're *really* worried about this compatibility issue, you might also consider using [`scut-em`](em.html), instead.