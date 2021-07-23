
deploy = [$curl https://api.divio.com/apps/v3/deployments/$LIVE_DEPLOYMENT_ID/ -H "Authorization: Token $API_TOKEN"]

while p -p  [deploy] > null;
  do sleep 1;
  done;
  echo "deploy"
 