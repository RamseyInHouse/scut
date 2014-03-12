---
name: center transform
slug: center-transform
summary: Center an element without fixed dimensions, vertically, horizontally, or both ways, via CSS `transform`.
type: mixin, with extension placeholder(s)
categories:
  - layout
args:
  - variable: $axis
    default: "false"
    comment: |
      Leave `false` to center on both axes; or set to `x` or `y` to center on one axis only.
compatibility: |
  This utility uses a CSS `transform`, so will not work with IE8. Also note that `transform` requires vendor prefixes, which are included in the utility.
references:
  - description: "CSS-Tricks: \"Centering Percentage Width/Height Elements\""
    url: http://css-tricks.com/centering-percentage-widthheight-elements/
example:
  html: |
    <div class="eg-center-transform-container">
      <div class="eg-center-transform eg-center-transform-1">
        Variation 1
      </div>
    </div>
    <div class="eg-center-transform-container">
      <div class="eg-center-transform eg-center-transform-2">
        Variation 2
      </div>
    </div>
    <div class="eg-center-transform-container">
      <div class="eg-center-transform eg-center-transform-3">
        Variation 3
      </div>
    </div>
    <div class="eg-center-transform-container m-large">
      <div class="eg-center-transform eg-center-transform-4">
        <p>Variation 4</p>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
      </div>
    </div>
---

(If your element *does* have fixed dimensions on each axis you wish to center, you may enjoy the primitive browser support and vendorprefixlessness of [`scut-center-absolutely`](center-absolutely.html).)

Be warned: **This method uses `position: absolute`, so the parent within which you'll be centering must have a `position` value other than `static`.**

If you pass no arguments, both axes get the treatment; or you can pass `x` or `y` to center on one axis only.

These three varieties are available with three extension placeholders:

- **`%scut-center-transform`**
- **`%scut-center-tranform-x`**
- **`%scut-center-transform-y`**

Also, notice that an alias is provided for vertical centering: [`scut-vcenter-tt`](vcenter-tt.html) (fitting the `vcenter` naming convention).