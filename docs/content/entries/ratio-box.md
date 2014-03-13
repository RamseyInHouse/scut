---
name: ratio-box
slug: ratio-box
summary: Give an element with unknown or fluid width a fixed aspect ratio.
type: mixin, with default-values placeholder
categories:
  - layout
args:
  - variable: $ratio
    default: 1/1
    comment: "The ratio-box's ratio: a fraction signifying width / height. The default, 1/1, is a square. Photos and videos usually come in 4/3 or 16/9 ratios."
references:
  - description: "Thierry Koblentz: \"Creating Intrinsic Ratios for Video\" (<cite>A List Apart</cite>)"
    url: "http://alistapart.com/article/creating-intrinsic-ratios-for-video"
  - description: "Nicholas Gallagher: \"Flexible CSS Cover Images\""
    url: "http://nicolasgallagher.com/flexible-css-cover-images/"
example:
  show-html: true
  html: |
    <p>These containers have different widths, but the ratio-boxes remain squares.</p>
    <div class="eg-ratio eg-ratio-1"></div>
    <div class="eg-ratio eg-ratio-2"></div>
    <p>And the same principle applies to these, which maintain a 16/9 ratio and use a different classname for the inner element:</p>
    <div class="eg-ratio eg-ratio-3"></div>
    <div class="eg-ratio eg-ratio-4">
      <div class="eg-ratio-inner">Content inside</div>
    </div>
---

This is especially useful if you want a `background-image` to preserve a ratio as a regular `<img>` can. (For more details on how you might tailor the presentation of those `background-image`s, have a look at the Nicholas Gallagher reference below.)

**An important note: Any content you put inside the ratio-boxes needs to be absolutely positioned.** Otherwise it will screw with the ratio. So `position: relative` is set on the ratio-box to ease that. See the last example.