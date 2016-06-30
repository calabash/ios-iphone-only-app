@sample_factor
Feature: sample_factor for non-optimized apps and zoomed mode

The server must be able to detect two Scenarios:

1. When the device is in Zoomed vs. Standard mode
2. When the application is not optimized for the iPhone 6* screen sizes.

In the first case, the sample factor does not change.  In the second case, the
sample factor must change.

The iPhoneOnly app is _not_ optimized for the larger screen sizes; it is
missing the required launch images, the correct app icons, and the image assets
in @3x sizes.  This Scenario tests that sample factor is correct in Zoomed and
Standard display modes.  There a several 2x2 point buttons that, when touched,
change the action label (in the middle of the view).

There are six tests to run:

1. Target an iPhone 6 simulator
2. Target an iPhone 6 Plus simulator
3. Target an iPhone 6 in Zoomed mode
4. Target an iPhone 6 in Standard mode
5. Target an iPhone 6 Plus in Zoomed mode
6. Target an iPhone 6 Plus in Standard mode

To change the display mode, use Settings.app:

Display & Brightness > Display Zoom > Standard | Zoomed > Set

On iOS Simulators, there is no Zoomed or Standard mode.

Scenario: Touch the small buttons
Given the app has launched
When I touch the top left button, the action text is correct
When I touch the top middle button, the action text is correct
When I touch the top right button, the action text is correct
When I touch the middle left button, the action text is correct
When I touch the middle right button, the action text is correct
When I touch the bottom left button, the action text is correct
When I touch the bottom middle button, the action text is correct
When I touch the bottom right button, the action text is correct

