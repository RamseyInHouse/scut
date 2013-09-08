# SCUT: A Collection of SCSS utilities

**Warning: You are more than welcome to use or contribute to this collection; but it is currently unstable, under active devlepment. Anything might change at any time.**

## What SCUT is

Some relevant definitions of the word:
- *A short, stubby, erect tail, as of a rabbit or dear.*
- *Routine, tedious, distasteful, menial labor; drudgery.*
- *A contemptible, despicable person.*

It's also an acronym for **SC**SS **Ut**itilies.

What we have here is collection of SCSS mixins and placeholders &mdash; utilities. The contents of this collection are determined by what I've needed for the projects I've been working on &mdash; what I've been able to figure out for the situations I (repeatedly) encounter.

## How SCUT differs from other preprocessor libraries

### Relies on Autoprefixer for vendor prefixes
Some other preprocessor libraries do little more than vendor prefixing. This collection, instead, simply relies on [Autoprefixer](https://github.com/ai/autoprefixer), then finds other things to do. **If you do use this collection in a project, do not forget to install and run Autoprefixer as part of the compilation process.** (As you can see, I use [Grunt](http://gruntjs.com/) to make this happen (see [grunt-autoprefixer](https://github.com/nDmitry/grunt-autoprefixer)).)

### Offers Sass @extend placeholders
All mixins that require no explicit variables, either because there are no variables or because all variables have default values, are paired with [placeholder selectors](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#placeholders), which are good things to use.

## `scut-` prefix

To avoid naming collisions &mdash; since this collection may be used alongside other libraries and your own rulesets &mdash; all mixins and placeholders are prefixed with `scut-`.

