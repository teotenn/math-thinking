throw.dart <- function(){
    ## Center point
    x=0
    y=0
    ## Side of square
    a=2
    ## Random final landing position
    position.x = x+a/2*(-1+2*runif(1))
    position.y = y+a/2*(-1+2*runif(1))
    c(position.x,position.y)
}

is.within.circle <- function(x,y){
    ## Side of square
    a=2
    distance.from.center=sqrt((x^2)+(y^2))
    if (distance.from.center < (a/2)){TRUE}
    else {FALSE}
}

compute.pi <- function(n.throws){
    count.inside=0
    for (i in 0:n.throws){
        r=throw.dart()
        if(is.within.circle(r[1],r[2])==TRUE){
            count.inside=count.inside+1
        }
    }
    resultado=4*(count.inside/n.throws)
    resultado
}
