# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "govuk_elements_rails"
  s.version = "2.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rob McKinnon", "Government Digital Service"]
  s.date = "2016-11-17"
  s.description = "A gem wrapper around govuk_elements v2.1.2\n that pulls stylesheet and javascript files into a Rails app. Changelog: https://github.com/alphagov/govuk_elements/blob/5bbf3e201f7d72633680d0fbb641bcf6be239089\n/CHANGELOG.md"
  s.email = "robin.whittleton@digital.cabinet-office.gov.uk"
  s.extra_rdoc_files = ["README.md"]
  s.files = ["LICENSE", "README.md", "vendor/assets/javascripts/details.polyfill.js", "vendor/assets/stylesheets/_govuk-elements.scss", "vendor/assets/stylesheets/elements/_breadcrumbs.scss", "vendor/assets/stylesheets/elements/_buttons.scss", "vendor/assets/stylesheets/elements/_components.scss", "vendor/assets/stylesheets/elements/_details.scss", "vendor/assets/stylesheets/elements/_elements-typography.scss", "vendor/assets/stylesheets/elements/_forms.scss", "vendor/assets/stylesheets/elements/_govuk-template-base.scss", "vendor/assets/stylesheets/elements/_helpers.scss", "vendor/assets/stylesheets/elements/_icons.scss", "vendor/assets/stylesheets/elements/_layout.scss", "vendor/assets/stylesheets/elements/_lists.scss", "vendor/assets/stylesheets/elements/_panels.scss", "vendor/assets/stylesheets/elements/_phase-banner.scss", "vendor/assets/stylesheets/elements/_reset.scss", "vendor/assets/stylesheets/elements/_shame.scss", "vendor/assets/stylesheets/elements/_tables.scss", "vendor/assets/stylesheets/elements/forms/_form-block-labels.scss", "vendor/assets/stylesheets/elements/forms/_form-date.scss", "vendor/assets/stylesheets/elements/forms/_form-validation.scss", "lib/govuk_elements_rails/engine.rb", "lib/govuk_elements_rails.rb"]
  s.homepage = "https://github.com/alphagov/govuk_elements_rails"
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib", "vendor"]
  s.rubygems_version = "2.0.14.1"
  s.summary = "A gem wrapper around http://github.com/alphagov/govuk_elements that pulls stylesheet and javascript files into a Rails app."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 4.1.0"])
      s.add_runtime_dependency(%q<sass>, [">= 3.2.0"])
      s.add_runtime_dependency(%q<govuk_frontend_toolkit>, [">= 5.0.0"])
    else
      s.add_dependency(%q<rails>, [">= 4.1.0"])
      s.add_dependency(%q<sass>, [">= 3.2.0"])
      s.add_dependency(%q<govuk_frontend_toolkit>, [">= 5.0.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 4.1.0"])
    s.add_dependency(%q<sass>, [">= 3.2.0"])
    s.add_dependency(%q<govuk_frontend_toolkit>, [">= 5.0.0"])
  end
end
