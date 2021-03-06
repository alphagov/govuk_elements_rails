# -*- encoding: utf-8 -*-
# stub: govuk_elements_rails 3.1.3 ruby lib vendor

Gem::Specification.new do |s|
  s.name = "govuk_elements_rails"
  s.version = "3.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib", "vendor"]
  s.authors = ["GOV.UK Design System Team (Government Digital Service)"]
  s.date = "2018-07-18"
  s.description = "A gem wrapper around govuk_elements v3.1.3\n that pulls stylesheet and javascript files into a Rails app. Changelog: https://github.com/alphagov/govuk_elements/blob/3a7f21838d7849d90434731488e1a0f0f209250d\n/CHANGELOG.md"
  s.email = "design-system-developers@digital.cabinet-office.gov.uk"
  s.extra_rdoc_files = ["README.md"]
  s.files = ["LICENSE", "README.md", "lib/govuk_elements_rails.rb", "lib/govuk_elements_rails/engine.rb", "vendor/assets/stylesheets/_govuk-elements.scss", "vendor/assets/stylesheets/elements/_breadcrumbs.scss", "vendor/assets/stylesheets/elements/_buttons.scss", "vendor/assets/stylesheets/elements/_components.scss", "vendor/assets/stylesheets/elements/_details.scss", "vendor/assets/stylesheets/elements/_elements-typography.scss", "vendor/assets/stylesheets/elements/_forms.scss", "vendor/assets/stylesheets/elements/_govuk-template-base.scss", "vendor/assets/stylesheets/elements/_helpers.scss", "vendor/assets/stylesheets/elements/_icons.scss", "vendor/assets/stylesheets/elements/_layout.scss", "vendor/assets/stylesheets/elements/_lists.scss", "vendor/assets/stylesheets/elements/_panels.scss", "vendor/assets/stylesheets/elements/_phase-banner.scss", "vendor/assets/stylesheets/elements/_reset.scss", "vendor/assets/stylesheets/elements/_shame.scss", "vendor/assets/stylesheets/elements/_tables.scss", "vendor/assets/stylesheets/elements/forms/_form-date.scss", "vendor/assets/stylesheets/elements/forms/_form-multiple-choice.scss", "vendor/assets/stylesheets/elements/forms/_form-validation.scss"]
  s.homepage = "https://github.com/alphagov/govuk_elements_rails"
  s.rdoc_options = ["--main", "README.md"]
  s.rubygems_version = "2.5.1"
  s.summary = "A gem wrapper around http://github.com/alphagov/govuk_elements that pulls stylesheet and javascript files into a Rails app."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 4.1.0"])
      s.add_runtime_dependency(%q<sass>, [">= 3.2.0"])
      s.add_runtime_dependency(%q<govuk_frontend_toolkit>, [">= 6.0.2"])
    else
      s.add_dependency(%q<rails>, [">= 4.1.0"])
      s.add_dependency(%q<sass>, [">= 3.2.0"])
      s.add_dependency(%q<govuk_frontend_toolkit>, [">= 6.0.2"])
    end
  else
    s.add_dependency(%q<rails>, [">= 4.1.0"])
    s.add_dependency(%q<sass>, [">= 3.2.0"])
    s.add_dependency(%q<govuk_frontend_toolkit>, [">= 6.0.2"])
  end
end
