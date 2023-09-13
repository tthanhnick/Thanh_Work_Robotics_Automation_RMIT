#version python 3.8
#coding=utf-8
from mirobot import *
from time import sleep
api=Mirobot()
#Please do not delete the above code
api.home_simultaneous()

#1st object 
api.go_to_cartesian_lin(Motion.MOVJ,201,-58,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,201,-58,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,201,-58,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,270,47,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,270,47,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,270,47,50,0,0,0)

#2nd object 
api.go_to_cartesian_lin(Motion.MOVJ,201,-85,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,201,-85,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,201,-85,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,275,19,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,275,19,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,275,19,50,0,0,0)

#3rd object 
api.go_to_cartesian_lin(Motion.MOVJ,173,-57,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,173,-57,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,173,-57,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,272,-9,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,272,-9,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,272,-9,50,0,0,0)

#4th object 
api.go_to_cartesian_lin(Motion.MOVJ,173,-82,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,173,-82,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,173,-82,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,269,-36,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,269,-36,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,269,-36,50,0,0,0)

#5th object 
api.go_to_cartesian_lin(Motion.MOVJ,143,-50,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,143,-50,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,143,-50,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,268,-66,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,268,-66,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,268,-66,50,0,0,0)

#6th object 
api.go_to_cartesian_lin(Motion.MOVJ,143,-77,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,143,-77,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,143,-77,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,253,-92,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,253,-92,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,253,-92,50,0,0,0)
