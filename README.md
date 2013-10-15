# Scut

**&mdash; a collection of Sass (SCSS) mixins and placeholders for common styling patterns.**

> [Please visit the complete documentation here:<br>http://davidtheclark.github.io/scut/](http://davidtheclark.github.io/scut/)

Everything is explained there.

## Contributing

Please do! Scut is simple; contributing should be easy. So give it a go.

If you have any questions or anything is unclear, please file an issue or contact me.

### Experimenting and Testing

> Feel free to experiment with or create test pages for utilities new and old.

**Test pages are for experimentation and testing. They do not have to be pretty, authoritative, complete, or anything else. They exist only to aid development.**

Test pages are created using [Assemble](http://assemble.io). You should do the following:

- Edit or create a Handlebars template named after the utility in `test/templates/pages/`.
- Edit or create an SCSS stylesheet named after the utility in `test/style/scss/tests/`.

Look at the existing tests for examples.

*Do not edit the HTML files in `test/`: these are compiled by Assemble from Handlebars templates, so any changes you make in the HTML will be overwritten when somebody else makes changes and runs Assemble.*

A few Grunt tasks will create the test page if you're running `grunt watch`. (If you weren't running `grunt watch` when you saved your changes, you can manually run `grunt test` for the same result.) Look at `Gruntfile.coffee` for details.

If you run `grunt dev` (which in turn runs both `grunt watch` and `grunt connect`), an index of test pages should be available at `localhost:9000`. Find your page and go there. While running `grunt dev`, the page will LiveReload when you save changes *if you have [the LiveReload Chrome extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en) installed*.

