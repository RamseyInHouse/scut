# Scut

**&mdash; a collection of Sass (SCSS) mixins and placeholders for common styling patterns.**

You can think of the word Scut as an acronym for *SC*SS *Ut*itilies.

(Or you can think of the word in other ways: Scut will do your *scut work*; let Scut be your *scut monkey*. (Be careful how you use this word in polite company. To learn its many and colorful connotations, [have a look at Wiktionary](http://en.wiktionary.org/wiki/scut).))

> [Full documentation available here!](http://davidtheclark.github.io/scut/)

### Differences from other pre-processor libraries

Like Compass, Bourbon, etc.

#### No vendor prefixes

Scut simply relies on [Autoprefixer](https://github.com/ai/autoprefixer), then looks for other things to do.

Because of this, **if you are using Scut, *do not forget to install and run Autoprefixer as part of your compilation process.***

(I use [Grunt](http://gruntjs.com/) to make this happen, with the [grunt-autoprefixer](https://github.com/nDmitry/grunt-autoprefixer) plugin.)

#### @extend placeholders

All mixins that require no arguments &mdash; either because they have no arguments or because all their arguments have default values &mdash; are paired with [placeholder selectors](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#placeholders), which are good things to use, when you can.

#### `scut-` prefix

To avoid naming collisions &mdash; since this collection may be used alongside other libraries and your own rulesets &mdash; all mixins and placeholders are prefixed with `scut-`.

## Installation

1. Get the files. You have the following options:
  - `bower install scut` (recommended)
  - Download [the repository from Github](https://github.com/davidtheclark/scut).  
  - Download [the latest release from Github](https://github.com/davidtheclark/scut/releases).
2. Then, from your own Sass/SCSS files, import `src/_scut.scss`. Like this: `@import "path/to/src/scut`".

Make sure you import Scut above any imported stylesheets that will rely on Scut.

Also, *make sure that you install and use [Autoprefixer](https://github.com/ai/autoprefixer)*. As mentioned above, Scut does not bother with vendor prefixes &mdash; assuming, instead, that you will use Autoprefixer to handle that messy business.

## Usage

Use the mixins and placeholders described below in the manner described below.

If you have any questions about how to use Sass/SCSS, please refer to [the thorough Sass documentation](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html).

If the Scut documentation below is inadequate and/or upsetting, please [file an issue](https://github.com/davidtheclark/scut/issues) or [drop me a line](https://github.com/davidtheclark).

Again, *make sure that you install and use [Autoprefixer](https://github.com/ai/autoprefixer)* if you want vendor prefixes (which you do). Otherwise you compiled CSS will have none.

## Contributing

Please do. [Visit the repository on Github](https://github.com/davidtheclark/scut) and contribute according to the usual Github methods.

If you have any questions, please [file an issue](https://github.com/davidtheclark/scut/issues) or [drop me a line](https://github.com/davidtheclark).