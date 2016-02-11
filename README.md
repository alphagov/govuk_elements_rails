# GOV.UK Elements Rails gem

A gem wrapper around [govuk_elements](http://github.com/alphagov/govuk_elements)
that pulls stylesheet and javascript files into a Rails app.

## Installing for use in a Rails app

Just include `govuk_elements_rails` in your Rails application `Gemfile`:

    gem 'govuk_elements_rails'

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

    gem 'govuk_template'

or include the following in a Sass file, see Usage section for details:

    // Base (unclassed HTML elements)
    // These are predefined by govuk_template
    // If you're not using govuk_template, uncomment the line below.
    // HTML elements, set by the GOV.UK template
    @import 'elements/base'

## Usage

For detailed information on usage see the
[govuk_elements README](https://github.com/alphagov/govuk_elements#govuk-elements).

At the top of a Sass file in your Rails project you should use an `@import` rule
to include the file for the mixins you require. For example here are possible imports:

    // From GDS's alphagov/govuk_frontend_toolkit
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

    // From GDS's alphagov/govuk_elements
    @import 'elements/helpers'
    @import 'elements/reset'

    // Base (unclassed HTML elements)
    // These are predefined by govuk_template
    // If you're not using govuk_template, uncomment the line below.
    // HTML elements, set by the GOV.UK template
    // @import 'elements/base'

    @import 'elements/layout'
    @import 'elements/elements-typography'
    @import 'elements/buttons'
    // @import 'elements/icons'
    @import 'elements/lists'
    // @import 'elements/tables'
    @import 'elements/details'
    @import 'elements/panels'
    @import 'elements/forms'
    @import 'elements/forms/form-block-labels'
    @import 'elements/forms/form-date'
    @import 'elements/forms/form-validation'
    @import 'elements/breadcrumbs'
    @import 'elements/phase-banner'
    @import 'elements/components'

In the `app/assets/javascripts/application.js` file in your Rails project use
`require` rule to include the files for the javascript enhancements you require.
For example here are all the requires possible at present:

    // from govuk_elements gem
    //= require details.polyfill

For further detailed information on usage see the
[govuk_elements README](https://github.com/alphagov/govuk_elements#govuk-elements).

## Alternate ways to reuse GOV.UK Elements

There are other alternate ways to include GOV.UK Elements implementations in a Rails
project, for example via [NPM](https://www.npmjs.com/package/govuk-elements-sass)
or [Mojular](https://github.com/mojular/govuk-elements).

Feel free to use an alternate approach when it's more appropriate for your team.

## Making updates to the gem itself

You only need to look at this section if you want to update the gem with changes
from the govuk-elements repo.

If you just want to use the gem in your Rails application, don't follow these steps.

If you are working on the gem itself, clone and download submodules like this:

    git clone https://github.com/ministryofjustice/govuk_elements_rails.git
    cd govuk_elements_rails
    git submodule init
    git submodule update

To update govuk_elements to a specific tag:

    cd govuk_elements
    git fetch origin
    git describe --tags # shows current tag
    git tag -l  # lists available tags
    git checkout master
    latest_tag=`git describe --abbrev=0 --tags`
    git checkout $latest_tag # change to most recent tag
    cd ..

Check that the symlinks under `vendor/assets` still point to the govuk_elements files.

To create the gem for local testing:

    rake clean
    rake gem

If you're happy all's ok, you can commit:

    cd govuk_elements
    tag_sha=`git rev-parse HEAD`
    commit_msg="Upgrade to govuk_elements $latest_tag"
    commit_msg2="See govuk_elements $latest_tag changelog for details:"
    commit_msg3="https://github.com/alphagov/govuk_elements/blob/$tag_sha/CHANGELOG.md"

    echo $commit_msg
    echo $commit_msg2
    echo $commit_msg3
    cd ..
    git add govuk_elements
    git commit -m "$commit_msg" -m "$commit_msg2" -m "$commit_msg3"

To add a javascript file to gem, create new symlink to govuk_elements file like in this example:

    cd vendor/assets/javascripts/
    ls -l
    ln -s ../../../govuk_elements/public/javascripts/vendor/details.polyfill.js .
    ls -l
    cd ../../..
    git add vendor/javascripts/details.polyfill.js

To update version number, edit version.rb, and repackage:

    vi lib/govuk_elements_rails/version.rb
    rake clean
    rake package

To tag and publish the gem to rubygems.org:

    rake publish

If you are installing from git for testing, ensure you enable submodules in your Gemfile
require like so:

    gem 'govuk_elements_rails', :git => "https://github.com/ministryofjustice/govuk_elements_rails.git", :submodules => true

## Feedback

Please provide feedback via [GitHub issues](https://github.com/ministryofjustice/govuk_elements_rails/issues).
