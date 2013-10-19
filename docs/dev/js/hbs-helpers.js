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

    if (words.length > 1 && grunt.util._.contains(specialWords, words[0])) {
      var start = words.shift() + ':';
      words.unshift(start);
      return words.join(' ');
    } else {
      return noHyphens;
    }

  });

  Handlebars.registerHelper('underscoresToHyphens', function(str) {
    return str.replace(/_/g, '-');
  });

  Handlebars.registerHelper('getExampleScss', function(name) {
    var file = grunt.file.read('docs/dev/scss/examples/_' + name + '.scss');
    return file;
  });

};