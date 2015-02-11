### 1.1.2
- Changed `scut-reverse-italics` to avoid Sass deprecation warning.

### 1.1.0
- Added `woff2` format to `scut-font-face`.

### 1.0.2
- Made all elements inherit `-webkit-font-smoothing` in `scut-reset-antialias`, to target elements that need specific targeting.

### 1.0.1
- Adjusted syntax of Sass `@if not` statements so that they will work in Libsass despite the Libsass bug https://github.com/sass/libsass/issues/368

### 1.0.0
- Changed `box-sizing` reset to use inheritance.

### 0.10.4
- No longer remove `outline` from `button` as part of `scut-reset-button`.
- Added use of selector lists for `scut-vcenter-td` and `scut-vcenter-ib`.

### 0.10.3
- Added `scut-reset-figure`.
- Added `input[type="submit"]` and `input[type="reset"]` to `scut-reset-button`.

### 0.10.2
- Added `scut-reset-media`.
- Changed `scut-sticky-footer` to `scut-sticky-footer-fixed` in order to add a new sticky footer mixin, `scut-sticky-footer-fluid`.
- Added `scut-color-swap` back in, because some people liked it.

### 0.10.1
- Fixed bug in build process.

### 0.10.0
- Added some squares to characters: `$scut-square`, `$scut-whitesquare`, `$scut-ssquare`, `$scut-swhitesquare`.
- Removed `scut-color-swap`, `scut-bookends`, and `scut-fonticon-label` because I never ended up using them.

### 0.9.1
- Updated `scut-font-face` so users can enter there own `$formats` list, if they don't want to include all font-file-formats.

### 0.9.0
- Documented `scut-reset` so that others might understand.
- Added `$no-margin` variable to list mixins, with the default value `true`.
- Made `scut-font-face`'s argument `$weight` optional.
- Removed inner element from `scut-ratio-box`, as the user can add it herself if she wants it (and she may not want it).
- Exposed the `$scut-rem-base` default value to users.

### 0.8.0
- Fixed a bug preventing the results of `scut-em` and `scut-rem` from being used in calculations.
- Added `scut-truncate`.
- Deleted "tests" in repository. Devs should use Codepen. It's easy.
- Updated `scut-reset`. Some substance-changes and specific resets are now excludable.

### 0.7.1 and 0.7.2
- Bug fixes.

### 0.7.0
- Updated `scut-list-unstyled` for less aggressive resetting; modified related utilities to fit.
- Updated `scut-fill` for two different filling approaches: all coordinates = 0 or width/height = 100%.
- Updated `scut-em` to accept lists of pixel-values and exposed the `$scut-em-base` default value to users.
- Added `scut-rem` and `scut-rem-fallback`.
- Added `scut-list-custom`.
- Added `scut-center-trasform` and `scut-vcenter-tt`.

### 0.6.0
- Added RubyGem config so Scut can be used as a standard Compass extension.
- Modified `scut-margin` and `scut-padding`.
- Added `scut-center-block`.
- Changed `scut-hide-text` to `scut-image-replace` and added `scut-hide-visually`.
- Moved `scut-triangle` and `scut-circle` to General category; removed `scut-foursquare`; and removed Shapes category.
- Replaced block comments with in-line comments.

### 0.5.0
- Added `scut-border`.

### 0.4.1
- Fixed bug with `scut-foursquare`: it requires `box-sizing: border-box`.

### 0.4.0
- Started changelog!
