## Write a function that, given a list of horses strength,
## prints the minimal difference between them to find the best
## to matches for a horse race

H_measure <- function(horses){
    horses <- sort(horses)
    diff <- c()
    for (j in 1:(length(horses))){
        d <- horses[j]-horses[j-1]
        diff <- append(diff, d)
    }
    min_dif <- min(diff)
    print(min_dif)
}

simple <- c(1,2,6,7,12,24,36) # result 1
unorder <- c(27, 39, 42, 115, 918, 27, 777, 602, 1) # result 0

H_measure(simple)
H_measure(unorder)

many <- c(rep(c(23,68,95,17,36)*10, 1000),
          rep(c(12,35,69,77,55,908,876), 1000),
          rep(c(342,24,61,654,500), 1000))

H_measure(many) # 3K less than a second
## 30K takes few mins
