currentVersion = "0.9.1"

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

      # Build docs example styles
      docsExamples:
        options:
          banner: "/*DO NOT ALTER THIS DOCUMENT! It is a concatenation of the SCSS files inside `dev/scss/examples`. CREATE EXAMPLE STYLESHEETS IN `DEV/SCSS/EXAMPLES`, NOT HERE.*/#{grunt.util.linefeed}#{grunt.util.linefeed}"
          footer: "/* Examples end */"
          process: (src, filepath) ->
            name = (path.basename(filepath, ".scss")).slice(1)
            return "/* Example: #{name} */\n#{src}"
        files:
          "docs/dev/assets/scss/_concatenated-examples.scss": ["docs/dev/assets/scss/examples/*.scss"]

    uglify:
      # Minify docs JS into dist/
      docs:
        files:
          "docs/dist/assets/js-built.min.js": [
            "docs/dev/assets/js/lib/overthrow.js"
            "docs/dev/assets/js/lib/prism.js"
            "docs/dev/assets/js/main.js"
          ]

    assemble:
      # Assemble docs dev markup
      # options:
      #   data: ["docs/dev/assemble/data.yml"]
      #   partials: ["docs/dev/assemble/partials/*.hbs"]
      #   helpers: ["docs/dev/assemble/hbs-helpers.js"]
      # docsDev:
      #   options:
      #     dist: false
      #   files:
      #     "docs/dev/index.html": ["docs/dev/assemble/index.hbs"]
      docsDev:
        options:
          postprocess: require('pretty')
          layout: "docs/dev/layouts/entry-base.hbs"
          helpers: ["docs/dev/hbs-helpers.js"]
          partials: ["docs/dev/partials/*.hbs"]
          dist: false
        files: [{
          expand: true
          cwd: "docs/content/entries"
          src: ["*.md"]
          dest: "docs/dist/"
        }]

      # Assemble docs dist markup
      docsDist:
        options:
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

    htmlmin:
      # Minify docs dist html
      docs:
        options:
          removeComments: true
          collapseWhitespace: true
        files:
          "docs/dist/index.html": "docs/dist/index.html"

    copy:
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
          ]
          dest: "../gh-pages/old/v#{currentVersion}/"
        ]

    watch:

      livereload:
        options:
          livereload: true
        files: [
          "docs/dev/index.html"
          "docs/dev/assets/*.css"
          "docs/dev/assets/*.js"
        ]

      scut:
        files: [
          "src/**/*.scss"
          "_scut-reset.scss"
        ]
        tasks: ["concat:scut"]

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

    connect:
      server:
        options:
          port: 9000
          base: "./"

    clean:
      # Clean up docs optimized images
      images:
        src: [
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

  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-htmlmin"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-svgmin"
  grunt.loadNpmTasks "grunt-newer"
  grunt.loadNpmTasks "grunt-grunticon"
  grunt.loadNpmTasks "grunt-text-replace"
  grunt.loadNpmTasks "assemble"

  grunt.registerTask "dev", [
    "connect"
    "watch"
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
  grunt.registerTask "docsDev", [
    "docsStyle"
    "assemble:docsDev"
  ]
  grunt.registerTask "docsDist", [
    "docsDev"
    "cssUrlEmbed:docs"
    "cssmin:docs"
    "uglify:docs"
    "assemble:docsDist"
    "htmlmin:docs"
  ]
  grunt.registerTask "build", [
    "concat:scut"
  ]
  grunt.registerTask "init", [
    "docsDev"
  ]
  grunt.registerTask "gh-pages", [
    "build"
    "docsDist"
    "copy:docsDist"
  ]
  grunt.registerTask "version", [
    "copy:docsVersion"
    "replace:version"
    "assemble"
    "build"
  ]
  grunt.registerTask "default", ["build"]
