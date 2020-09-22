require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

Capybara.configure do |config|
    config.default_driver = :chromedriver
    config.app_host = "http://localhost:8080"
end

