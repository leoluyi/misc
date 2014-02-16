em = function(W,s) {
  Ep = s[1]*dnorm(W, s[2], sqrt(s[4]))/(s[1]*dnorm(W, s[2], sqrt(s[4])) + (1-s[1])* dnorm(W, s[3], sqrt(s[5])))
  
  
  s[1] = mean(Ep)
  s[2] = sum(Ep*W) / sum(Ep)
  s[3] = sum((1-Ep)*W) / sum(1-Ep)
  s[4] = sum(Ep*(W-s[2])^2) / sum(Ep)
  s[5] = sum((1-Ep)*(W-s[3])^2) / sum(1-Ep)
  s
}

iter1 = function(W, s) {
  s1 = em(W,s)
  for (i in 1:5) {
    if (abs(s[i]-s1[i]) > 0.0001) {
      s=s1
      iter(W,s)
    }
    else s1
  }
  s1
}

iter2 = function(W, s){
  repeat{
    
    s1 = em(W,s)
    if (all(s-s1 < 0.0001)){
      
      break
    }
    else s=s1
    
  }
  list(s1)

}