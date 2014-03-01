---
name: hide_visually
type: mixin and placeholder (same)
use-name: scut-hide-visually
categories:
  - general
references:
  - description: "Jonathan Snook: \"Hiding Content for Accessibility\""
    url: http://snook.ca/archives/html_and_css/hiding-content-for-accessibility
  - description: HTML5 Boilerplate discussion and research
    url: https://github.com/h5bp/html5-boilerplate/issues/194/
example:
  show-html: true
  html: |
    <div class="eg-hide-visually">This element is visually hidden.</div>
    <div>You can't see the element above this one, can you?</div>
---

Hide an element visually, and effectively remove it from page layout, without hiding it from screen readers. Vital accessibility practice.