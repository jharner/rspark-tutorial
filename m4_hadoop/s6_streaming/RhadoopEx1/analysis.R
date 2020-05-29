#! /usr/bin/env Rscript

calls <- read.csv("output/part-00000", header=FALSE, sep="\t")
names(calls) <- c("call_number", "call_length")

tapply(calls$call_length, calls$call_number, mean)
