require "test_helper"
require "capybara/rails"
require "Capybara"
require "Capybara/cucumber"
require "rspec"
require "capybara/poltergeist"


module ActionController
  class IntegrationTest

    Capybara.default_driver = :poltergeist
    Capybara.register_driver :poltergeist do ||
      options = {
        :js_errors => true,
        :timeout => 120,
        :debug => false,
        :phantomjs_options => ["--load-images=no", "--disk-cache=false"],
        :inspector => true
      }
      Capybara::Poltergeist::Driver.new(app, options)
    end

  

    include Capybara::DSL

  end
end