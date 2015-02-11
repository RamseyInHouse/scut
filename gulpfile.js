var currentVersion = '1.1.2';

var moment = require('moment');
var runSequence = require('run-sequence');
var gulp = require('gulp');
var sass = require('gulp-ruby-sass');
var replace = require('gulp-replace');
var concat = require('gulp-concat');
var autoprefixer = require('gulp-autoprefixer');
var sourcemaps = require('gulp-sourcemaps');
var minifyCSS = require('gulp-minify-css');
var connect = require('gulp-connect');
var newer = require('gulp-newer');
var htmlmin = require('gulp-htmlmin');
var header = require('gulp-header');

require('gulp-grunt')(gulp);

// build Scut
var distBanner = (
  '/*\n* Scut, a collection of Sass utilities\n* to ease and ' +
  'improve our implementations of common style-code patterns.\n* v' +
  currentVersion + '\n* Docs at http://davidtheclark.github.io/scut\n*/\n\n'
);

gulp.task('build', function() {
  gulp.src([

      // when order matters
      'src/layout/_clearfix.scss',
      'src/layout/_list-unstyled.scss',
      'src/layout/_list-floated.scss',
      'src/layout/_positioning-coords.scss',
      'src/functions/_strip-unit.scss',

      // the rest of them
      'src/**/*.scss'
    ])
    .pipe(concat('_scut.scss'))
    .pipe(header(distBanner))
    .pipe(gulp.dest('./dist/'));
});

// process example SCSS to output
// 1. SCSS ready for the markup
// 2. CSS ready for the markup
// 3. a concatenated file for @import into main stylesheet
var examplesScssSrc = './docs/content/example-styles/*.scss';

gulp.task('processExamples', function() {
  var imports = /\/\* import start \*\/\n[\s\S]*?\/\* import end \*\/\n/g;
  var exampleOnly = /(?:[\s\S]*\/\* example start \*\/\n)([\s\S]*)(?:[.$]*\n\/\* example end \*\/[\s\S]*)/g;
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

// compile the main docs stylesheet
var exec = require('child_process').exec;
gulp.task('docStyle', ['processExamples'], function(cb) {
  // using sass CLI to avoid the current messes of the gulp sass plugins
  exec('sass --sourcemap=inline ./docs/dev/scss/main.scss ./docs/dist/main.css', function(err) {
    if (err !== null) { console.log(err); }

    gulp.src('./docs/dist/main.css')
      .pipe(sourcemaps.init({ loadMaps: true }))
      .pipe(autoprefixer('last 3 version', '> 1%', 'ie 8'))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest('./docs/dist'))
      .pipe(connect.reload());

    cb();
  });
});

// copy over JS files for docs
gulp.task('copyJs', function() {
  gulp.src([
      './docs/dev/js/prism.js',
      './docs/dev/js/main.js'
    ])
    .pipe(gulp.dest('./docs/dist/'))
    .pipe(connect.reload());
});

// compile markdown to HTML with Assemble
// (unfortunately only stable as a Grunt task)
gulp.task('assemble', ['grunt-assemble'], function() {
  gulp.src('./docs/dist/*.html')
    .pipe(htmlmin({
      collapseWhitespace: true,
      removeComments: true
    }))
    .pipe(gulp.dest('./docs/dist/'));
});

// copy docs dist folder to parallel gh-pages directory
gulp.task('copyDocs', function() {
  gulp.src('./docs/dist/*')
    .pipe(gulp.dest('../gh-pages/'));
});


// docs tasks
gulp.task('docs', function(callback) {
  runSequence(
    'docStyle',
    'assemble',
    'copyDocs',
    callback
  );
});


// watch for changes and run relevant tasks
gulp.task('watch', function() {
  gulp.watch(examplesScssSrc, ['docs']);
  gulp.watch('./docs/dev/scss/*.scss', ['docStyle']);
  gulp.watch([
    './docs/content/**/*.md',
    './docs/content/*.yml',
    './docs/dev/**/*.hbs'
  ], ['assemble']);
  gulp.watch('./docs/dev/js/*.js', ['copyJs']);
});

// local dev server
gulp.task('connect', function() {
  connect.server({
    root: ['docs/dist'],
    port: 9000,
    livereload: true
  });
});

// develop: watch for changes and make things happen
gulp.task('default', ['connect', 'watch']);

// update version numbers etc. in all the right places
gulp.task('versionNumber', function() {
  gulp.src([
      './bower.json',
      './package.json',
      './docs/content/data.yml'
    ], { base: "./" })
    .pipe(replace(/\"version\": \"(.*)\"/, "\"version\": \"" + currentVersion + "\""))
    .pipe(gulp.dest("./"));
  gulp.src('./lib/scut.rb')
    .pipe(replace(/VERSION = \"(.*)\"/, "VERSION = \"" + currentVersion + "\""))
    .pipe(replace(/DATE = \"(.*)\"/, "DATE = \"" + moment().format('YYYY-MM-DD') + "\""))
    .pipe(gulp.dest('./lib/'));
});

// do all the things necessary to build a new version
gulp.task('version', function(callback) {
  runSequence(
    'build',
    'versionNumber',
    'docs',
    callback
  );
});
