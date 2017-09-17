#!/usr/bin/env bash

echo "Conditionally uploading IPAs and dSYMs to HockeyApp"

  HOCKEYAPP_API_TOKEN=04bb1ac4faae485f81bdd447c5d0b074
  HOCKEYAPP_APP_ID=1e9e4307ea434495a0702a87e4a1df5f

  cd $BUDDYBUILD_PRODUCT_DIR
  find . -name "*.dSYM" -print | zip /tmp/dsyms.zip -@
  curl -v -F "ipa=@$BUDDYBUILD_IPA_PATH" \
          -F "dsym=@/tmp/dsyms.zip" \
          -H "X-HockeyAppToken: $HOCKEYAPP_API_TOKEN" \
       https://rink.hockeyapp.net/api/2/apps/$HOCKEYAPP_APP_ID/app_versions/upload
