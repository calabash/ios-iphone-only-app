all:
	$(MAKE) app

clean:
	rm -rf build
	rm -rf Products
	# Legacy
	rm -rf Calabash-app
	rm -rf Calabash-ipa

# Builds an ipa linked with the Calabash server.
#
# Respects the CODE_SIGN_IDENTITY variable, which might be necessary
# if you have multiple Developer accounts.
# $ CODE_SIGN_IDENTITY="iPhone Developer: Joshua Moody (8<snip>F)" make ipa
ipa:
	bin/make/ipa.sh

# Builds an app linked with the Calabash server.
app:
	bin/make/app.sh

