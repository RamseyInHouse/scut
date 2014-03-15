module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON "package.json"

    assemble:
      # Assemble docs dev markup
      docsDev:
        options:
          layoutdir: "docs/dev/layouts/"
          layout: "entry-base.hbs"
          helpers: ["docs/dev/js/hbs-helpers.js"]
          partials: [
            "docs/dev/partials/*.{md,hbs}"
            "docs/content/home/*.{md,hbs}"
          ]
          data: ["docs/content/*.yml"]
          dist: false
        files: [{
          expand: true
          flatten: true
          cwd: "docs/"
          src: [
            "content/entries/*.{md,hbs}"
            "dev/templates/*.{md,hbs}"
          ]
          dest: "docs/dist/"
        }]

  grunt.loadNpmTasks "assemble"