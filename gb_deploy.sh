#!/usr/bin/env bash
VERSION=${1}
git pull
git add -A
git commit -m "Updating Documentation"
git push


#!/usr/bin/env bash
version=${1}
if [ -z "$version" ]; then
	./deploy.sh
else
	./deploy.sh --current $version
fi



