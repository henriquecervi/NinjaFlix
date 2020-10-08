require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"

require_relative "helpers" # importando o Helpers.rb

World(Helpers) #para ficar disponível global


CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))


Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = CONFIG["url"]
    config.default_max_wait_time = 10
end

