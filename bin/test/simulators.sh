#!/usr/bin/env bash

make app
rm -f reports/*json

bundle exec cucumber -p default
bundle exec cucumber -p simulator_six
bundle exec cucumber -p simulator_five
