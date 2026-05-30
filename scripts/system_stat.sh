#!/bin/env/bash

battery=$(acpi | awk '{print $4}' | tr -d '%,'))

