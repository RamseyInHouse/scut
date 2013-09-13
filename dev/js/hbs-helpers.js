var grunt = require('grunt');

module.exports.register = function(Handlebars, options) {

  Handlebars.registerHelper('slugToWords', function(str) {
    var noDash = str.replace('-', ' ');
    //var newStr = noDash.replace(/\w\S*/g, function (txt) {
    //  return txt.charAt(0).toUpperCase() + txt.substr(1);
    //});
    //return newStr;
    return noDash;
  });

  Handlebars.registerHelper('getContent', function(path) {
    var file = grunt.file.read('content/' + path + '.md');
    return file;
  });

};