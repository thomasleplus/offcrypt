#!/bin/bash
# Copyright 2016-present Thomas Leplus
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && \pwd)

cd "${SCRIPT_DIR}"

\echo Installing npm-check-updates...

\npm install -g npm-check-updates

\echo Running ncu...

rc=0

while read -r l; do
  \echo "${l}"
  if [[ "${l}" == *"→"* ]]; then
	  rc=$((rc+1))
  fi
done <<< "$(\ncu)"

exit ${rc}
