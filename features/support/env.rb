# To use Calabash without the predefined Calabash Steps, uncomment these
# three lines and delete the require above.
require "calabash-cucumber/wait_helpers"
require "calabash-cucumber/operations"
World(Calabash::Cucumber::Operations)

require "rspec"

if !RunLoop::Environment.xtc?
  require "pry"
  Pry.config.history.file = '.pry-history'
  require 'pry-nav'
end

