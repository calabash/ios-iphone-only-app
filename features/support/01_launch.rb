require 'calabash-cucumber/launcher'

# You can find examples of more complicated launch hooks in these
# two repositories:
#
# https://github.com/calabash/ios-smoke-test-app/blob/master/CalSmokeApp/features/support/01_launch.rb
# https://github.com/calabash/ios-webview-test-app/blob/master/CalWebViewApp/features/support/01_launch.rb

module Calabash::Launcher
  @@launcher = nil

  def self.launcher
    @@launcher ||= Calabash::Cucumber::Launcher.new
  end

  def self.launcher=(launcher)
    @@launcher = launcher
  end
end

Before do |scenario|
  launcher = Calabash::Launcher.launcher

  if !RunLoop::Environment.xtc?
    # Fingertips animations are causing touch failures on Test Cloud
    args = ["FINGERTIPS"]
  else
    args = []
  end

  options = {
    args: args
  }

  launcher.relaunch(options)
end

After do |scenario|
  if scenario.failed?
    if RunLoop::Environment.xtc?
      ENV["RESET_BETWEEN_SCENARIOS"] = "1"
      calabash_exit
    else
      binding.pry
    end
  end
end

