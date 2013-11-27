currentVersion = "0.6.0"
path = require "path"

module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON "package.json"

    concat:
      options:
        separator: grunt.util.linefeed + grunt.util.linefeed

      # Build Scut
      scut:
        options:
          banner: "/*#{grunt.util.linefeed}* Scut, a collection of Sass utilities to ease and improve our implementations of common style-code patterns.#{grunt.util.linefeed}* v#{currentVersion}#{grunt.util.linefeed}* Docs at http://davidtheclark.github.io/scut#{grunt.util.linefeed}*/#{grunt.util.linefeed}#{grunt.util.linefeed}"
        src: [
          # Utilities that are dependencies for others
          "src/layout/_clearfix.scss"
          "src/layout/_list-unstyled.scss"
          "src/layout/_list-floated.scss"
          "src/layout/_positioning-coordinates.scss"
          "src/functions/_strip-unit.scss"

          # The rest of them
          "src/**/*.scss"
        ]
        dest: "dist/_scut.scss"

      # Build test styles
      test:
        options:
          banner: "/*DO NOT ALTER THIS DOCUMENT! It is a concatenation of the SCSS files inside `tests/style/scss/tests`. CREATE TEST STYLESHEETS IN `TESTS/STYLE/SCSS/TESTS`, NOT HERE.*/#{grunt.util.linefeed}"
        src: ["test/style/scss/tests/*.scss"]
        dest: "test/style/scss/_tests.scss"

      # Build docs example styles
      docsExamples:
        options:
          banner: "/*DO NOT ALTER THIS DOCUMENT! It is a concatenation of the SCSS files inside `dev/scss/examples`. CREATE EXAMPLE STYLESHEETS IN `DEV/SCSS/EXAMPLES`, NOT HERE.*/#{grunt.util.linefeed}#{grunt.util.linefeed}"
        files:
          "docs/dev/assets/scss/_concatenated-examples.scss": ["docs/dev/assets/scss/examples/*.scss"]

    sass:
      options:
        style: "expanded"
      # Process test styles
      test:
        options:
          loadPath: ["test/style/scss/test/*.scss"]
        files:
          "test/style/css/main.css": "test/style/scss/main.scss"
      # Process docs styles
      docs:
        files:
          "docs/dev/assets/main.css": "docs/dev/assets/scss/main.scss"

    autoprefixer:
      # Prefix test styles
      test:
        files:
          "test/style/css/main.css": "test/style/css/main.css"
      # Prefix docs styles
      docs:
        files:
          "docs/dev/assets/main.css": "docs/dev/assets/main.css"

    cssmin:
      # Minify docs styles into dist
      docs:
        files:
          "docs/dist/assets/css-built.min.css": "docs/dev/assets/main.css"

    uglify:
      # Minify docs JS into dist
      docs:
        files:
          "docs/dist/assets/js-built.min.js": [
            "docs/dev/assets/js/lib/prism.js"
            "bower_components/overthrow/dist/overthrow.js"
            "docs/dev/assets/js/modals.js"
          ]

    assemble:
      # Assemble test markup
      test:
        options:
          partials: ["test/templates/partials/*.hbs"]
          layout: "test/templates/layouts/base.hbs"
        files: [
          expand: true
          cwd: "test/templates/pages/"
          src: ["*.hbs"]
          dest: "test/"
        ]
      # Assemble docs dev markup
      docsDev:
        options:
          data: ["docs/dev/assemble/data.yml"]
          partials: ["docs/dev/assemble/partials/*.hbs"]
          helpers: ["docs/dev/assemble/hbs-helpers.js"]
          dist: false
        files:
          "docs/dev/index.html": ["docs/dev/assemble/index.hbs"]
      # Assemble docs dist markup
      docsDist:
        options:
          data: ["docs/dev/assemble/data.yml"]
          partials: ["docs/dev/assemble/partials/*.hbs"]
          helpers: ["docs/dev/assemble/hbs-helpers.js"]
          dist: true
        files:
          "docs/dist/index.html": ["docs/dev/assemble/index.hbs"]

    svgmin:
      # Minify docs SVG assets in preparation for grunticon
      docs:
        files: [
          expand: true
          cwd: "docs/dev/assemble/images/svg-assets/raw"
          src: ["*.svg"]
          dest: "docs/dev/assemble/images/svg-assets/opt"
        ]

    grunticon:
      # Grunticon docs SVG assets, producing an SCSS file
      # that gets @imported
      docs:
        options:
          cssprefix: "",
          datasvgcss: "_svg-data.scss"
          src: "docs/dev/assets/images/svg-assets/opt"
          dest: "docs/dev/assets/scss/grunticon"

    imagemin:
      # Minify docs images into dist
      docs:
        files: [
          expand: true
          cwd: "docs/dev/assets/images"
          src: ["*.{jpg,png}"]
          dest: "docs/dist/assets/images"
        ]

    htmlmin:
      # Minify docs dist html
      docs:
        options:
          removeComments: true
          collapseWhitespace: true
        files:
          "docs/dist/index.html": "docs/dist/index.html"

    copy:
      # Copy docs fonts from dev to dist
      docsFonts:
        files: [
          expand: true
          cwd: "docs/dev/assets/fonts"
          src: ["*"]
          dest: "docs/dist/assets/fonts"
        ]
      # Copy docs/dist to a parallel gh-pages dir
      # for updating the live site
      docsDist:
        files: [
          expand: true
          cwd: "docs/dist"
          src: ["*", "**/*"]
          dest: "../gh-pages"
        ]
      # Stash current version of docs
      docsVersion:
        files: [
          expand: true
          cwd: "../gh-pages"
          src: [
            "index.html"
            "assets/*"
            "assets/**/*"
          ]
          dest: "../gh-pages/old/v#{currentVersion}/"
        ]

    watch:

      livereload:
        options:
          livereload: true
        files: [
          "test/style/css/*.css"
          "test/*.html"
          "docs/dev/index.html"
          "docs/dev/assets/*.css"
        ]

      scut:
        files: [
          "src/**/*.scss"
          "_scut-reset.scss"
        ]
        tasks: ["concat:scut"]

      testStyle:
        files: [
          "test/style/scss/*.scss"
          "test/style/scss/**/*.scss"
        ]
        tasks: ["testStyle"]

      testMarkup:
        files: ["test/templates/**/*.hbs"]
        tasks: ["newer:assemble:test"]

      docsStyle:
        files: ["docs/dev/assets/scss/*.scss"]
        tasks: ["docsStyle"]

      docsMarkup:
        files: [
          "docs/dev/assemble/partials/*"
          "docs/dev/assemble/data.yml"
          "docs/dev/assemble/index.hbs"
        ]
        tasks: ["assemble:docsDev"]

      docsExamples:
        files: ["docs/dev/assets/scss/examples/*.scss"]
        tasks: [
          "assemble:docsDev"
          "docsStyle"
        ]

      docsSvg:
        files: ["docs/dev/assets/images/svg-assets/raw/*"]
        tasks: ["svg"]

      docsImages:
        files: ["docs/dev/assets/images/*"]
        tasks: ["imagemin:docs"]

    connect:
      server:
        options:
          port: 9000
          base: "./"

    clean:
      # Clean up test HTML
      test:
        src: [
          "test/*.html"
          "test/style/css"
          "test/style/scss/_tests.scss"
        ]
      # Clean up docs optimized images
      images:
        src: [
          "docs/dist/images"
          "docs/dev/images/svg-assets/opt"
        ]
      # Clean up docs dist folder
      docs:
        src: [
          "docs/dev/index.html"
          "docs/dev/assets/main.css"
          "docs/dev/images/svg-assets/opt"
          "docs/dist"
        ]

    replace:
      # Change version number in all relevant places
      version:
        src: [
          "bower.json"
          "package.json"
          "docs/dev/assemble/data.yml"
          "lib/scut.rb"
        ]
        overwrite: true
        replacements: [{
        # For bower.json, package.json, and data.yml
          from: /\"version\": \"(.*)\"/g,
          to: "\"version\": \"#{currentVersion}\""
        }, {
        # For the Ruby business
          from: /VERSION = \"(.*)\"/g,
          to: "VERSION = \"#{currentVersion}\""
        }, {
          from: /DATE = \"(.*)\"/g,
          to: "DATE = \"#{grunt.template.today('yyyy-mm-dd')}\""
        }]

  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-imagemin"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-htmlmin"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-svgmin"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-newer"
  grunt.loadNpmTasks "grunt-grunticon"
  grunt.loadNpmTasks "grunt-text-replace"
  grunt.loadNpmTasks "assemble"

  grunt.registerTask "dev", [
    "connect"
    "watch"
  ]
  grunt.registerTask "testStyle", [
    "concat:test"
    "sass:test"
    "autoprefixer:test"
  ]
  grunt.registerTask "docsStyle", [
    "concat:docsExamples"
    "sass:docs"
    "autoprefixer:docs"
  ]
  grunt.registerTask "svg", [
    "svgmin:docs"
    "grunticon:docs"
  ]
  grunt.registerTask "reImage", [
    "clean:images"
    "imagemin:docs"
    "svg"
  ]
  grunt.registerTask "test", [
    "newer:assemble:test"
    "testStyle"
  ]
  grunt.registerTask "docsDev", [
    "docsStyle"
    "assemble:docsDev"
  ]
  grunt.registerTask "docsDist", [
    "docsDev"
    "cssmin:docs"
    "newer:imagemin:docs"
    "copy:docsFonts"
    "uglify:docs"
    "assemble:docsDist"
    "htmlmin:docs"
  ]
  grunt.registerTask "build", [
    "concat:scut"
  ]
  grunt.registerTask "init", [
    "test"
    "docsDev"
  ]
  grunt.registerTask "gh-pages", [
    "build"
    "docsStyle"
    "docsDist"
    "copy:docsDist"
  ]
  grunt.registerTask "version", [
    "copy:docsVersion"
    "replace:version"
    "assemble"
  ]
  grunt.registerTask "default", ["build"]
