## Calabash iPhone only app

For testing iPhone app emulation on iPads.


### Build

The target is linked with the calabash.framework.

```
$ git clone git@github.com:calabash/ios-iphone-only-app.git
$ cd ios-iphone-only-app/
$ bundle install
$ make app
```

App is installed to ./Calabash-app

If you need to make an .ipa, you might need to set the
`CODE_SIGN_IDENTITY` if you have multiple Developer accounts.

```
$ CODE_SIGN_IDENTITY="iPhone Developer: Joshua Moody (8<snip>F)" make ipa
```

