# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

##
# qvm.work
# ========
#
# Installs 'sd-svs' AppVM, to persistently store SD data
# This VM has no network configured.
##

{%- from "qvm/template.jinja" import load -%}

{% load_yaml as defaults -%}
name:         sd-svs
present:
  - template: fedora-28
  - label:    yellow
prefs:
  - netvm:    ""
{%- endload %}

{{ load(defaults) }}

sd-svs-dom0-qubes.OpenInVM:
  file.prepend:
    - name: /etc/qubes-rpc/policy/qubes.OpenInVM
    - text: "sd-svs $dispvm:sd-svs-disp allow\n"
