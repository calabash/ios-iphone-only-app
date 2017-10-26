@colors
Feature: Touch colored boxes

Scenario Outline: Touch every box
Given the app has launched
And I rotate the device so the home button is on the <position>
When I touch the "Asparagus" box, the text appears
When I touch the "Cayenne" box, the text appears
When I touch the "Clover" box, the text appears
When I touch the "Fern" box, the text appears
When I touch the "Midnight" box, the text appears
When I touch the "Mocha" box, the text appears
When I touch the "Moss" box, the text appears
When I touch the "Plum" box, the text appears
When I touch the "Tin" box, the text appears

Examples:
| position |
| bottom   |
| right    |
| left     |
