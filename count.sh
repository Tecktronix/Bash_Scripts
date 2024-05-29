#!/bin/bash

x="mississipi"

set -x

echo $x | grep "s"

echo $x | grep -o "s"

echo $x | grep -o "s" | wc -l

grep -o "s" <<<$x | wc -l

#grep -o "s" <<<$x | wc -l
