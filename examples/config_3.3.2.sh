#!/usr/bin/env bash
#
# Copyright 2023- IBM Inc. All rights reserved
# SPDX-License-Identifier: Apache-2.0
#

## Spark installation
export SPARK_HOME="/home/${USER}/software/spark-3.3.2-bin-hadoop3"

## Build Configuration for the Spark Docker container
# Determine using https://mvnrepository.com/artifact/org.apache.spark/spark-core_2.12/3.3.2
export SPARK_VERSION=3.3.2
export S3_SHUFFLE_VERSION=0.9.4
export HADOOP_VERSION=3.3.2
export AWS_SDK_VERSION=1.11.1026

## Kubernetes Config
export KUBERNETES_SERVER="https://9.4.244.122:6443" # export CodeEngine: "https://proxy.us-south.codeengine.cloud.ibm.com"
export KUBERNETES_PULL_SECRETS_NAME="zac-registry"
export KUBERNETES_NAMESPACE=$(kubectl config view --minify -o jsonpath='{..namespace}')
export KUBERNETES_SERVICE_ACCOUNT="${KUBERNETES_NAMESPACE}-manager"

## Image configuration
export DOCKER_REGISTRY="zac32.zurich.ibm.com"
export DOCKER_IMAGE_PREFIX="${PREFIX:-"${USER}/"}"

## S3 Config
export S3A_ENDPOINT="http://10.40.0.29:9000"
export S3A_ACCESS_KEY=${S3A_ACCESS_KEY:-$AWS_ACCESS_KEY_ID}
export S3A_SECRET_KEY=${S3A_SECRET_KEY:-$AWS_SECRET_ACCESS_KEY}
export S3A_OUTPUT_BUCKET=${S3A_BUCKET:-"zrlio-tmp"}
export SHUFFLE_DESTINATION=${SHUFFLE_DESTINATION:-"s3a://zrlio-tmp/"}

# Datasets
## Terasort
# Contains datasets generated by TeraGen: https://github.com/ehiggs/spark-terasort#generate-data
export TERASORT_BUCKET=zrlio-terasort

## TPCDS
# Contains datasets generated for TPC-DS: https://github.com/zrlio/parquet-generator#how-to-generate-tpc-ds-dataset
export TPCDS_BUCKET=zrlio-tpcds
