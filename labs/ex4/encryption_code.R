
rsa_encrypt <- function(raw.data,public.key){
  n <- public.key[1]
  e <- public.key[2]
  if (is.character(raw.data)){
    mod.data <-as.integer(utf8ToInt(raw.data))
  }else{
    mod.data <- raw.data
  }
  if (length(mod.data) > 1){
    enc.data <- sapply(mod.data,powerfun,p=e,n = n)
  } else{
    enc.data <- rsa_helper(mod.data,n,e)
  }
  return(enc.data)
}


rsa_decrypt <- function(encrypted.data,private.key){
  helper <- function(x,n,d){return(powerfun(x,d,n))}
  n <-private.key[1]
  d <- private.key[2]
  if (length(encrypted.data) > 1){
    decrypted.data <- paste0(intToUtf8(sapply(encrypted.data,helper,n=n,d=d)))
  } else{
    decrypted.data <- helper(encrypted.data,n,d)
  }
  return(decrypted.data)
}

powerfun <- function(x,p,n){
  out <- x
  for (ii in 1:(p-1)){
    v <- out*x
    out <- v %% n
  }
  return(out)
}

