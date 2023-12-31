#!/bin/bash
# Copyright 2023 The TensorFlow Authors. All Rights Reserved.
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
# ==============================================================================

function resultstore_extract_fallback {
  # In case the main script fails somehow.
  cat <<EOF
IMPORTANT: For bazel invocations that uploaded to ResultStore (e.g. RBE), you
can view more detailed results that are probably easier to read than this log.
Try the links below:
EOF
  # Find any "Streaming build results to" line, then print the last word in it,
  # and don't print duplicates
  awk '/Streaming build results to/ {print $NF}' "$TFCI_OUTPUT_DIR/script.log" | uniq
}

# Print out any ResultStore URLs for Bazel invocations' results.
# Each failed target there will have its own representation, making failures
# easier to find and read.
python3 \
  "$TFCI_GIT_DIR/ci/official/utilities/extract_resultstore_links.py" \
  "$TFCI_OUTPUT_DIR/script.log" \
  --print || resultstore_extract_fallback
