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

    connect:
      server:
        options:
          port: 9000
          base: "./"

    assemble:
      options:
        data: ["dev/data.yml"]
        partials: ["dev/partials/*.hbs"]
        helpers: ["dev/js/hbs-helpers.js"]

      dev:
        options:
          dist: false
        files:
          "index.html": ["dev/index.hbs"]
      dist:
        options:
          dist: true
        files:
          "index.html": ["dev/index.hbs"]

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
      assemble:
        files: [
          "dev/partials/*.hbs"
          "dev/data.yml"
          "dev/index.hbs"
        ]
        tasks: ["assemble:dev"]

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
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-shell"
  grunt.loadNpmTasks "assemble"

  grunt.registerTask "src", ["clean:clearSrc", "shell:updateSrc"]
  grunt.registerTask "style", ["sass:style", "autoprefixer:style"]
  grunt.registerTask "dev", ["connect", "watch"]
  grunt.registerTask "build", [
    "style"
    "cssmin:dist"
    "assemble:dist"
  ]
