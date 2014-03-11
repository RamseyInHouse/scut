---
name: reset
slug: reset
summary: A small set of modular resets, each one an independent mixin.
type: mixin only
categories:
  - general
args:
  - variable: $exclude
    default: "false"
    comment: Names of reset modules to exclude.
---

The master mixin, `scut-reset`, calls them all *minus any that you exclude with the `$exclude` argument`*. Alternately, you could pick and choose yourself, calling only those you need.

Also, you could *scope* (most of) these resets by nesting them within an element. (You can't really scope `antialias` because it sets a rule on the `body` element.)

The modular reset mixins include the following (*I suggest viewing the source code as well, so you know what you're getting into*):

- **border-box**: make everything a `border-box`
- **antialias**: set `-webkit-font-smoothing: antialiased` on the `body`
- **semanticize**: make headers (`<h1><h2><h3><h4><h5><h6>`) and `<b>` elements semantic rather than presentational
- **pointer**: give `cursor: pointer` to clickable form elements (`label`, `selected`, `option`, `button`)
- **form**: reset `fieldset` and restrict `textarea` to `resize: vertical`
- **button**: reset default button styles that never get used and nobody seems to like
- **paragraph**: remove `margin-top` from the `first-of-type` paragraph and `margin-bottom` from the `last-of-type` one.

*These "reset" modules are not meant to serve the same purpose as a big reset/normalizer like the ol' Eric Meyer, the Compass Reset, or Normalize.* Leave that base-level, grand-scheme-of-things resetting to one of those tried-and-true standards. Scut's "reset" modules, in contrast, are opinionated little attacks on specific elements.

Here's the reasoning: I've found myself implementing the same element-specific resets over and over again, project after project &mdash; making headers semantic rather than presentational; removing all the default button styling; and so on. So I decided to start stashing those resets for future projects. That's what `scut-reset` is.

If you want to use *all* the `scut-reset` modules, somewhere in your stylesheet (not nested within any other rulesets), do this:

<pre class="language-scss"><code>@include scut-reset;</code></pre>

To exclude specific modules, pass their names in a list *without commas* as the `$exclude` argument. For example, to avoid the `semanticize` and `paragraph` modules:

<pre class="language-scss"><code>@include scut-reset(semanticize paragraph);</code></pre>

To instead call *only specific modules*, use `@include scut-reset-[name]`. For example:

<pre class="language-scss"><code>@include scut-reset-paragraph;
@include scut-reset-button;</code></pre>

And to scope the rest, just nest. See!

<pre class="language-scss"><code>// call all the resets but `paragraph`
@include scut-reset(paragraph);
// but use `scut-reset-paragraph` within a specific context
.article-content {
  @include scut-reset-paragraph;
}</code></pre>