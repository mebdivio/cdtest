#! /bin/bash

DEPLOY = $($curl https://api.divio.com/apps/v3/deployments/$LIVE_DEPLOYMENT_ID/ -H "Authorization: Token $API_TOKEN")
echo "Deployment started"
while p -p  [$DEPLOY]
  do sleep 1;
done;
echo "Deployment Completed with $DEPLOY"
 