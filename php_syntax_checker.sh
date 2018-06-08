#!/usr/bin/env bash

ERROR=0
for FILE in `git diff --name-status origin/develop -- | grep -E '^[AUM].*\.php$'| cut -c3-`; do
    if ! php -l $FILE; then
        ERROR=1
    fi
done

exit $ERROR
