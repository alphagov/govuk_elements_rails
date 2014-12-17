# GOV.UK Elements Rails gem

A gem wrapper around [govuk_elements](http://github.com/alphagov/govuk_elements)
that pulls stylesheet and javascript files into a Rails app.

## Installing

Just include `govuk_elements_rails` in your `Gemfile`. It
automatically attaches itself to your asset path so the static/SCSS
files will be available to the asset pipeline.

### Development

If you are installing from git, ensure you enable submodules like so:

    gem 'govuk_elements_rails', :git => "https://github.com/ministryofjustice/govuk_elements_rails.git", :submodules => true

## Usage

At the top of a Sass file in your Rails project you should use an `@import` rule
to include the file for the mixins you require. For example here are all the
imports possible:

    @import 'elements/helpers';
    @import 'elements/reset';
    @import 'elements/elements-typography';
    @import 'elements/layout';

    @import 'elements/forms';
    @import 'elements/tables';
    @import 'elements/buttons';
    @import 'elements/details';
    @import 'elements/lists';
    @import 'elements/panels';
    @import "elements/icons";

In the `app/assets/javascripts/application.js` file in your Rails project use
`require` rule to include the files for the javascript enhancements you require.
For example here are all the requires possible at present:

    // from govuk_elements gem
    //= require details.polyfill
    //= require bind
    //= require selection-buttons

## Usage of GovukElementsFormBuilder

To replace the default form builder with a version that generates GOV.UK Elements classed markup, set the following in
config/application.rb:

    config.use_govuk_elements_form_builder = true

## Alternate ways to reuse GOV.UK Elements

There are other alternate ways to include GOV.UK Elements files in a Rails
project, for example via `Bower`. Feel free to use an alternate approach if it
is more appropriate for your team.

## Feedback

Please provide feedback via [GitHub issues](https://github.com/ministryofjustice/govuk_elements_rails/issues).
