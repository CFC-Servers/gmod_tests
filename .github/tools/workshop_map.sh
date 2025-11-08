#!/bin/bash

# Setup HolyTest
wget -q https://github.com/RaphaelIT7/gmod-holytest/releases/latest/download/linux.tar.gz -O ../../../gluatest/docker/_gluatest_artifacts/linux.tar.gz

# Workshop map since the workshop itself frequently fails inside the containers
wget -O gm_glua_tests.bsp https://github.com/CFC-Servers/gm_tests_map/raw/refs/heads/main/maps/gm_glua_tests.bsp
mkdir -p garrysmod/maps
mv gm_glua_tests.bsp garrysmod/maps/
tar -czf ../../../gluatest/docker/_gluatest_artifacts/gm_glua_tests.tar.gz -C . garrysmod
rm -r garrysmod