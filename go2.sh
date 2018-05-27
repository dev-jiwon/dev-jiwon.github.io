#! /bin/bash

echo `git add .`
echo -e "commit 내용을 입력해주세요. \c "
read
echo `git commit -m "$REPLY"`
echo `git push origin HEAD:master`

