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

    svgmin:
      images:
        files: [
          expand: true
          cwd: "dev/images/svg-assets/raw"
          src: ["*.svg"]
          dest: "dev/images/svg-assets/opt"
        ]

    imagemin:
      images:
        files: [
          expand: true
          cwd: "dev/images/raw"
          src: ["*.{jpg,png}"]
          dest: "dist/images"
        ]

    grunticon:
      images:
        options:
          cssprefix: "",
          datasvgcss: "_svg-data.scss"
          src: "dev/images/svg-assets/opt"
          dest: "dev/scss/grunticon"

    watch:
      livereload:
        options:
          livereload: true
        files: [
          "dist/*"
          "index.html"
          "dev/js/*.js"
        ]
      style:
        files: ["dev/scss/*.scss"]
        tasks: ["style"]
      assemble:
        files: [
          "dev/partials/*"
          "dev/data.yml"
          "dev/index.hbs"
        ]
        tasks: ["assemble:dev"]
      exampleSCSS:
        files: ["dev/scss/examples/*.scss"]
        tasks: [
          "assemble:dev"
          "style"
        ]
      svg:
        files: ["dev/images/svg-assets/raw/*"]
        tasks: ["svg"]
      images:
        files: ["dev/images/raw/*"]
        tasks: ["imagemin:images"]

    cssmin:
      dist:
        files:
          "dist/main.css": "dist/main.css"

    clean:
      clearSrc:
        src: ["src", "_scut.scss", "_scut-reset.scss"]
      images:
        src: ["dev/images/opt"]

    shell:
      updateSrc:
        command: "git checkout remotes/origin/master -- src _scut.scss _scut-reset.scss"

    uglify:
      all:
        files:
          "dist/js-built.min.js": [
            "dev/js/lib/prism.js"
          ]


  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-imagemin"
  grunt.loadNpmTasks "grunt-svgmin"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-shell"
  grunt.loadNpmTasks "grunt-grunticon"
  grunt.loadNpmTasks "assemble"

  grunt.registerTask "src", ["clean:clearSrc", "shell:updateSrc"]
  grunt.registerTask "style", ["sass:style", "autoprefixer:style"]
  grunt.registerTask "dev", ["connect", "watch"]
  grunt.registerTask "svg", ["svgmin:images", "grunticon:images"]
  grunt.registerTask "reImage", ["clean:images", "svg"]
  grunt.registerTask "build", [
    "style"
    "cssmin:dist"
    "assemble:dist"
    "uglify:all"
  ]
