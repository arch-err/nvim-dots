#!/usr/bin/env bash

wl-paste > /tmp/tmp_nvim_img

if file --mime-type /tmp/tmp_nvim_img | grep -q ": image/"; then
	printf true
else
	printf false
fi

rm /tmp/tmp_nvim_img
