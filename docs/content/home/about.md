For a thorough introduction to Scut, have a look at [my article, "Introducing Scut," on CSS-Tricks](http://css-tricks.com/introducing-scut-new-sass-utility-library/).

### Why use Scut?

#### Avoid repetition

Scut's primary goal is to save people like you and me from repeating the same few lines of styling code, over and over again, to achieve the same effect in different places.

#### Organize your rules

An oft-unsung quality of mixins and placeholders is that they organize your code, *grouping rules according to the effects they combine to achieve*. Even when a mixin applies only a couple of rules (like [`scut-hanging-indent`](#hanging_indent)), it serves this end.

#### Save some Google searching

As we would all like to spend a smaller percentage of our lives sitting at red lights, we also hope to spend less life flicking through search results.

#### Implement best practices

Some of Scut's utilities, such as [`hd-breakpoint`](#hd_breakpoint) and [`font-face`](#font-face), are all about implementing "best practices" &mdash; without looking them up every time you need them.

And for any Scut utility, *if somebody figures out a better way to do it, with more flexibility, better browser support, fewer extra `<div>`s, whatever, Scut should be updated accordingly. **So contribute your fabulous ideas and discoveries!***

### What makes Scut unique?

#### Flexible abstractions of common patterns &mdash; nothing more

Scut doesn't require additional setup and processing, doesn't apply any default sizes, spacing, colors, etc. It is nowhere close to a "framework." The intention is to build utilities that are as simple, flexible, and generic as possible &mdash; abstract patterns that you can work into your own designs without having to override anything or set up site-wide parameters.

#### No vendor prefixes

Some other pre-processor libraries do little more than vendor prefixing. Scut doesn't bother with that: we're looking for other things to do.

Most of Scut's utilities do not use properties that require vendor prefixes. But **if a utility *does* require vendor prefixing, you should be warned in the documentation below. In such cases *and all other cases* Scut suggests that you install and run [Autoprefixer](https://github.com/ai/autoprefixer) as part of the compilation process.** (I rely on [Grunt](http://gruntjs.com/) to make this happen, with the [grunt-autoprefixer plugin](https://github.com/nDmitry/grunt-autoprefixer). Easy as can be.)

#### @extend placeholders

All mixins that require no arguments &mdash; either because they *have* no arguments or because all their arguments have default values &mdash; are paired with [placeholder selectors](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#placeholders), which are good things to use, when you can.

#### `scut-` prefix

To avoid confusions and collisions, all Scut utilities &mdash; mixins, placeholders, functions, variables, whatever &mdash; are prefixed with `scut-`.