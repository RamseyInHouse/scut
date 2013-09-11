module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON "package.json"

    sass:
      test:
        files:
          "test-style.css": "scss/main.scss"

    autoprefixer:
      test:
        files:
          "test-style.css": "test-style.css"

    jade:
      test:
        options:
          pretty: true
        files: [
          expand: true
          cwd: "jade"
          src: ["*.jade"]
          dest: "./"
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
          "*.css"
          "*.html"
        ]
      style:
        files: [
          "scss/*.scss"
          "../src/*.scss"
          "../src/**/*.scss"
        ]
        tasks: [
          "sass:test"
          "autoprefixer:test"
        ]
      markup:
        files: [
          "jade/*.jade"
          "jade/includes/*.jade"
        ]
        tasks: ["jade:test"]

  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-autoprefixer"

  grunt.registerTask "dev", ["connect", "watch"]
