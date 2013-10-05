module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON "package.json"

    sass:
      test:
        files:
          "test/main.css": "test/scss/main.scss"

    autoprefixer:
      test:
        files:
          "test/main.css": "test/main.css"

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

    connect:
      server:
        options:
          port: 9000
          base: "test/"

    concat:
      all:
        options:
          stripBanners: true
        src: [
          "src/layout/_list-unstyled.scss"
          "src/layout/_list-floated.scss"
          "src/layout/_positioning-coordinates.scss"
          "src/**/*.scss"
        ]
        dest: "_scut-all.scss"

    watch:
      livereload:
        options:
          livereload: true
        files: [
          "test/*.css"
          "test/*.html"
        ]
      testStyle:
        files: [
          "test/scss/*.scss"
          "test/scss/**/*.scss"
          "src/**/*.scss"
        ]
        tasks: ["style"]
      testMarkup:
        files: [
          "test/templates/**/*.hbs"
        ]
        tasks: ["assemble:test"]


  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "assemble"

  grunt.registerTask "dev", ["connect", "watch"]
  grunt.registerTask "style", ["sass:test", "autoprefixer:test"]
  grunt.registerTask "test", [
    "assemble:test"
    "style"
  ]
  grunt.registerTask "build", ["concat:all"]
