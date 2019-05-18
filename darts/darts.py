import random
import math

def throw_dart():
    """
    Simulates the randon throw of a dart. It can land anywhere in the square (uniformly randomly)
    """
    # Center point
    x,y = 0,0
    # Side of the square
    a = 2
    # Random final landing position of the dart between -a/2 and +a/2 around the center point
    position_x = x+a/2*(-1+2*random.random())
    position_y = y+a/2*(-1+2*random.random())
    return position_x,position_y

def is_within_circle(x,y):
    """
    Given the landing coordinate of a dart, determines if it fell inside the circle
    """
    # Side of the square
    a = 2
    
    distance_from_center = math.sqrt(x**2+y**2)
    
    if distance_from_center < a/2:
        return True
    else:
        return False

def compute_pi(n_throws):
    """
    Computes pi by throwing a bunch of darts at the square
    """
    n_throws = n_throws
    count_inside_circle=0
    for i in range(n_throws):
        r1,r2=throw_dart()
        if is_within_circle(r1,r2):
            count_inside_circle+=1
            
    result = 4*(count_inside_circle/n_throws)
    return result

