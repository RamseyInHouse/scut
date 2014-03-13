---
name: sticky footer
slug: sticky-footer
summary: Ensure that your footer stays down at the bottom of the viewport, where God intended it to be, even if your content is too short to keep it down naturally.
type: mixin only
categories:
  - layout
args:
  - variable: $height
    comment: The height of the footer
  - variable: $wrapper
    default: "\".wrapper\""
    comment: A CSS selector for the page-wrapper element. *Wrap your selector in quotes.*
  - variable: $footer
    default: "\".scut-sticky\""
    comment: A CSS selector for the footer. Wrap this selector in quotes, too.
references:
  - description: "CSS-Tricks: \"Sticky Footer\""
    url: http://css-tricks.com/snippets/css/sticky-footer/
---

Avoid the weird feeling people get and the weird look they give you when they see your footer in the middle of their browser window with only unsettling emptiness beneath.

This one takes some commitment &mdash; but nothing you can't handle:

- **Your sticky footer must have a fixed height.**
- **Your stuff-above-the-footer must be wrapped in a wrapper element.** (The footer itself remains outside of this wrapper.)

**This mixin should not be invoked within a declaration block &mdash; i.e. don't nest it.** The mixin needs to add rules for a number of elements &mdash; `html`, `body`, the wrapper, and the footer &mdash; so it can't be restricted to the context of a different selector.

Since an example of this utility requires its own `<html>` and `<body>` elements, **[this example is relegated to Codepen](http://codepen.io/davidtheclark/pen/ExjiF)**.