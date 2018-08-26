#!/bin/bash

set -e
set -u
set -v

# Download BAM
bamtofastq \
collate=1 exclude=QCFAIL,SECONDARY,SUPPLEMENTARY tryoq=0 gz=1 \
T=${OUTDIR}/temp.txt \
S=${OUTDIR}/single_end_output.txt \
O=${OUTDIR}/unmatched_first_output.txt \
O2=${OUTDIR}/unmatched_second_output.txt \
filename=${BAM} \
F=${OUTDIR}/sequence1.fastq.gz \
F2=${OUTDIR}/sequence2.fastq.gz

