#!/bin/bash

# This script should be `awsub-compose.yml` in the future.

# download
hotsub run \
  --image ken01nn/gdc-client \
  --script ./main.sh \
  --tasks ./CCLE-WGS.csv \
  --aws-ec2-instance-type m5.xlarge \
  --aws-region ap-northeast-1 \
  --disk-size 600 \
  -v

# bamtofastq
hotsub run \
  --image ken01nn/gdc-client \
  --script ./bamtofastq.sh \
  --tasks ./CCLE-WGS-BAM.csv \
  --aws-ec2-instance-type m5.xlarge \
  --aws-region ap-northeast-1 \
  --disk-size 1000 \
  -v

