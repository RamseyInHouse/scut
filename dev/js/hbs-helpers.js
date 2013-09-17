var grunt = require('grunt');

module.exports.register = function(Handlebars, options) {

  Handlebars.registerHelper('slugToWords', function(str) {
    var noDash = str.replace(/-/g, ' ');
    return noDash;
  });

  Handlebars.registerHelper('getExampleScss', function(name) {
    var file = grunt.file.read('dev/scss/examples/_' + name + '.scss');
    return file;
  });

};