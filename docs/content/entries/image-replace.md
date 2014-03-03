---
name: image replacement
slug: image-replace
summary: Include text in the markup but replace it with an image.
type: mixin and placeholder (same)
categories:
  - general
references:
  - description: "L. Jeffrey Zeldman: \"Replacing the -9999px Hack (New Image Replacement)\""
    url: http://www.zeldman.com/2012/03/01/replacing-the-9999px-hack-new-image-replacement/
example:
  show-html: true
  html: |
    <p>The following image is replacing text:</p>
    <div class="eg-image-replace">This text has been replaced.</div>
---

Be warned: you might run into occasional bugs with this method of image-replacement *unless you've also set a `width` on your element.*