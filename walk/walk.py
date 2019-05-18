import numpy
import random
import pylab

def walk(n):
    n = n
    x = numpy.zeros(n)
    y = numpy.zeros(n)
    for i in range(1,n):
        val = random.randint(1,4)
        if val == 1:
            x[i]=x[i-1]+1
            y[i]=y[i-1]
        elif val == 2:
            x[i]=x[i-1]-1
            y[i]=y[i-1]
        elif val == 3:
            x[i]=x[i-1]
            y[i]=y[i-1]+1
        else:
            x[i]=x[i-1]
            y[i]=y[i-1]-1
    pylab.plot(x,y)
    pylab.show()

