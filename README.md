# SCUT: A Collection of SCSS utilities

**Warning: You are more than welcome to use or contribute to this collection; but it is currently unstable, under active devlepment. Anything might change at any time.**

## What is SCUT?

Some definitions of the word:
- *A short, stubby, erect tail, as of a rabbit or dear.*
- *Routine, tedious, distasteful, menial labor; drudgery.*
- *A contemptible, despicable person.*

Now you understand, right?

It's also an acronym for **SC**SS **Ut**itilies.

What we have here is collection of SCSS mixins and placeholders -- utilities -- that either

- don't exist in the larger libraries (like [Bourbon](http://bourbon.io/) or [Compass](http://compass-style.org/) or [Intuit](http://inuitcss.com/)), or
- aren't done there exactly the way I've wanted them done for my own projects.

The contents of this collection are determined by what I've needed for the projects I've been working on &mdash; what I've been able to figure out for the situations I encounter.

## How is this collection different from other preprocessor libraries?

### Relies on Autoprefixer for vendor prefixes
Some other preprocessor libraries do little more than vendor prefixing. This collection, instead, simply relies on [Autoprefixer](https://github.com/ai/autoprefixer), and does other things. **If you do use this collection in a project, do not forget to install and run Autoprefixer as part of the compilation process.** (As you can see, I use [Grunt](http://gruntjs.com/) to make this happen.)

### Offers Sass @extend placeholders
All mixins that require no explicit variables (either because there are no variables or because all variables have default values) are paired with [placeholder selectors](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#placeholders), which are good things to use.

## `scut-` prefix

To avoid naming collisions &mdash; since this collection may be used alongside other libraries or even your own rulesets &mdash; all mixins and placeholders are prefixed with `scut-`.

