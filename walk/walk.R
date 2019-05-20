### Simulates a random walking event
walk <- function(n){
    ## Let "n" be number of repetitions
    ## and x,y the coordinates of each rep
    x=rep(0,n)
    y=rep(0,n)
    for (i in 2:n+1){
        val = sample(1:4)[1]
        if (val == 1){
            x[i]=x[i-1]+1
            y[i]=y[i-1]}
        else if (val == 2){
            x[i]=x[i-1]-1
            y[i]=y[i-1]}
        else if (val == 3){
            x[i]=x[i-1]
            y[i]=y[i-1]+1}
        else {
            x[i]=x[i-1]
            y[i]=y[i-1]-1}
    }
    plot(x,y, type="p")
}

Tt.walk(10000)
