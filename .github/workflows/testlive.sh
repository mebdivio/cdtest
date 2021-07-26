#! /bin/bash

DEPLOY = $(curl https://api.divio.com/apps/v3/deployments/$LIVE_DEPLOYMENT_ID/ -H "Authorization: Token $API_TOKEN")
echo "Deployment started"
echo $DEPLOY
while [$DEPLOY]; do 
  sleep 1
  echo $DEPLOY
  DEPLOY = $(curl https://api.divio.com/apps/v3/deployments/$LIVE_DEPLOYMENT_ID/ -H "Authorization: Token $API_TOKEN")
done;
echo "Deployment Completed with $DEPLOY"
 