#! /usr/bin/env Rscript

input <- file("stdin" , "r")
lastKey <- ""

tempFile <- tempfile(pattern="hadoop-mr-demo" , fileext="csv")
tempHandle <- file(tempFile , "w")

while( TRUE ){

	currentLine <- readLines(input , n=1)
	if(0 == length(currentLine)){
		break
	}

# break this apart into the key and value that were
# assigned in the Map task
	tuple <- unlist(strsplit(currentLine, "\t"))
	currentKey <- tuple[1]
	currentValue <- tuple[2]

	if(currentKey != lastKey) {
# a little extra logic here, since the first time through,
# this conditional will trip

		if(lastKey != ""){
# we've hit a new key, so first let's process the
# data we've accumulated for the previous key:
	
# close tempFile connection
			close(tempHandle)
	
# read file of accumulated lines into a data.frame
			bucket <- read.csv(tempFile , header=FALSE)
	
# process data.frame and write result to standard output
			result <- apply(as.matrix(bucket[1]), 2, mean)
	
# write result to standard output
			cat(lastKey , "\t" , result , "\n")
	
# cleaup, and start fresh for the next round
			tempHandle <- file(tempFile , "w")
		}
	  
	  lastKey <- currentKey

	}
# by now, either we're still accumulating data for the same key
# or we have just started a new file.  Either way, we dump a line
# to the file for later processing.
  cat(currentValue , "\n" , file=tempHandle, append=TRUE)
	
}

## handle the last key, wind-down, cleanup
close(tempHandle)

bucket <- read.csv(tempFile , header=FALSE)
result <- apply(as.matrix(bucket[1]), 2, mean)
cat(currentKey , "\t" , result , "\n")

unlink(tempFile)

close(input)

