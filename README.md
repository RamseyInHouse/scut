# Scut

**&mdash; a collection of Sass (SCSS) mixins and placeholders for common styling patterns.**

> [Please visit the complete documentation here:<br>http://davidtheclark.github.io/scut/](http://davidtheclark.github.io/scut/)

Installation and usage should be explained there, as well as some of the general principles of the project.

## Contributing

Please do! Scut is simple; contributing should be easy. So give it a go.

If you have any questions, if anything about this document is unclear or inaccurate, if you can't figure out what to do, please file an issue or contact me.

### Writing Scut Utilities

**The code is in `src/`, organized by category.** The SCSS stylesheets in `src/` ultimately concatenate into `dist/_scut.scss`, which is what users `@import` into their own Sass.

#### Scut's SCSS Styleguide

**Please have a look at existing SCSS files within `src/` and try to match their style.**

(Or, if you think there's a better way to do things, please file an issue.)

Here are some guidelines to explain how I've been doing things:

- **Head the file with a block comment naming the utility and listing any dependencies.** In the end, that block comment should also contain the URL of the utility's documentation. For example:

```scss
/*==========================
SCUT PIXELS TO EMS
http://davidtheclark.github.io/scut/#pixels-to-ems

Depends on `scut-strip-unit`.
==========================*/
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

**Test pages are for experimentation and testing. They do not have to be pretty, authoritative, complete, or anything else. They exist only to aid development.**

Test pages are compiled from Handlebars templates using [Assemble](http://assemble.io). You should do the following:

- `npm install` to ensure you have all the node modules you need. The command will also run `grunt init`, which will build existing pages so that you can view them locally.
- As you work, run `grunt dev` (which in turn runs both `grunt watch` and `grunt connect`). This will make an index of test pages available at `localhost:9000/test` and your test page available at `localhost:9000/test/your-file-name.html`. While running `grunt dev`, the page will LiveReload when you save changes *if you have [the LiveReload Chrome extension](https://chrome.google.
- Edit or create a Handlebars template named after the utility in `test/templates/pages/`. Add a `title` to the YAML front matter (for the sake of the index).
- Edit or create an SCSS stylesheet named after the utility in `test/style/scss/tests/`.

Look at the existing tests for examples.

*Do not edit the HTML files `test/*.html`: they are compiled by Assemble from Handlebars templates, so any changes you make in the HTML files will be overwritten when somebody else makes changes and runs Assemble.*

A few Grunt tasks will create the test page if you're running `grunt watch`. (If you weren't running `grunt watch` when you saved your changes, you can manually run `grunt test` for the same result.) Look at `Gruntfile.coffee` for details.

### Documenting

Documentation is compiled using [Assemble](http://assemble.io). The files are located in `docs/dev`, with all Assemble-related files (content, helpers, Handlebars templates) in `docs/dev/assemble` &mdash; compiling to `docs/dev/index.html` &mdash; and all other site assets (style, js, images, etc.) in `docs/dev/assets`. Here's how you can do it:

- `npm install` to ensure you have all the node modules you need. The command will also run `bower install`, to install the bower components you need; and `grunt init`, to build the existing site so you can view it locally.
- Run `grunt dev` (which in turn runs both `grunt watch` and `grunt connect`) will make the documentation page available at `localhost:9000/docs/dev`. While running `grunt dev`, the page will LiveReload when you save changes *if you have [the LiveReload Chrome extension](https://chrome.google.
- The bulk of the writing is done in `docs/dev/assemble/data.yml`. And the example styling is done in the SCSS stylesheets in `docs/dev/assets/scss/examples/`.

At the top of `docs/dev/assemble/data.yml` is a short guide to writing the YAML that translates into a utility's entry in the documentation.

For the SCSS of your example, please follow the conventions established in the other examples. Please stick with the color variables `$eg-muted`, `$eg-light`, and `$eg-dark`. If there are rules that you would like to add in order to make the example look nice but you don't need to display them (because they have nothing to do with usage of the utility), wrap them in the comments `/* hidden rules */` and `/* end hidden rules */`, followed by a blank line. Look at the existing example stylesheets and you'll get it.

A few Grunt tasks will create the test page if you're running `grunt watch`. (If you weren't running `grunt watch` when you saved your changes, you can manually run `grunt docsDev` for the same result.) Look at `Gruntfile.coffee` for details.

