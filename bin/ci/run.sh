#!/usr/bin/env bash

bundle update
bin/ci/make-framework.sh
bin/ci/make-ipa.sh
bundle exec bin/test/test-cloud.rb
bin/test/simulators.sh

