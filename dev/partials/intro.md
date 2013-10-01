# Scut

**&mdash; a collection of Sass (SCSS) mixins and placeholders for common styling patterns.**

You can think of the word Scut as an acronym for ***SC***SS ***Ut***itilies.

(Or you can think of the word in other ways: Scut will do your *scut work*; let Scut be your *scut monkey*. (Be careful how you use this word in polite company. To learn its many and colorful connotations, [have a look at Wiktionary](http://en.wiktionary.org/wiki/scut).))

**BE AWARE:** *Scut is in early stages, under active development, **unstable** &mdash; still in SemVer v0. **Scut is wide, wide open to contributions**, and I will be building on it myself. New features will be added and old features might change. So if a part of Scut that you had been using suddenly doesn't work, please check this documentation to see what changed.*

<a href="https://github.com/davidtheclark/scut/" class="intro-btn">Visit the Github repository</a>

<a href="http://codepen.io/davidtheclark/pen/yCadJ" target="_blank" class="intro-btn">Try out Scut at the Scut Playground on Codepen</a>

### What makes Scut unique?

#### Flexible abstractions of common patterns &mdash; nothing more

Scut doesn't require additional setup and processessing, doesn't apply any default sizes, spacing, colors, etc. It strives to be as simple and un-opinionated as possible, offering abstract patterns that you can work into your own design without having to worry about overriding anything or setting-up any site-wide parameters.

Scut's primary goal is to save you from typing the same few lines of styling code over and over again to achieve the same effect in different places.

#### No vendor prefixes

Some other pre-precessor libraries do little more than vendor prefixing. Scut simply relies on [Autoprefixer](https://github.com/ai/autoprefixer), then looks for other things to do.

Because of this, **if you are using Scut, *do not forget to install and run Autoprefixer as part of your compilation process.***

(I rely on [Grunt](http://gruntjs.com/) to make this happen, with the [grunt-autoprefixer plugin](https://github.com/nDmitry/grunt-autoprefixer). Easy as can be.)

#### @extend placeholders

All mixins that require no arguments &mdash; either because they *have* no arguments or because all their arguments have default values &mdash; are paired with [placeholder selectors](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#placeholders), which are good things to use, when you can.

#### `scut-` prefix

To avoid naming collisions &mdash; since this collection may be used alongside other libraries, certianly alongside your own rulesets &mdash; all mixins and placeholders are prefixed with `scut-`.

## <a href="#installation" id="installation" class="inner-anchor">Installation</a>

1. Get the files. You have the following options:<div class="install-list">
  - **Use [Bower](http://bower.io/) (*recommended*): <pre class="language-bash"><code>bower install scut --save-dev</code></pre>** This will get you the latest release without superfluous files.
   - Download [the latest release from Github](https://github.com/davidtheclark/scut/releases).
   - Download [the repository from Github](https://github.com/davidtheclark/scut).</div>
2. Then, from your own Sass/SCSS files, import `_scut.scss`. Like this: <pre class="language-scss"><code>@import "path/to/scut";</code></pre>

Make sure you import Scut *above* any other imports that will rely on Scut.

Also, *make sure that you install and use [Autoprefixer](https://github.com/ai/autoprefixer)*. As mentioned above, Scut does not bother with vendor prefixes &mdash; assuming, instead, that you will use Autoprefixer to handle that messy business.

## <a href="#usage" id="usage" class="inner-anchor">Usage</a>

Having imported `_scut.scss`, use the mixins and placeholders described below in the manner described below.

If you have any questions about how to use Sass/SCSS, refer to [the thorough Sass documentation](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html).

If the Scut documentation below is inadequate and/or upsetting, please [file an issue](https://github.com/davidtheclark/scut/issues) or [contact me](https://github.com/davidtheclark).

If you have been using Scut, you get a new version and something breaks, please check the documentation again to see if you utility has changed slightly. **Scut is still in the unstable stages of v0**, so things might change.

And again, *make sure that you install and use [Autoprefixer](https://github.com/ai/autoprefixer)* if you want vendor prefixes (which you do). Otherwise your compiled CSS will have none.

## <a href="#contributing" id="contributing" class="inner-anchor">Contributing</a>

Please do!

Just [visit the repository on Github](https://github.com/davidtheclark/scut) and contribute according to the usual Github methods.

If you have any questions, please [file an issue](https://github.com/davidtheclark/scut/issues) or [contact me](https://github.com/davidtheclark).