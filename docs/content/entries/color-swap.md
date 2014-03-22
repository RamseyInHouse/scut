---
name: color swap
slug: color-swap
summary: A shorthand for setting two color-states, &mdash; active (hover/focus) and inactive &mdash; involving text `color` and `background-color`, with the option of adding a transition.
type: mixin-only
categories:
  - general
args:
  - variable: $off
    comment: Color(s) for the "off" state. A list of two values will designate `color` and `background-color` (in order). *One* value will be interpreted as `color` &mdash; unless the `$bg` argument, below, is set to `true`, in which case it will be `background-color`.
  - variable: $on
    comment: Color(s) for the "on" state (`:hover` and `:focus`). One or two values, interpreted the same way as `$off`, above.
  - variable: $duration
    default: "0"
    comment: The `transition-duration` between `$off` and `$on` states.
  - variable: $bg
    default: "false"
    comment: Set to `true` if you want to pass a single color value for the `$off` and `$on` arguments and you want that value interpreted as `background-color`. (By default, a single value will be intepreted as `color`.)
example:
  html: |
    <div class="eg-color-swap eg-color-swap-1">Variation 1</div>
    <div class="eg-color-swap eg-color-swap-2">Variation 2</div>
    <div class="eg-color-swap eg-color-swap-3">Variation 3</div>
---

The examples should clarify the somewhat tricky arguments ...