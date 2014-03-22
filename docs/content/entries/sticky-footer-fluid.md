---
name: sticky footer, fluid height
slug: sticky-footer-fluid
summary: Ensure that your *fluid-height* footer stays down at the bottom of the viewport, no matter what.
type: mixin only
categories:
  - layout
args:
  - variable: $wrapper
    default: "\".wrapper\""
    comment: A CSS selector for the page-wrapper element. *Wrap your selector in quotes.*
  - variable: $footer
    default: "\".scut-sticky\""
    comment: A CSS selector for the footer. Wrap this selector in quotes, too.
references:
  - description: "\"Sticky CSS Footers: The Flexible Way\""
    url: "http://pixelsvsbytes.com/blog/2011/09/sticky-css-footers-the-flexible-way/"
---

To implement this mixin you'll need the following **a full-page wrapper element, with the footer inside of it.** That's it.

The footer is the wrapper's child, like so:

<pre class="language-html">&lt;body&gt;
  &lt;div class="wrapper"&gt;
    &lt;!-- your page's content --&gt;
    &lt;footer class="scut-sticky"&gt;
      &lt;!-- your footer's content --&gt;
    &lt;/footer&gt;
  &lt;/div&gt;
&lt;/body&gt;</pre>


Then your footer should stick to the bottom of the page, regardless of the height of the content above it *or its own height*. (If you have a fixed-height footer, you could try [`scut-sticky-footer-fixed`](sticky-footer-fixed.html)).

**This mixin should not be invoked within a declaration block &mdash; i.e. don't nest it.** The mixin needs to add rules for a number of elements &mdash; `html`, `body`, the wrapper, and the footer &mdash; so it can't be restricted to the context of a different selector.

Since an example of this utility requires its own `<html>` and `<body>` elements, **[this example is relegated to Codepen](http://codepen.io/davidtheclark/pen/qvngp)**.