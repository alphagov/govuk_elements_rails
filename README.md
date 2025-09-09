> [!WARNING]
> GOV.UK Elements is deprecated. To design your service using actively maintained and accessible styles, components and patterns, [migrate to the GOV.UK Design System](https://frontend.design-system.service.gov.uk/v4/migrating-from-legacy-products/).

# GOV.UK Elements Rails gem

A gem wrapper around [govuk_elements](http://github.com/alphagov/govuk_elements)
that pulls stylesheet and javascript files into a Rails app.

## Installing for use in a Rails app

Just include `govuk_elements_rails` in your Rails application `Gemfile`:

```ruby
gem 'govuk_elements_rails'
```

It automatically attaches itself to your asset path so the static/SCSS
files will be available to the asset pipeline.

### Dependency on govuk_frontend_toolkit

The gem has a dependency on the
[govuk_frontend_toolkit gem](https://rubygems.org/gems/govuk_frontend_toolkit).
So `govuk_frontend_toolkit` will be installed on `bundle install` if it is not
installed already.

### Dependency on govuk_template base HTML styles

The gem assumes you have `govuk_template` base HTML styles in your SASS.
But the [govuk_template gem](https://rubygems.org/gems/govuk_template) is not a
dependency. Either require `govuk_template` in your `Gemfile`:

```ruby
gem 'govuk_template'
```

or include the following in a Sass file, see Usage section for details:

```sass
// Base (unclassed HTML elements)
// These are predefined by govuk_template
// If you're not using govuk_template, uncomment the line below.
// HTML elements, set by the GOV.UK template
@import 'elements/base'
```

## Usage

For detailed information on usage see the
[govuk_elements README](https://github.com/alphagov/govuk_elements#govuk-elements).

### Stylesheets usage

At the top of your projects main stylesheet you should use `@import` rules to
include the files that you require.

If you are using the `scss` format instead of `sass` you will need to add
semicolons and reformat the comments.

```sass
// GOV.UK Frontend Toolkit (alphagov/govuk_frontend_toolkit)
@import 'colours'
@import 'font_stack'
@import 'measurements'
@import 'conditionals'
@import 'device-pixels'
@import 'grid_layout'
@import 'typography'
@import 'shims'

@import 'design-patterns/alpha-beta'
@import 'design-patterns/buttons'
@import 'design-patterns/breadcrumbs'

// GOV.UK elements (alphagov/govuk_elements)

// Helper functions and classes
@import "elements/helpers"

// Generic (normalize/reset.css)
@import "elements/reset"

// Base (unclassed HTML elements)
// These are predefined by govuk_template
// If you're not using govuk_template, uncomment the line below.
// @import "elements/govuk-template-base"

// Main content container. Grid layout - rows and column widths
@import "elements/layout"

// Components (chunks of UI)
@import "elements/elements-typography"
@import "elements/buttons"
@import "elements/icons"
@import "elements/lists"
@import "elements/tables"
@import "elements/details"
@import "elements/panels"
@import "elements/forms"
@import "elements/forms/form-multiple-choice"
@import "elements/forms/form-date"
@import "elements/forms/form-validation"
@import "elements/breadcrumbs"
@import "elements/phase-banner"
@import "elements/components"
@import "elements/shame"
```

For further detailed information on usage see the
[govuk_elements README](https://github.com/alphagov/govuk_elements#govuk-elements).

### Javascript usage

In the `app/assets/javascripts/application.js` file in your Rails project use
`require` rule to include the files for the javascript enhancements you require.
For example here are all the requires possible at present:

```javascript
// from govuk_elements gem
//= require details.polyfill
```

### Javascript from govuk_frontend_toolkit

In the `app/assets/javascripts/application.js` file in your Rails project use
`require` rule to include javascript from the `govuk_frontend_toolkit` gem. For
example:

```javascript
// from govuk_frontend_toolkit gem
//= require vendor/polyfills/bind
//= require govuk/selection-buttons
```

To include all of the govuk javascript, require `govuk_toolkit`, i.e.

```javascript
// from govuk_frontend_toolkit gem
//= require vendor/polyfills/bind
//= require govuk_toolkit
```

See the
[govuk_frontend_toolkit documentation](https://github.com/alphagov/govuk_frontend_toolkit#documentation)
for details of what javascript is available.

## Alternate ways to reuse GOV.UK Elements

There are other alternate ways to include GOV.UK Elements implementations in a Rails
project, for example via [NPM](https://www.npmjs.com/package/govuk-elements-sass).

Feel free to use an alternate approach when it's more appropriate for your team.

## Making updates to the gem itself

You only need to look at this section if you want to update the gem with changes
from the `govuk-elements` repo.

If you just want to use the gem in your Rails application, don't follow these steps.

If you are working on the gem itself, clone and download submodules like this:

```sh
git clone git@github.com:alphagov/govuk_elements_rails.git
cd govuk_elements_rails
git submodule init
git submodule update
```

To update govuk_elements to a specific tag:

```sh
cd govuk_elements
git fetch origin
git describe --tags # shows current tag
git tag -l  # lists available tags
git checkout master
latest_tag=`git describe --abbrev=0 --tags`
echo $latest_tag
git checkout $latest_tag # change to most recent tag
cd ..
```

Check that the symlinks under `vendor/assets` still point to the `govuk_elements` files.

```sh
ls -lat vendor/assets/javascripts/
ls -lat vendor/assets/stylesheets/
```

To add a javascript file to gem, create new symlink to `govuk_elements` file, like in this example:

```sh
cd vendor/assets/javascripts/
ls -l
ln -s ../../../govuk_elements/assets/javascripts/govuk/details.polyfill.js .
ls -l
cd ../../..
git add vendor/javascripts/details.polyfill.js
```

To create the gem for local testing:

```sh
rake clean
rake gemspec
rake gem
```

If you're happy all's ok, you can create a branch and commit:

```sh
branch_name="update-$latest_tag"
echo $branch_name
git branch $branch_name
git checkout $branch_name
git push -u origin $branch_name

git add govuk_elements_rails.gemspec
git add govuk_elements

commit_msg="Upgrade to govuk_elements $latest_tag"
commit_msg2="See govuk_elements $latest_tag changelog for details:"
commit_msg3="https://github.com/alphagov/govuk_elements/blob/$latest_tag/packages/govuk-elements-sass/CHANGELOG.md"

echo $commit_msg
echo $commit_msg2
echo $commit_msg3

git commit -m "$commit_msg" -m "$commit_msg2" -m "$commit_msg3"
git push
```

Create a new pull request for the release:

```sh
open "https://github.com/alphagov/govuk_elements_rails/compare/master...$branch_name"
```

To tag and publish the gem to rubygems.org:

```sh
rake publish
```

If you are installing from git for testing, ensure you enable submodules in your Gemfile
require like so:

```ruby
gem 'govuk_elements_rails', git: "https://github.com/alphagov/govuk_elements_rails.git", submodules: true
```

## Feedback

Please provide feedback via [GitHub issues](https://github.com/alphagov/govuk_elements_rails/issues).
