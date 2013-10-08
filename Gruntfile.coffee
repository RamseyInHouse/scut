module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON "package.json"

    concat:
      options:
        separator: grunt.util.linefeed + grunt.util.linefeed

# This one builds Scut!

      scut:
        src: [
          # Utilities that are dependencies for others
          "src/layout/_list-unstyled.scss"
          "src/layout/_list-floated.scss"
          "src/layout/_positioning-coordinates.scss"
          "src/functions/_strip-unit.scss"

          # The rest of them
          "src/**/*.scss"
        ]
        dest: "_scut.scss"


# Everything else below (except watch:scut) is for testing.

      test:
        options:
          banner: "/*==========================#{grunt.util.linefeed}DO NOT ALTER THIS DOCUMENT!#{grunt.util.linefeed}#{grunt.util.linefeed}It is a concatenation of the SCSS files inside `tests/style/scss/tests`. CREATE TEST STYLESHEETS IN `TESTS/STYLE/SCSS/TESTS`, NOT HERE. If you put them here, they will be overwritten when somebody does things the right way and grunt concatenates once again. (See the `concat` task in the Gruntfile to fully understand.)#{grunt.util.linefeed}==========================*/#{grunt.util.linefeed}#{grunt.util.linefeed}"
        src: ["test/style/scss/tests/*.scss"]
        dest: "test/style/scss/_tests.scss"

    sass:
      test:
        options:
          loadPath: ["test/style/scss/test/*.scss"]
        files:
          "test/style/css/main.css": "test/style/scss/main.scss"

    autoprefixer:
      test:
        files:
          "test/style/css/main.css": "test/style/css/main.css"

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

    watch:
      livereload:
        options:
          livereload: true
        files: [
          "test/style/css/*.css"
          "test/*.html"
        ]
      scut:
        files: [
          "src/**/*.scss"
          "_scut-reset.scss"
        ]
        tasks: [
          "build"
          "test"
        ]
      testStyle:
        files: [
          "test/style/scss/*.scss"
          "test/style/scss/**/*.scss"
        ]
        tasks: ["style"]
      testMarkup:
        files: [
          "test/templates/**/*.hbs"
        ]
        tasks: ["newer:assemble:test"]

    connect:
      server:
        options:
          port: 9000
          base: "test/"

    clean:
      html:
        src: ["test/*.html"]

  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-newer"
  grunt.loadNpmTasks "assemble"

  grunt.registerTask "dev", [
    "connect"
    "watch"
  ]
  grunt.registerTask "style", [
    "concat:test"
    "sass:test"
    "autoprefixer:test"
  ]
  grunt.registerTask "test", [
    "newer:assemble:test"
    "style"
  ]
  grunt.registerTask "build", [
    "clean:html"
    "concat:scut"
    "test"
  ]
  grunt.registerTask "default", ["build"]
