---
name: indented paragraphs
slug: indented-ps
summary: Indent paragraphs instead of spacing them, as tends to happen in those "books" and "magazines" that old people read.
type: mixin, with default-values placeholder
categories:
  - typography
args:
  - variable: $indent
    default: 1.5em
  - variable: $no-first-indent
    default: "true"
    comment: It is a not uncommon printing practice to leave the first paragraph un-indented.
example:
  html: |
    <div class="eg-indented-ps m-1">
      <div><strong>Default</strong></div>
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.</p>
      <p>Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
      <p>Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
      <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>
    </div>
    <div class="eg-indented-ps m-2">
      <div><strong>Variant</strong></div>
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.</p>
      <p>Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
      <p>Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
      <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>
    </div>
---