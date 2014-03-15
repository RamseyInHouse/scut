currentVersion = "0.10.1"

path = require "path"

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

    replace:
      # Change version number in all relevant places
      version:
        src: [
          "bower.json"
          "package.json"
          "docs/content/data.yml"
          "lib/scut.rb"
        ]
        overwrite: true
        replacements: [{
        # For bower.json, package.json, and data.yml
          from: /\"version\": \"(.*)\"/g,
          to: "\"version\": \"#{currentVersion}\""
        }, {
        # For the Ruby business
          from: /VERSION = \"(.*)\"/g,
          to: "VERSION = \"#{currentVersion}\""
        }, {
          from: /DATE = \"(.*)\"/g,
          to: "DATE = \"#{grunt.template.today('yyyy-mm-dd')}\""
        }]

  grunt.loadNpmTasks "assemble"
  grunt.loadNpmTasks "grunt-text-replace"