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

  function underscoresToHyphens (str) {
    return str.replace(/_/g, '-');
  }

  Handlebars.registerHelper('underscoresToHyphens', function(str) {
    return underscoresToHyphens(str);
  });

  function removeHiddenRules(str) {
    return str.replace(/(^\/\* hidden rules \*\/$[\s\S]*?)^\/\* end hidden rules \*\/$\n\n/gm, '');
  }

  Handlebars.registerHelper('getExampleScss', function(name) {
    var file = grunt.file.read('docs/dev/assets/scss/examples/_' + name + '.scss');
    // Remove rules that don't need to be displayed.
    var withoutHiddenRules = removeHiddenRules(file);
    return withoutHiddenRules;
  });

  var mainCSS = grunt.file.read('docs/dev/assets/main.css');
  Handlebars.registerHelper('getExampleCss', function(name) {
    // Remove rules that don't need to be displayed.
    var withoutHiddenRules = removeHiddenRules(mainCSS);
    // Find rules that start with // Example: name
    var relevantRegex = new RegExp('\\/\\* Example: ' + name + ' \\*\\/\\n\\n([\\S\\s]*?)\\n\\/\\* Example', 'gm');
    var match = (relevantRegex).exec(withoutHiddenRules);
    if (match) {
      return match[1];
    }
  });

};