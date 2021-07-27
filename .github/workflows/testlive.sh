#! /bin/bash

while true; do 
  sleep 1
  DEPLOY="$(curl https://api.divio.com/apps/v3/deployments/$LIVE_DEPLOYMENT_ID/ -H "Authorization: Token $API_TOKEN")"
  echo "${DEPLOY}" | jq '.' > deploy.json
  status="$(jq '.status' deploy.json)"
  echo "${status} on progress"
  success="$(jq '.success' deploy.json)"
  echo "Success is still ${success}"

  if [ $success=='true' ] || [ $success=='false' ]; then
    if [ $success == 'true' ]; then 
        echo "Deployment has completed successfully"
        exit 0
    else 
        echo "Deplyment has failed"
        exit 1
    fi
    break
  fi

done