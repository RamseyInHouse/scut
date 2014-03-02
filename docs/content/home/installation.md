Scut is a single file that can be copied and pasted, downloaded, or installed via Bower or RubyGems (for Compass). No trouble at all. Here are the details.

### Method 1: Get the File and Use It

1. Get the file. You have the following options:
  - Download or copy/paste <a href="{{github-url}}{{version}}/dist/_scut.scss">the latest release from Github</a>.
  - Use [Bower](http://bower.io/): `bower install scut --save-dev` This will get you the latest release and save it as a `devDependency` for your project.
2. Then, from your own Sass/SCSS files, import `_scut.scss`. Like so: `@import "path/to/scut";`

### Method 2: Compass Extension

1. Install the RubyGem: `gem install scut`
2. Include Scut in your project by using `require` and `@import` according to the usual Compass-extension methods. You know: `require 'scut'`. And `@import 'scut'`. That kind of thing.