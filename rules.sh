#!/bin/bash

# 订阅链接
SUBSCRIPTION_URLS=(
  # 若标签名包含中文，需要确保当前文件的编码为UTF-8，否则界面乱码
  "https://api.xmancdn.net/osubscribe.php?sid=156748&token=OK4cUW21&sip002=1#花"
)

#
# RULESET_URLS 中的标签名作为 DNS_SERVERS 中标签名的前缀(忽略 reject_out 和 direct_out 标签)
# 那么 DNS服务器 和 DNS规则 功能中相同前缀的出站会被自动勾选
# 两者中标签的顺序不需要保持一致
#
RULESET_URLS=(

  "reject_out|/etc/homeproxy/ruleset/adblockdns.srs"

  "HK_proxy_server_01|
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/google.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/googlefcm.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/google-play.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/google-cn.srs
  https://raw.githubusercontent.com/KaringX/karing-ruleset/sing/geo/geosite/google-trust-services@cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/google-gemini.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/google.srs"

  "SG_proxy_server_01|
  https://raw.githubusercontent.com/SagerNet/sing-geosite/refs/heads/rule-set/geosite-openai.srs
  https://raw.githubusercontent.com/SagerNet/sing-geosite/refs/heads/rule-set/geosite-bing.srs
  https://raw.githubusercontent.com/KaringX/karing-ruleset/sing/geo/geoip/ai.srs"

  "SG_proxy_server_02|
  https://raw.githubusercontent.com/SagerNet/sing-geosite/refs/heads/rule-set/geosite-discord.srs
  https://raw.githubusercontent.com/SagerNet/sing-geosite/refs/heads/rule-set/geosite-twitch.srs
  https://raw.githubusercontent.com/SagerNet/sing-geosite/refs/heads/rule-set/geosite-amazon.srs
  https://raw.githubusercontent.com/SagerNet/sing-geosite/refs/heads/rule-set/geosite-amazon@cn.srs
  https://raw.githubusercontent.com/SagerNet/sing-geosite/refs/heads/rule-set/geosite-amazontrust.srs"

  "US_proxy_server_02|
  https://raw.githubusercontent.com/SagerNet/sing-geosite/refs/heads/rule-set/geosite-twitter.srs
  https://raw.githubusercontent.com/SagerNet/sing-geosite/refs/heads/rule-set/geosite-x.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/twitter.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/tiktok.srs"
  
  "direct_out|/etc/homeproxy/ruleset/MyDirect.json
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/cn.srs"
)

DNS_SERVERS=(
  "HK_proxy_server_01|https://1.1.1.1/dns-query"
  "SG_proxy_server_01|https://1.1.1.1/dns-query"
  "SG_proxy_server_01|https://1.1.1.1/dns-query"
  "US_proxy_server_02|https://1.1.1.1/dns-query"
  
  # https://8.8.8.8/dns-query 会被作为默认DNS服务器
  "Default_DNS_Server|https://8.8.8.8/dns-query
  rcode://refused"
)