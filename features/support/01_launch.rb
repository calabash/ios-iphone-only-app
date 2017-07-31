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
  options = {
    # Add launch options here.
  }

  if RunLoop::Environment.ci?
    target = RunLoop::Environment.device_target
    device = RunLoop::Device.device_with_identifier(target)
    RunLoop::CoreSimulator.quit_simulator
    sleep(10)
    RunLoop::CoreSimulator.erase(device)
    core_sim = RunLoop::CoreSimulator.new(device, nil)
    core_sim.launch_simulator
  end

  launcher.relaunch(options)
end

After do |scenario|
  # Calabash can shutdown the app cleanly by calling the app life cycle methods
  # in the UIApplicationDelegate.  This is really nice for CI environments, but
  # not so good for local development.
  #
  # See the documentation for NO_STOP for a nice debugging workflow
  #
  # http://calabashapi.xamarin.com/ios/file.ENVIRONMENT_VARIABLES.html#label-NO_STOP
  # http://calabashapi.xamarin.com/ios/Calabash/Cucumber/Core.html#console_attach-instance_method
  unless launcher.calabash_no_stop?
    calabash_exit
  end
end

