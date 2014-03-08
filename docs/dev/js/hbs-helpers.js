var grunt = require('grunt');

var processedStylesDir = './docs/content/example-styles/processed/';

module.exports.register = function(Handlebars, options) {

  Handlebars.registerHelper('removeTicks', function(str) {
    return str.replace(/\`/g, '');
  });

  Handlebars.registerHelper('getExampleScss', function(name) {
    var file = grunt.file.read(processedStylesDir + name + '.scss');
    return file;
  });

  Handlebars.registerHelper('getExampleCss', function(name) {
    var file = grunt.file.read(processedStylesDir + name + '.css');
    return file;
  });

  Handlebars.registerHelper('removeFirstBlank', function(str) {
    var result = str.replace('\n', '');
    return result;
  });

};