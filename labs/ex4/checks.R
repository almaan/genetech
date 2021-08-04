PUBLIC_KEY <- c(187,3)

check.q0 <- function(spatial.data,raw.data){
  if (nrow(spatial.data) == ncol(raw.data)){
    if (all(rownames(spatial.data) == colnames(raw.data))){
      srtd <- sort(rownames(spatial.data))
      checksums <- c("spatial.data" = "325545afefe2a8cc73a24e70e2d6413e",
                     "raw.data" = "7c544dff94b49a683e78f0e0e517586e"
                     )
      
      sd.status <- digest::digest(spatial.data[srtd,]) == checksums["spatial.data"]
      rd.status <- digest::digest(raw.data[,srtd]) == checksums["raw.data"]
      if (sd.status & rd.status){
        print("Your objects are correctly formated. Feel free to proceed!")
      } else {
        print("Your row/colnames are fine and the sizes of the objects match, but the data is not correct! Have a look at it again!")
      }
    } else {
      print("Your row/colnames are differently sorted in the two objects. Have a look at it again!")
    }
  } else{
    print("Your spatial.data object differs in size from the raw.data object. Have a look at it again!")
  }
} 


check.q1 <- function(ans){
  source("encryption_code.R")
  enc.true <- list(ans1 = c(68,132,63,23),
                   ans2 = c(68,10,10,75,26),
                  ans3 = c(23,84,23,25,84,84,63,84),
                  ans4 = c(87,57,133,67,75,26,68,10,75)
                  )
 
  enc.ans <- sapply(ans,rsa_encrypt,public.key=PUBLIC_KEY)
  
 if (length(enc.true) == length(ans)){
  for (ii in 1:length(ans)){
      status <- ifelse(all(enc.true[[ii]] == enc.ans[[ii]]),"correct","incorrect")
      print(sprintf("Answer %d is %s",ii,status))
   }
 } else {
    print("To few or too many answers! Have a look at it again!")
  }
}

check.q5 <-function(keep.spots){
  checksum <- "4950cee1e0aedad7d2033db32b82bdc8"
  if ( digest::digest(sort(keep.spots)) == checksum){
    print("Your spot selection was successful! Good job!")
  } else {
    print("Something went wrong with your spot selection. Give it a second look")
  }
}

check.q6 <-function(keep.genes){
  checksum <- "ed448f3814b5815511d7d5babb8639e1"
  if ( digest::digest(sort(keep.genes)) == checksum){
    print("Your spot selection was successful! Fabulous!")
  } else {
    print("Something went wrong with your gene selection. Give it a second look.")
  }
}

check.q8 <- function(ans){
  enc.true <- c(18,25)
  enc.ans <- sapply(ans,rsa_encrypt,public.key = PUBLIC_KEY)
  for (ii in 1:2){
    status <- ifelse(enc.ans[[ii]] == enc.true[ii],"correct","incorrect")
    print(sprintf("Answer %d is %s",ii,status))
  }
}