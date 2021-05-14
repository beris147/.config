#!/bin/bash
current=$(xbacklight -get | cut -d'.' -f 1)
echo " $current%"
