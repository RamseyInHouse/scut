# Scut

**&mdash; a collection of Sass utilities to ease and improve our implementations of common style-code patterns.**

For a prolonged introduction to Scut, [read "Introducing Scut" on CSS-Tricks](http://css-tricks.com/introducing-scut-new-sass-utility-library).

If you have any questions about Sass, they are answered [in Sass's fine documentation](http://sass-lang.com/documentation/file.SASS_REFERENCE.html).

## Installing and Using

> [Please visit the complete documentation here:<br>http://davidtheclark.github.io/scut/](http://davidtheclark.github.io/scut/)

Usage should be explained there, as is installation. But I'll explain installation here, too, for your convenience. You can install Scut by:

- Using Bower: `bower install scut --save-dev`.
- Downloading the file from [the latest release](https://github.com/davidtheclark/scut/releases).
- Using Scut as a Compass extension by installing the RubyGem (`gem install scut`) and then performing the usual Compass `require` and `@import` business.

## Contributing

Please do! Scut is simple; contributing should be easy. So give it a go.

If you have any questions, if anything about this document is unclear or inaccurate, if you can't figure out what to do, please file an issue or contact me.

### Development Requirements

- [Node and npm](http://nodejs.org/)
- [Grunt-cli](https://github.com/gruntjs/grunt-cli)
- [Bower](http://bower.io/)
- [Sass-cli](http://sass-lang.com/install)

### Writing Scut Utilities

**The utilities are in `src/`, organized by category.** The SCSS stylesheets in `src/` ultimately concatenate into `dist/_scut.scss`, which is what users `@import` into their own Sass.

#### Scut's SCSS Styleguide

**Please have a look at existing SCSS files within `src/` and try to match their style.**

(Or, if you think there's a better way to do things, please file an issue.)

Here are some guidelines to explain how I've been writing:

- **Head the file with a multi-line comment (each line an inline `//` comment, not a block comment) naming the utility and listing any dependencies.** Limit dependencies please. In the end, that top comment should also contain the URL of the utility's documentation. For example:

```scss
// SCUT PIXELS TO EMS
// http://davidtheclark.github.io/scut/#pixels-to-ems

// Depends on `scut-strip-unit`.
```

- **Indent with two spaces.**
- **List arguments on separate lines**, so they are easy to scan. For example:

```scss
@mixin scut-color-swap (
  $inactive,
  $active,
  $duration: 0,
  $bg: false
) {
  // mixin content
}
```

- **Space liberally.** A space at the beginning and end of mixins and functions helps distinguish the arguments from the inner workings. Spacing can also help delineate different "sections" of the code by grouping rules that work together and separating those with different roles.

### Experimenting and Testing

Feel free to experiment with or create test pages for utilities new and old. Use test pages to make sure that the utility you created works just as you dreamed it would.

**Test pages are for experimentation and testing. They do not have to be pretty, authoritative, complete, or anything else. They exist only to aid development.** Test pages are ephemeral: any developer should feel free to modify existing tests.

Test pages are compiled from [Handlebars](http://handlebarsjs.com/) templates using [Assemble](http://assemble.io). You should do the following:

- `npm install` to ensure you have all the node modules you need. The command will also run `grunt init`, which will build existing pages so that you can view them locally.
- As you work, run `grunt dev` (which in turn runs both `grunt watch` and `grunt connect`). This will make an index of test pages available at `localhost:9000/test` and your test page available at `localhost:9000/test/your-file-name.html`. While running `grunt dev`, the page will LiveReload when you save changes *if you have [the LiveReload Chrome extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en).*
- Edit or create a Handlebars template named after the utility in `test/templates/pages/`. Add a `title` to the YAML front matter (for the sake of the index).
- Edit or create an SCSS stylesheet named after the utility in `test/style/scss/tests/`.

Look at the existing tests for examples.

*Do not edit the HTML files `test/*.html`: they are compiled by Assemble from Handlebars templates, so any changes you make in the HTML files will be overwritten when somebody else makes changes and runs Assemble.* In fact, the HTML files shouldn't even be included in the repo.

A few Grunt tasks will create the test page if you're running `grunt watch`. (If you weren't running `grunt watch` when you saved your changes, you can manually run `grunt test` for the same result.) Look at `Gruntfile.coffee` for details.

**Another good way to experiment and test is to use [Codepen](http://codepen.io/), either starting your own pen from scratch or forking [the Scut Playground](http://codepen.io/davidtheclark/pen/yCadJ) (which imports the latest version of Scut)**

### Documenting

Documentation is compiled using [Assemble](http://assemble.io). The files are located in `docs/dev`, with all Assemble-related files (content, helpers, Handlebars templates) in `docs/dev/assemble` &mdash; compiling to `docs/dev/index.html` &mdash; and all other site assets (style, js, images, etc.) in `docs/dev/assets`. Here's how you can do it:

- `npm install` to ensure you have all the node modules you need. The command will also run `bower install`, to install the bower components you need; and `grunt init`, to build the existing site so you can view it locally.
- Running `grunt dev` (which in turn runs both `grunt watch` and `grunt connect`) will make the documentation page available at `localhost:9000/docs/dev`. While running `grunt dev`, the page will LiveReload when you save changes *if you have [the LiveReload Chrome extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en).*
- The bulk of the writing is done in `docs/dev/assemble/data.yml`. And the example styling is done in the SCSS stylesheets in `docs/dev/assets/scss/examples/`.

At the top of `docs/dev/assemble/data.yml` is a short guide to writing the YAML that translates into a utility's entry in the documentation.  (What's YAML? [If you skim this you'll understand.](http://www.yaml.org/spec/1.2/spec.html))

For the SCSS of your example, please follow the conventions established in the other examples (found in `docs/dev/assets/scss/examples/`). A couple of points:

- Please stick with the color variables `$eg-muted`, `$eg-light`, and `$eg-dark`, so everything matches.
- If there are rules that you would like to add (in order to make the example look nice) but you don't need to display them (because they have nothing to do with usage of the utility), wrap them in the comments `/* hidden rules */` and `/* end hidden rules */`, followed by a blank line. Look at the existing example stylesheets and you'll get it.

A few Grunt tasks will create the test page if you're running `grunt watch`. (If you weren't running `grunt watch` when you saved your changes, you can manually run `grunt docsDev` for the same result.) Look at `Gruntfile.coffee` for details.

