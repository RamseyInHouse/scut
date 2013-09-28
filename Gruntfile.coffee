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
          "test/main.css": "test/test-style.css"

    jade:
      test:
        options:
          pretty: true
        files: [
          expand: true
          cwd: "test/jade"
          src: ["*.jade"]
          dest: "test/"
          ext: ".html"
        ]

    connect:
      server:
        options:
          port: 9000
          base: "test/"

    concat:
      all:
        options:
          separator: grunt.util.linefeed + grunt.util.linefeed
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
          "test/../src/*.scss"
          "test/../src/**/*.scss"
        ]
        tasks: ["style"]
      testMarkup:
        files: [
          "test/jade/*.jade"
          "test/jade/includes/*.jade"
        ]
        tasks: ["jade:test"]

  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-autoprefixer"

  grunt.registerTask "dev", ["connect", "watch"]
  grunt.registerTask "style", ["sass:test", "autoprefixer:test"]
  grunt.registerTask "test", [
    "jade:test"
    "style"
  ]
