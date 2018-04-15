#!/usr/bin/env bash
# Script to get list of public proxies.
repo="kenorb/proxy_list"
ci_api="travis-ci.2.2+json"
ip_url="ifconfig.co"
job_id=$(jq ".builds|max_by(.id)|.job_ids|max_by(.)" < <(curl -H "Accept: application/vnd.${ci_api}" -sL https://api.travis-ci.org/repos/$repo/builds))
egrep -w "^(socks4|socks5|http)" < <(curl -sL https://api.travis-ci.org/jobs/$job_id/log)
