module GovUKElementsRails
  class Engine < ::Rails::Engine

    initializer "govuk_elements_rails.default_form_builder" do |app|
      use_builder = app.config.respond_to?(:use_govuk_elements_form_builder) &&
          app.config.use_govuk_elements_form_builder

      if use_builder
        ActionView::Base.default_form_builder = GovukElementsFormBuilder
      end
    end

  end
end
