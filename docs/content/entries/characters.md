---
name: characters
slug: characters
summary: A set of variables providing CSS-friendly Unicode character-codes for the kinds of typographic glyphs you may find yourself adding to your stylesheets as `content` values.
type: variables
categories:
  - typography
---

Instead of looking them up every time, use a variable.

The names of these variables often correspond with HTML character entity references that you can use in your markup. For example, `$scut-nbsp` is the same character as `&nbsp;` in HTML.

<h4>Spaces</h4>
<dl class="characters-list">
  <dt><code>$scut-space</code></dt>
  <dd></dd>
  <dd>space ("\0020")</dd>
  <dt><code>$scut-nbsp</code></dt>
  <dd></dd>
  <dd>non-breaking space ("\00a0")</dd>
</dl>
<h4>Quotation Marks</h4>
<dl class="characters-list">
  <dt><code>$scut-quot</code></dt>
  <dd>"</dd>
  <dd>quotation mark ("\0022")</dd>
  <dt><code>$scut-lsquo</code></dt>
  <dd>‘</dd>
  <dd>left single curly quote ("\2018")</dd>
  <dt><code>$scut-rsquo</code></dt>
  <dd>’</dd>
  <dd>right single curly quote ("\2019")</dd>
  <dt><code>$scut-ldquo</code></dt>
  <dd>“</dd>
  <dd>left double curly quote ("\201C")</dd>
  <dt><code>$scut-rdquo</code></dt>
  <dd>”</dd>
  <dd>right double curly quote ("\201D")</dd>
  <dt><code>$scut-lsaquo</code></dt>
  <dd>‹</dd>
  <dd>left single angle quote (guillemet) ("\2039")</dd>
  <dt><code>$scut-rsaquo</code></dt>
  <dd>›</dd>
  <dd>right single angle quote (guillemet) ("\203A")</dd>
  <dt><code>$scut-laquo</code></dt>
  <dd>«</dd>
  <dd>left double angle quote (guillemet) ("\00ab")</dd>
  <dt><code>$scut-raquo</code></dt>
  <dd>»</dd>
  <dd>right double angle quote (guillemet) ("\00bb")</dd>
</dl>
<h4>Other Punctuation</h4>
<dl class="characters-list">
  <dt><code>$scut-mdash</code></dt>
  <dd>—</dd>
  <dd>em dash (mutton) ("\2014")</dd>
  <dt><code>$scut-ndash</code></dt>
  <dd>–</dd>
  <dd>en dash (nut) ("\2013")</dd>
  <dt><code>$scut-hyphen</code></dt>
  <dd>-</dd>
  <dd>hyphen ("\2010")</dd>
  <dt><code>$scut-amp</code></dt>
  <dd>&</dd>
  <dd>ampersand ("\0026")</dd>
  <dt><code>$scut-para</code></dt>
  <dd>¶</dd>
  <dd>paragraph symbol (pilcrow) ("\00b6")</dd>
  <dt><code>$scut-middot</code></dt>
  <dd>·</dd>
  <dd>middot (interpunct, interpoint) ("\00b7")</dd>
  <dt><code>$scut-bull</code></dt>
  <dd>•</dd>
  <dd>bullet ("\2022")</dd>
  <dt><code>$scut-whibull</code></dt>
  <dd>◦</dd>
  <dd>white bullet ("\25E6")</dd>
  <dt><code>$scut-hellip</code></dt>
  <dd>…</dd>
  <dd>horizontal ellipsis ("\2026")</dd>
  <dt><code>$scut-vellip</code></dt>
  <dd>⋮</dd>
  <dd>vertical ellipsis ("\22EE")</dd>
  <dt><code>$scut-midhellip</code></dt>
  <dd>⋯</dd>
  <dd>midline horizontal ellipsis ("\22EF")</dd>
</dl>
<h4>Various Symbols</h4>
<dl class="characters-list">
  <dt><code>$scut-gt</code></dt>
  <dd>&gt;</dd>
  <dd>greater than ("\003e")</dd>
  <dt><code>$scut-lt</code></dt>
  <dd>&lt;</dd>
  <dd>less than ("\003c")</dd>
  <dt><code>$scut-times</code></dt>
  <dd>×</dd>
  <dd>times ("\00D7")</dd>
  <dt><code>$scut-bigtimes</code></dt>
  <dd>✕</dd>
  <dd>big times ("\2715")</dd>
  <dt><code>$scut-checkmark</code></dt>
  <dd>✓</dd>
  <dd>checkmark ("\2713")</dd>
  <dt><code>$scut-sect</code></dt>
  <dd>§</dd>
  <dd>section sign (double S, hurricane, sectional symbol, the legal doughnut, signum
    sectiōnis) ("\00a7")</dd>
  <dt><code>$scut-oslash</code></dt>
  <dd>Ø</dd>
  <dd>o-slash (slashed o) ("\00f8")</dd>
</dl>
<h4>Shapes</h4>
<dl class="characters-list">
  <dt><code>$scut-utri</code></dt>
  <dd>▲</dd>
  <dd>up-pointing triangle ("\25b2")</dd>
  <dt><code>$scut-dtri</code></dt>
  <dd>▼</dd>
  <dd>down-pointing triangle ("\25bc")</dd>
  <dt><code>$scut-ltri</code></dt>
  <dd>◀</dd>
  <dd>left-pointing triangle ("\25c0")</dd>
  <dt><code>$scut-rtri</code></dt>
  <dd>▶</dd>
  <dd>right-pointing triangle ("\25b6")</dd>
  <dt><code>$scut-ustri</code></dt>
  <dd>▴</dd>
  <dd>up-pointing small triangle ("\25b4")</dd>
  <dt><code>$scut-dstri</code></dt>
  <dd>▾</dd>
  <dd>down-pointing small triangle ("\25be")</dd>
  <dt><code>$scut-lstri</code></dt>
  <dd>◂</dd>
  <dd>left-pointing small triangle ("\25c2")</dd>
  <dt><code>$scut-rstri</code></dt>
  <dd>▸</dd>
  <dd>right-pointing small triangle ("\25b8")</dd>
  <dt><code>$scut-diamond</code></dt>
  <dd>◆</dd>
  <dd>diamond ("\25c6")</dd>
  <dt><code>$scut-fisheye</code></dt>
  <dd>◉</dd>
  <dd>fisheye ("\25c9")</dd>
  <dt><code>$scut-bullseye</code></dt>
  <dd>◎</dd>
  <dd>bullseye ("\25ce")</dd>
  <dt><code>$scut-circle</code></dt>
  <dd>●</dd>
  <dd>circle ("\25cf")</dd>
  <dt><code>$scut-whitecircle</code></dt>
  <dd>○</dd>
  <dd>white circle ("\25cb")</dd>
  <dt><code>$scut-square</code></dt>
  <dd>■</dd>
  <dd>square ("\25a0")</dd>
  <dt><code>$scut-whitesquare</code></dt>
  <dd>□</dd>
  <dd>white square ("\25a1")</dd>
  <dt><code>$scut-ssquare</code></dt>
  <dd>▪</dd>
  <dd>small square ("\25aa")</dd>
  <dt><code>$scut-swhitesquare</code></dt>
  <dd>▫</dd>
  <dd>small white square ("\25ab")</dd>
</dl>