---
name: clearfix
slug: clearfix
summary: Make an element adapt its height to fit floated children, and clear floats in both directions.
type: mixin and placeholder (same)
categories:
  - layout
references:
  - description: "Treehouse blog: \"CSS Tip: A Better Clearfix with Sass\""
    url: http://blog.teamtreehouse.com/a-better-clearfix-with-sass
  - description: "CSS-Tricks catalogs various clearfix hacks"
    url: http://css-tricks.com/snippets/css/clear-fix/
  - description: "Nicholas Gallagher: \"A New Micro Clearfix Hack\""
    url: http://nicolasgallagher.com/micro-clearfix-hack/
example:
  show-html: true
  html: |
    <div class="eg-clearfix-container">
      <div class="eg-clearfix-floater">floated</div>
      <div class="eg-clearfix-floater">floated</div>
    </div>
---