PUBLIC_KEY <- c(187,3)

source("encryption_code.R")

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

check.q4 <-function(keep.spots){
  checksum <- "4950cee1e0aedad7d2033db32b82bdc8"
  if ( digest::digest(sort(keep.spots)) == checksum){
    print("Your spot selection was successful! Good job!")
  } else {
    print("Something went wrong with your spot selection. Give it a second look")
  }
}

check.q5 <-function(keep.genes){
  checksum <- "ed448f3814b5815511d7d5babb8639e1"
  if ( digest::digest(sort(keep.genes)) == checksum){
    print("Your spot selection was successful! Fabulous!")
  } else {
    print("Something went wrong with your gene selection. Give it a second look.")
  }
}

check.q7 <- function(ans){
  enc.true <- c(160,25)
  enc.ans <- sapply(ans,rsa_encrypt,public.key = PUBLIC_KEY)
  for (ii in 1:2){
    status <- ifelse(enc.ans[[ii]] == enc.true[ii],"correct","incorrect")
    print(sprintf("Answer %d is %s",ii,status))
  }
}


check.q9 <-function(top.genes){
  checksum <- "bc918bbb01ff45cc2ede888163f222c5"
  if ( digest::digest(sort(top.genes)) == checksum){
    print("You nailed them 5000 genes! Sweet!")
  } else {
    print("Doh!Something went wrong with your gene selection. Give it a second look.")
  }
}


check.q12 <-function(ans.data){
  tryCatch(
    expr = {
        colnames(ans.data) <-tolower(colnames(ans.data))
        checksum <- "65873a4b6f2eaca04d3e5eb9743e56a0"
        s.gn <- order(ans.data$gene)
        m.data <- ans.data[s.gn,]
        v.ans <- c(m.data$gene,m.data$prob,m.data$factor)
        enc.ans <- digest::digest(v.ans)
          
        if (enc.ans == checksum){
          print("Woop Woop! Excellent, your data frame looks just as it should!")
        } else {
          print("Foxtrot Uniform Charlie Kilo... that data frame was not correct")
        }
  },
  error = function(e){print("I'm sorry but this answer is so wrong that we couldn't even run the test.., give it another go!")}
  )
}
      
  

