#!/usr/bin/env bash
# Script to get list of public proxies.
repo="kenorb/proxy_list"
ci_api="travis-ci.2.2+json"
ip_url="ifconfig.co"

job_id=$(jq ".builds|max_by(.id)|.job_ids|max_by(.)" < <(curl -H "Accept: application/vnd.${ci_api}" -sL https://api.travis-ci.org/repos/$repo/builds))
egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}:[0-9]{1,5}' < <(curl -sL https://api.travis-ci.org/jobs/$job_id/log) | \
  while IFS=: read ip port; do
    (
      (timeout 2 curl -x socks5://$ip:$port -qs -o/dev/null http://example.com/ && printf "socks5\t$ip\t$port\n") \
      || (timeout 2 curl -x socks4://$ip:$port -qs -o/dev/null http://example.com/ && printf "socks4\t$ip\t$port\n") \
      || (timeout 2 curl -x http://$ip:$port -qs -o/dev/null http://example.com/ && printf "http\t$ip\t$port\n")
    ) &
    sleep 0.2
  done
wait
