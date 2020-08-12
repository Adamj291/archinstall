#!/bin/bash
loadkeys uk && echo KEYMAP=uk > /etc/vconsole.conf &&
echo "Keyboard Layout Added, please run 2-efi.sh"
