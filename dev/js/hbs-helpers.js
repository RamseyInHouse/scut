var grunt = require('grunt');

module.exports.register = function(Handlebars, options) {

  Handlebars.registerHelper('slugToWords', function(str) {
    var noDash = str.replace('-', ' ');
    return noDash;
  });

  Handlebars.registerHelper('getExampleScss', function(name) {
    var file = grunt.file.read('dev/scss/examples/_' + name + '.scss');
    return file;
  });

  Handlebars.registerHelper('addEmptyFrontMatter', function() {
    return '---\n---\n';
  });

};