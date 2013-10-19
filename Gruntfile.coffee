module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON "package.json"

    concat:
      options:
        separator: grunt.util.linefeed + grunt.util.linefeed

      # Build Scut
      scut:
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
        dest: "_scut.scss"

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
          "docs/dev/scss/_concatenated-examples.scss": ["docs/dev/scss/examples/*.scss"]

    sass:
      test:
        options:
          loadPath: ["test/style/scss/test/*.scss"]
        files:
          "test/style/css/main.css": "test/style/scss/main.scss"
      docs:
        files:
          "docs/dist/main.css": "docs/dev/scss/main.scss"

    autoprefixer:
      test:
        files:
          "test/style/css/main.css": "test/style/css/main.css"
      docs:
        files:
          "docs/dist/main.css": "docs/dist/main.css"

    cssmin:
      docs:
        files:
          "docs/dist/main.css": "docs/dist/main.css"

    uglify:
      docs:
        files:
          "docs/dist/js-built.min.js": [
            "docs/dev/js/lib/prism.js"
            "bower_components/overthrow/dist/overthrow.js"
            "docs/dev/js/modals.js"
          ]

    assemble:
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
      docsDev:
        options:
          data: ["docs/dev/data.yml"]
          partials: ["docs/dev/partials/*.hbs"]
          helpers: ["docs/dev/js/hbs-helpers.js"]
          dist: false
        files:
          "docs/index.html": ["docs/dev/index.hbs"]
      docsDist:
        options:
          data: ["docs/dev/data.yml"]
          partials: ["docs/dev/partials/*.hbs"]
          helpers: ["docs/dev/js/hbs-helpers.js"]
          dist: true
        files:
          "docs/index.html": ["docs/dev/index.hbs"]

    svgmin:
      docs:
        files: [
          expand: true
          cwd: "docs/dev/images/svg-assets/raw"
          src: ["*.svg"]
          dest: "docs/dev/images/svg-assets/opt"
        ]

    imagemin:
      docs:
        files: [
          expand: true
          cwd: "docs/dev/images/raw"
          src: ["*.{jpg,png}"]
          dest: "docs/dist/images"
        ]

    grunticon:
      docs:
        options:
          cssprefix: "",
          datasvgcss: "_svg-data.scss"
          src: "docs/dev/images/svg-assets/opt"
          dest: "docs/dev/scss/grunticon"

    htmlmin:
      docs:
        options:
          removeComments: true
          collapseWhitespace: true
        files:
          "docs/index.html": "docs/index.html"

    watch:

      livereload:
        options:
          livereload: true
        files: [
          "test/style/css/*.css"
          "test/*.html"
          "docs/dist/*"
          "docs/index.html"
          "docs/dev/js/*.js"
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
        files: ["docs/dev/scss/*.scss"]
        tasks: ["docsStyle"]

      docsMarkup:
        files: [
          "docs/dev/partials/*"
          "docs/dev/data.yml"
          "docs/dev/index.hbs"
        ]
        tasks: ["assemble:docsDev"]

      docsExamples:
        files: ["docs/dev/scss/examples/*.scss"]
        tasks: [
          "assemble:docsDev"
          "docsStyle"
        ]

      docsSvg:
        files: ["docs/dev/images/svg-assets/raw/*"]
        tasks: ["svg"]

      docsImages:
        files: ["docs/dev/images/raw/*"]
        tasks: ["imagemin:docs"]

    connect:
      server:
        options:
          port: 9000
          base: "./"

    clean:
      html:
        src: ["test/*.html"]
      images:
        src: [
          "docs/dev/images/opt"
          "docs/dev/images/svg-assets/opt"
        ]

  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-imagemin"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-htmlmin"
  grunt.loadNpmTasks "grunt-svgmin"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-newer"
  grunt.loadNpmTasks "grunt-grunticon"
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
  grunt.registerTask "docs", [
    "docsStyle"
    "cssmin:docs"
    "assemble:docsDist"
    "uglify:docs"
    "htmlmin:docs"
  ]
  grunt.registerTask "build", [
    "concat:scut"
    "test"
    "docs"
  ]
  grunt.registerTask "default", ["build"]
