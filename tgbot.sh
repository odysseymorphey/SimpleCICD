#!/bin/bash
TELEGRAM_BOT_TOKEN="5875492076:AAGO66BZTeQeM55_acf5l6-YqO7BByJ1jag"
TELEGRAM_USER_ID="981130723"

STAGE="Job"
CI_JOB_STATUS="success"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="$STAGE: $CI_JOB_STAGE%0A%0AStatus: $CI_JOB_STATUS%0A%0AProject:+$CI_PROJECT_NAME%0A"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL
