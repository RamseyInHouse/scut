var grunt = require('grunt');

module.exports.register = function(Handlebars, options) {

  Handlebars.registerHelper('slugToWords', function(str) {
    var noDash = str.replace('-', ' ');
    return noDash;
  });

  Handlebars.registerHelper('getContent', function(name) {
    var file = grunt.file.read('content/' + name + '.md');
    return file;
  });

  Handlebars.registerHelper('getExampleScss', function(name) {
    var file = grunt.file.read('dev/scss/examples/_' + name + '.scss');
    return file;
  });

};