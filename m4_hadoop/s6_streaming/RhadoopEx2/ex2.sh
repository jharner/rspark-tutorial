#!/usr/bin/env bash

# set the working directory to RhadoopEx1
# cd /home/rstudio/rspark-notes/c4_hadoop/s6_streaming/RhadoopEx2

# recursively remove the ex2 directory from hdfs and the output directory 
# from the  local file system
hdfs dfs -rm -r -f ex2
rm -rf output

# make the ex2 directory
hdfs dfs -mkdir ex2
hdfs dfs -ls ex2/

# load the data into hdfs
# for efficiency comment the following line after the first execution of this shell script
hdfs dfs -put -f short.csv ex2/
hdfs dfs -ls ex2/

# sink("/dev/null")

# run the hadoop job
hadoop jar $HADOOP_MAPRED_HOME/hadoop-streaming.jar \
  -files mapper.R,reducer.R \
  -inputformat org.apache.hadoop.mapred.lib.NLineInputFormat \
	-input ex2/short.csv -output ex2/output \
	-mapper mapper.R -reducer reducer.R

# get the output from hdfs
hdfs dfs -get ex2/output output

