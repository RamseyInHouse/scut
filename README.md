# Scut

**&mdash; a collection of Sass (SCSS) mixins and placeholders for common styling patterns.**

> [Please visit the complete documentation here:<br>http://davidtheclark.github.io/scut/](http://davidtheclark.github.io/scut/)

Everything is explained there.

## Contributing

Please do! Scut is simple; contributing should be easy. So give it a go.

If you have any questions or anything is unclear, please file an issue or contact me.

### SCSS Style Guide

Basically: Have a look at existing SCSS files within `src/` and match their style.

Here are some guidelines, as well:

- **Head the file with a block comment naming the utility and listing any dependencies.** In the end, that block comment should also contain the URL of the utilities' documentation. For example:
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

- `npm install` to ensure you have all the node modules you need.
- As you work, run `grunt dev` (which in turn runs both `grunt watch` and `grunt connect`). This will make an index of test pages available at `localhost:9000` and your test page available at `localhost:9000/your-file-name.html`. While running `grunt dev`, the page will LiveReload when you save changes *if you have [the LiveReload Chrome extension](https://chrome.google.
- Edit or create a Handlebars template named after the utility in `test/templates/pages/`. Add a `title` to the YAML front matter.
- Edit or create an SCSS stylesheet named after the utility in `test/style/scss/tests/`.

Look at the existing tests for examples.

*Do not edit the HTML files `test/*.html`: they are compiled by Assemble from Handlebars templates, so any changes you make in the HTML files will be overwritten when somebody else makes changes and runs Assemble.*

A few Grunt tasks will create the test page if you're running `grunt watch`. (If you weren't running `grunt watch` when you saved your changes, you can manually run `grunt test` for the same result.) Look at `Gruntfile.coffee` for details.

com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en) installed*.

