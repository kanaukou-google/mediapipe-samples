#!/bin/bash
# Copyright 2026 The MediaPipe Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Placeholder for automatic model provisioning.
#
# EmbeddingGemma V2 (.litertlm) is not published to a public endpoint yet, so for now the model
# has to be placed next to the sources manually:
#
#     SemanticRetriever/embedding_gemma_v2_q4c_multisig.litertlm
#
# Once the model is available on Hugging Face, fill in MODEL_URL below. This script will then
# fetch it at build time (it is ~470 MB).

MODEL_FILE=./SemanticRetriever/embedding_gemma_v2_q4c_multisig.litertlm

# TODO(mediapipe): point this at the public Hugging Face resolve URL once the model ships, e.g.
# https://huggingface.co/google/embeddinggemma-v2/resolve/main/embedding_gemma_v2_q4c_multisig.litertlm
MODEL_URL=""

if test -f "${MODEL_FILE}"; then
  echo "INFO: embedding_gemma_v2_q4c_multisig.litertlm exists. Skipping download."
  exit 0
fi

if [ -n "${MODEL_URL}" ]; then
  curl -L -o "${MODEL_FILE}" "${MODEL_URL}"
  echo "INFO: Downloaded embedding_gemma_v2_q4c_multisig.litertlm to ${MODEL_FILE} ."
  exit 0
fi

echo "error: ${MODEL_FILE} is missing. EmbeddingGemma V2 is not publicly downloadable yet, so" \
     "copy the .litertlm file into the SemanticRetriever directory before building." >&2
exit 1
