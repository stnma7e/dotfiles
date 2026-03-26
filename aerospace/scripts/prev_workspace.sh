#!/bin/bash

prev=$(cat /tmp/aerospace_previous 2>/dev/null)

if [ -n "$prev" ]; then
  aerospace workspace "$prev"
fi
