## About

You can think of the word Scut as an acronym for ***S***ass-***C***SS ***Ut***itilies.

Or think of it this way: **Scut will help you, the frontend laborer, do your *scut work***.

(But do be careful how you use the word in polite company. It's meanings are ... many.)

<a href="{{github-home}}" class="btn">Visit the Github repository</a>

<a href="{{codepen-url}}" target="_blank" class="btn">Experiment with Scut on Codepen</a>

**Scut is now at v1.0.0 &mdash; so should be stable.** It has been around for a little while and used by some number of people, and during that time has undergone very few breaking changes; so it seems like the structure is sound, and I think it's ready to be called "stable." (Of course new non-breaking features will still be added and bugs will be fixed.)

Still: *if some part of Scut that you had been using suddenly doesn't work, please check this documentation to see what changed.* Also, you might want to <a href="{{github-home}}/blob/master/CHANGELOG.md">have a look at the changelog</a>.

For a thorough introduction to Scut, have a look at [my article, "Introducing Scut," on CSS-Tricks](http://css-tricks.com/introducing-scut-new-sass-utility-library/).

## Why use Scut?

### Avoid repetition

Scut's primary goal is to save people like you and me from repeating the same few lines of styling code, over and over again, to achieve the same effect in different places.

### Do difficult hacky things easily

Like vertically centering, or creating fluid-width boxes with a consistent aspect ratio.

### Organize your rules

An oft-unsung quality of mixins and placeholders is that they organize your code, *grouping rules according to the effects they combine to achieve*. Even when a mixin applies only a couple of rules (like [`scut-hanging-indent`](hanging-indent.html)), it serves this end.

### Implement best practices

Some of Scut's utilities, such as [`hd-breakpoint`](hd-bp.html) and [`font-face`](font-face.html), are all about implementing "best practices" &mdash; without looking them up every time you need them.

And for any Scut utility, *if you know of a better way to do the same thing, with more flexibility, better browser support, fewer extra `<div>`s, whatever, Scut should be updated accordingly. **So contribute your discoveries and ideas!***

## What makes Scut unique?

### Flexible abstractions of common patterns &mdash; nothing more

Scut doesn't require additional setup and processing, doesn't apply any default sizes, spacing, colors, etc. It is nothing like a "framework" &mdash; just a stylesheet that you can `@import` at will. Scut utilities should be as simple, flexible, and generic as possible: abstract patterns that you can work into your own designs without having to override anything or set up site-wide parameters. And you should be able to add them into your workflow with a simple `@import` statement, no matter what your stack.

### No vendor prefixes

Most other pre-processor libraries do little more than vendor prefixing. Scut doesn't bother with that. (Do it your own way, of course; but I prefer [Autoprefixer](https://github.com/ai/autoprefixer).)

### @extend placeholders

All mixins that require no arguments &mdash; either because they *have* no arguments or because all their arguments have default values &mdash; are paired with [placeholder selectors](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#placeholders), which are good things to use, when you can.

### `scut-` prefix

To avoid confusions and collisions, all Scut utilities &mdash; mixins, placeholders, functions, variables, whatever &mdash; are prefixed with `scut-`.