#!/bin/bash

echo $DEPLOY_STAGE 

echo "LOGIN IN TO GIGALIXIR"
gigalixir login -e $GIGALIXIR_EMAIL -p $GIGALIXIR_PASS -y

echo "SET REMOTE $DEPLOY_STAGE "
gigalixir git:remote $DEPLOY_STAGE

echo "PUSH TO GIGALIXIR "
git push -f gigalixir HEAD:main




