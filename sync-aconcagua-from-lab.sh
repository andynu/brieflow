#!/bin/bash -x
set ex

export SOURCE='andy@fry:/lab/cheeseman_ops/brieflow-screens/aconcagua-analysis/analysis/analysis_root'
export DESTINATION='aconcagua_output'

# Sync initial set of eval png and tsv files.
rsync --progress -av --prune-empty-dirs \
  --include="cluster/***" \
  --include="*/eval/***" \
  --include="*/*/eval/***" \
  --exclude="*__montage_data" \
  --exclude="*/tsvs/***" \
  --exclude="preprocess/***" \
  --exclude="*.tiff" \
  --exclude="*.tif" \
  --exclude="*.json" \
  --exclude="*.parquet" \
  $SOURCE/ \
  ./$DESTINATION/
#
# # Sync everything in the aggregate/montages directory
rsync --progress -av \
  --exclude="*__montage_data" \
  --exclude="*.json" \
  $SOURCE/aggregate/montages/ \
  ./$DESTINATION/aggregate/montages/
  

# # Sync feature table TSVs
rsync --progress -av \
  --include="aggregate/tsvs/CeCl-*_ChCo-*__feature_table.tsv" \
  --exclude="aggregate/tsvs/*" \
  --exclude="phenotype/tsvs/*" \
  --exclude="preprocess/***" \
  --exclude="*__montage_data" \
  --exclude="sbs/tsvs/*" \
  --exclude="*.parquet" \
  --exclude="*.tiff" \
  --exclude="*.tif" \
  --exclude="*.json" \
  --exclude="aggregate/parquets/***" \
  $SOURCE/ \
  ./$DESTINATION/

# Sync JSON files from cluster directory
rsync --progress -av \
  --exclude="*.json" \
  $SOURCE/cluster/ \
  ./$DESTINATION/cluster/

scp $SOURCE/../screen.yaml ./$DESTINATION/.
scp $SOURCE/../config/config.yml ./$DESTINATION/config.yaml # Note the normalzing of the yaml file extension.

# Tidy up riders.
#rm -i -rf ./$DESTINATION/phenotype/tsvs
#rm -i -rf ./$DESTINATION/aggregate/montages/*__montage_data
#rm -i ./$DESTINATION/**/*.json
