module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON "package.json"

    sass:
      style:
        files:
          "dist/main.css": "dev/scss/main.scss"

    autoprefixer:
      style:
        files:
          "dist/main.css": "dist/main.css"

    jade:
      dev:
        options:
          data:
            dist: false
          pretty: true
        files:
          "index.html": "dev/jade/index.jade"
      dist:
        options:
          dist: true
        files:
          "index.html": "dev/jade/index.jade"

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
          "dist/*"
          "index.html"
        ]
      style:
        files: ["dev/scss/*.scss"]
        tasks: ["style"]
      markup:
        files: [
          "dev/jade/*.jade"
          "dev/jade/includes/*.jade"
        ]
        tasks: ["jade:dev"]

    cssmin:
      dist:
        files:
          "dist/main.css": "dist/main.css"

    clean:
      clearSrc:
        src: ["src"]

    shell:
      updateSrc:
        command: "git checkout remotes/origin/master -- src"

  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-shell"

  grunt.registerTask "src", ["clean:clearSrc", "shell:updateSrc"]
  grunt.registerTask "style", ["sass:style", "autoprefixer:style"]
  grunt.registerTask "dev", ["connect", "watch"]
  grunt.registerTask "dist", [
    "jade:dist"
    "style"
    "cssmin:dist"
  ]
