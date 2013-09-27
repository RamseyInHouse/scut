var grunt = require('grunt');

module.exports.register = function(Handlebars, options) {

  Handlebars.registerHelper('slugToWords', function(str) {
    var noHyphens = str.replace(/_/g, ' '),
        words = noHyphens.split(' '),
        specialWords = [
          'list',
          'positioning',
          'v-center',
          'link'
        ];

    if (grunt.util._.contains(specialWords, words[0])) {
      var start = words.shift() + ':';
      words.unshift(start);
      return words.join(' ');
    } else {
      return noHyphens;
    }

  });

  Handlebars.registerHelper('getExampleScss', function(name) {
    var file = grunt.file.read('dev/scss/examples/_' + name + '.scss');
    return file;
  });

};