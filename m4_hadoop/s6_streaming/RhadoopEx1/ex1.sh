#!/usr/bin/env bash

# set the working directory to RhadoopEx1
# cd /home/rstudio/rspark-notes/c4_hadoop/s6_streaming/RhadoopEx1

# recursively remove the ex2 directory from hdfs and the output directory 
# from the  local file system
hdfs dfs -rm -r -f ex1
rm -rf output

# make the ex1 directory
hdfs dfs -mkdir ex1
hdfs dfs -ls ex1/

# load the data into hdfs
hdfs dfs -put -f short.csv ex1/
hdfs dfs -ls ex1/

# sink("/dev/null")

# run the hadoop job
hadoop jar $HADOOP_MAPRED_HOME/hadoop-streaming.jar \
  -files mapper.R \
  -inputformat org.apache.hadoop.mapred.lib.NLineInputFormat \
	-input ex1/short.csv -output ex1/output \
	-mapper mapper.R 

# get the output from hdfs
hdfs dfs -get ex1/output output
