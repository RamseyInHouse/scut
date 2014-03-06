var gulp = require('gulp');
var sass = require('gulp-ruby-sass');
var replace = require('gulp-replace');
var concat = require('gulp-concat');
var autoprefixer = require('gulp-autoprefixer');
var minifyCSS = require('gulp-minify-css');
var connect = require('gulp-connect');
var newer = require('gulp-newer');
var htmlmin = require('gulp-htmlmin');
require('gulp-grunt')(gulp);

// process example SCSS to output
// 1. SCSS ready for the markup
// 2. CSS ready for the markup
// 3. a concatenated file for @import into main stylesheet
var examplesScssSrc = './docs/content/example-styles/*.scss';

gulp.task('processExamples', function() {
  var imports = /\/\* import start \*\/\n[\s\S]*?\/\* import end \*\/\n/g;
  var exampleOnly = /(?:[\s\S]*\/\* example start \*\/\n)([\s\S]*)(?:[.$]*\/\* example end \*\/)/g;
  var twoLines = /\n\n\n/g;

  // copy example SCSS,
  // removing imports and hidden styles,
  // for SCSS in the markup
  var processedScssDir = './docs/content/example-styles/processed/';
  gulp.src([examplesScssSrc])
    .pipe(newer(processedScssDir))
    .pipe(replace(exampleOnly, '$1'))
    .pipe(gulp.dest(processedScssDir));

  // compile example SCSS into CSS,
  // removing imports and hidden styles,
  // for CSS in the markup
  var processedCssDir = './docs/content/example-styles/processed/';
  gulp.src([examplesScssSrc])
    .pipe(newer(processedCssDir))
    .pipe(sass({
      'style': 'expanded'
    }))
    .pipe(replace(exampleOnly, '$1'))
    .pipe(replace(twoLines, ''))
    .pipe(gulp.dest(processedCssDir));

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
    .pipe(gulp.dest('./docs/dist/'))
    .pipe(connect.reload());
});

// copy over files
gulp.task('copy', function() {
  gulp.src('./docs/dev/js/prism.js')
    .pipe(gulp.dest('./docs/dist/'));
});

// compile via Assemble
gulp.task('assemble', function() {
  gulp.run('grunt-assemble');
  gulp.src('./docs/dist/*.html')
    .pipe(htmlmin({
      collapseWhitespace: true,
      removeComments: true
    }))
    .pipe(gulp.dest('./docs/dist/'));
});

// local dev server
gulp.task('connect', connect.server({
  root: ['docs/dist'],
  port: 9000,
  livereload: true
}));

// watch for changes and run relevant tasks
gulp.task('watch', function() {
  gulp.watch(examplesScssSrc, [
    'processExamples',
    'assemble',
    'docStyle'
  ]);
  gulp.watch('./docs/dev/scss/*.scss', ['docStyle']);
  gulp.watch([
    './docs/content/**/*.md',
    './docs/content/*.yml',
    './docs/dev/**/*.hbs'
  ], ['assemble']);
});

// develop: watch for changes and make things happen
gulp.task('default', ['connect', 'watch']);