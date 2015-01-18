---
name: font-face
slug: font-face
summary: Implement cross-browser `@font-face` with the greatest of ease.
type: mixin only
categories:
  - typography
args:
  - variable: $font-family
    comment: A name for the font.
  - variable: $file-path
    comment: The relative path to the font's files, **including the files' common path and name and excluding their extensions**.
  - variable: $weight
    default: normal
    comment: "A `font-weight` value. **This argument is *optional*: you can just leave it out for your italic non-bold fonts.** See the example below."
  - variable: $style
    default: normal
    comment: A `font-style` value.
  - variable: $formats
    default: eot woff2 woff ttf svg
    comment: "The font formats that you would like to include (in case you don't have them all, or you want to thin out your code for modern browsers, or whatever your private reasons)."
references:
  - description: "CSS-Tricks: \"Using @font-face\""
    url: http://css-tricks.com/snippets/css/using-font-face/
  - description: "Fontspring: \"The New Bulletproof @Font-Face Syntax\""
    url: http://www.fontspring.com/blog/the-new-bulletproof-font-face-syntax
---

The method Scut uses is that advocated by CSS-Tricks and used by Font Squirrel (see references). It solves all kinds of cross-browser issues going all the way back to IE6.

For example, to implement all varieties of Arvo:
<pre class="language-scss"><code>@include scut-font-face("Arvo", "fonts/arvo-regular-webfont");
@include scut-font-face("Arvo", "fonts/arvo-bold-webfont", bold);
@include scut-font-face("Arvo", "fonts/arvo-italic-webfont", italic);
// or @include scut-font-face("Arvo", "fonts/arvo-italic-webfont", normal, italic);
@include scut-font-face("Arvo", "fonts/arvo-bolditalic-webfont", bold, italic);</code></pre>

If, for whatever reason, you do not want to include all of the default formats that are required for the far-far-back cross-browser compatibility (`eot`, `woff2`, `woff`, `ttf`, and `svg`), then include your own `$formats` list, e.g.:
<pre class="language-scss"><code>@include scut-font-face("Arvo", "fonts/arvo-regular-webfont", $formats: woff ttf);</code></pre>

If you have a font but don't have all the varieties, try Font Squirrel's [Webfont Generator](http://www.fontsquirrel.com/tools/webfont-generator).
