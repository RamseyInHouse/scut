---
name: pixels-to-ems
slug: em
summary: Convert pixel-values to `em`-values.
type: function, with an exposed settings-variable
categories:
  - functions
args:
  - variable: $pixels
    comment: The `px`-value you wish to convert to `em`s. No `px` unit necessary (e.g. `20` is fine, so is `20px`). *Passing a list will result in a list of `em` values* (see examples).
  - variable: $base
    default: 16
    comment: A base-value with which to calculate the `em`-value. If there are no units, it's interpreted as *pixels*; but you can use `em`-values, as well. **The `$base` default value can be changed for your project by setting your own `$scut-em-base` variable prior to using this function** (see examples).
example:
  html: |
    <div class="eg-em-c">
      <div class="eg-em eg-em-1">
        Variation 1: 150px wide, in ems
      </div>

      <div class="eg-em eg-em-2">
        Variation 2: 150px wide, in regular pixels (for reference)
      </div>

      <div class="eg-em eg-em-3">
        Variation 3: 250px wide, in ems, with a different base size in px
      </div>

      <div class="eg-em eg-em-4">
        Variation 4: 250px wide, in pixels, with a different base size in px
      </div>

      <div class="eg-em eg-em-5">
        Variation 5: 275px wide, in ems, with a different base size in ems
      </div>

      <div class="eg-em eg-em-6">
        Variation 6: 275px wide, in pixels, with a different base size in ems
      </div>

      <div class="eg-em eg-em-7">
        Variation 7: Demonstrating a list of values being passed, as well as the option of including or leaving out the px unit.
      </div>

      <div class="eg-em eg-em-8">
        Variation 8: You can change the default $scut-em-base value to avoid setting it manually over and over again.
      </div>
    </div>
---

*Pass a single value or a list of values.*

This function eases the burden on those who build flexible, `em`-based layouts but still find themselves thinking in pixels or using tools that speak in pixels.

Unlike other px-to-ems mixins I've seen, this one provides flexibility for situations in which the `em`-value has to be calculated in relation to something other than a default `16px font-size`.

If a `$base` argument is provided, the `em`-value will be calculated relative to that `$base` (by default, `$base` is assumed to be `16`). If that `$base` is in pixels, everything should work smoothly, no questions asked. *You can also provide a `$base` in ems* &mdash; but this is trickier: it will only work if your `em`s are not more than one layer deep.

<small>(For example, if your element is the child of a container whose `font-size` is an `em`-value other than `1em`, you can pass the `font-size` as the `$base` argument and everything will work fine (see example variations 5 and 6), But if the container has a `font-size` in `em`s (not `1em`), and a child of it has a `font-size` in `em`s (also not `1em`), and you're adjusting a grandchild ... things will probably go wrong. So, again, I don't suggest trying to use this function three or more levels deep in `em`-relativity.)</small>

**If you're worried about these nesting issues and want to use `rem` units, instead, try the [`scut-rem` function](rem.html) or the [`scut-rem-fallback` mixin](rem-fallback.html).**