#!/bin/bash
set -e

ZAP_REPORT_DIR="zap-report"
mkdir -p $ZAP_REPORT_DIR

TARGET_URL="http://simplecarrentalapp-stagging.eba-tz5hr59y.us-east-1.elasticbeanstalk.com/"

docker run --user root \
  -v $(pwd)/$ZAP_REPORT_DIR:/zap/wrk/:rw \
  ghcr.io/zaproxy/zaproxy:stable zap-baseline.py \
  -t "$TARGET_URL" \
  -r zap-report.html || true

echo "DAST scan completed. Report saved to $ZAP_REPORT_DIR/zap-report.html"
