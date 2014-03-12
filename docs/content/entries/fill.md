---
name: fill
slug: fill
summary: Make an element fill its parent.
type: mixin, with a default-values placeholder
categories:
  - layout
args:
  - variable: $width-height
    default: false
    comment: |
      Use 100% width and height (instead of zero coordinates) on all sides. See description and example below to learn *why* you might do this.
example:
  show-html: true
  html: |
    <p>Default method:</p>
    <div class="eg-fill-container">
      Parent provides the border
      <div class="eg-fill eg-fill-1">
        Child provides the background
      </div>
    </div>
    <p>Default method <em>not working</em> with an <code>&lt;img&gt;</code> element (to illustrate the issue):</p>
    <div class="eg-fill-container">
      <img src="http://placehold.it/200x100" class="eg-fill eg-fill-2" alt="placeholder">
    </div>
    <p>Width-height method working with an <code>&lt;img&gt;</code> element:</p>
    <div class="eg-fill-container">
      <img src="http://placehold.it/200x100" class="eg-fill eg-fill-3" alt="placeholder">
    </div>
---

This utility provides two methods for filling. Both position the element absolutely. Both set `top: 0` and `left: 0`. Then:

- The default method, with `$width-height: false`, applies `right: 0; bottom: 0;` &mdash; so all four coordinates are `0`. **The default method works for "non-replaced" HTML elements (most of them).**
- The width-height method, with `$width-height: true`, applies `width: 100%; height: 100%`. **The width-height method works the same for "replaced" and "non-replaced" HTML elements; *but this method can run into problems if you don't use `box-sizing: border-box` and the parent element has borders or padding*** (even with `border-box`, problems occasionally arise).

To learn more about "replaced" vs. "non-replaced" elements, have a look at [this Sitepoint article on the subject](http://reference.sitepoint.com/css/replacedelements). Basically, "replaced" elements are those that have intrinsic dimensions determined by their content &mdash; examples include form elements (e.g. `input`, `textarea`, `button`, `selected`), media elements (e.g. `img`, `video`), `iframe` elements, and probably others I don't know about. For replaced elements, you need to manually set whatever dimensions you want to control: just positioning absolutely and setting all coordinates won't do. See the example below.

And note this: **Because this mixin positions the element absolutely, *the parent-to-be-filled must be *positioned** &mdash; meaning that you must assign `position: relative` to the parent if its position is not already `absolute` or `fixed`.