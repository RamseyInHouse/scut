var gulp = require('gulp');
var sass = require('gulp-ruby-sass');
var replace = require('gulp-replace');
var concat = require('gulp-concat');
var autoprefixer = require('gulp-autoprefixer');
var minifyCSS = require('gulp-minify-css');

// process example SCSS to output
// 1. SCSS ready for the markup
// 2. CSS ready for the markup
// 3. a concatenated file for @import into main stylesheet
gulp.task('processExamples', function() {
  var examplesScssSrc = './docs/content/example-styles/*.scss';
  var imports = /\/\* import start \*\/\n[\s\S]*?\/\* import end \*\/\n/g;
  var exampleOnly = /(?:[\s\S]*\/\* example start \*\/\n)([\s\S]*)(?:[.$]*\/\* example end \*\/)/g;
  var twoLines = /\n\n\n/g;

  // copy example SCSS,
  // removing imports and hidden styles,
  // for SCSS in the markup
  gulp.src([examplesScssSrc])
    .pipe(replace(exampleOnly, '$1'))
    .pipe(gulp.dest('./docs/content/example-styles/display/'));

  // compile example SCSS into CSS,
  // removing imports and hidden styles,
  // for CSS in the markup

  gulp.src([examplesScssSrc])
    .pipe(sass({
      'style': 'expanded'
    }))
    .pipe(replace(exampleOnly, '$1'))
    .pipe(replace(twoLines, ''))
    .pipe(gulp.dest('./docs/content/example-styles/compiled/'));

  // concatenate example SCSS,
  // removing imports,
  // for the main stylesheet
  gulp.src([examplesScssSrc])
    .pipe(concat('_examples.scss'))
    .pipe(replace(imports, ''))
    .pipe(gulp.dest('./docs/dev/scss/'));

});

// compile the main stylesheet
gulp.task('docStyle', function() {
  gulp.src(['./docs/dev/scss/main.scss'])
    .pipe(sass({
      'style': 'expanded'
    }))
    .pipe(autoprefixer("last 3 versions", "> 1%", "ie 8"))
    .pipe(gulp.dest('./docs/dist/'));
});
