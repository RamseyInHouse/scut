module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON "package.json"

    sass:
      test:
        files:
          "test/test-style.css": "test/scss/all.scss"

    autoprefixer:
      test:
        files:
          "test/test-style.css": "test/test-style.css"

    jade:
      test:
        options:
          pretty: true
        files: [
          expand: true
          cwd: "test/jade"
          src: ["*.jade"]
          dest: "test"
          ext: ".html"
        ]

    connect:
      server:
        options:
          port: 9000
          base: "./"

    watch:
      livereload:
        options:
          livereload: true
        files: [
          "test/*.css"
          "test/*.html"
        ]
      style:
        files: [
          "test/scss/*.scss"
          "src/*.scss"
          "src/**/*.scss"
        ]
        tasks: [
          "sass:test"
          "autoprefixer:test"
        ]
      markup:
        files: [
          "test/jade/*.jade"
          "test/jade/includes/*.jade"
        ]
        tasks: ["jade:test"]

  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-autoprefixer"

  grunt.registerTask "dev", ["connect", "watch"]
