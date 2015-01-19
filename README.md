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

### Approach

Scut utilities should help users **avoid repetition, organize code, and re-use code**.

Scut utilities should tackle patterns that suffer from one or more of the following problems:

1. The pattern is non-intuitive.
2. The pattern deserves a shorthand.
3. The pattern involves some important best practices.
4. The pattern is extremely common and (at least) a little annoying.

The utility's goal is to fix those problems in a way that **maximizies reusability**. Here are some principles to keep in mind to maximize that reusability:

- Include sufficient detail to implement the pattern, but no more.
- Use arguments to allow for typical variations on the theme.
- Arrange those arguments according to the likelihood that users will want to change them.
- Namespace (notice the `scut-` prefix everwhere).
- Document thoroughly.

I go into detail about all these ideas in [that CSS-Tricks article](http://css-tricks.com/introducing-scut-new-sass-utility-library/).

### Development Requirements

- [Node and npm](http://nodejs.org/)
- [Grunt-cli](https://github.com/gruntjs/grunt-cli)
- [Gulp](https://github.com/gulpjs/gulp)
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

The method I recommend for experimentation and testing is to use [Codepen](http://codepen.io/), either starting your own pen from scratch or forking [the Scut Playground](http://codepen.io/davidtheclark/pen/yCadJ) (which imports the latest version of Scut).

(I have deleted the "tests" directory and tasks from the repository in favor of relying on Codepen.)

### Documenting

Documentation is compiled using [Assemble](http://assemble.io). The source files are located in `docs/content` and `docs/dev`. You'll need to `bower install` to get Normalize.
