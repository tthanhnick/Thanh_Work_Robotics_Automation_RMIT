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

api.go_to_cartesian_lin(Motion.MOVJ,178,60,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,178,60,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,178,60,50,0,0,0)

#2nd object 
api.go_to_cartesian_lin(Motion.MOVJ,201,-85,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,201,-85,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,201,-85,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,210,56,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,210,56,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,210,56,50,0,0,0)

#3rd object 
api.go_to_cartesian_lin(Motion.MOVJ,173,-57,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,173,-57,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,173,-57,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,157,29,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,157,29,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,157,29,50,0,0,0)

#4th object 
api.go_to_cartesian_lin(Motion.MOVJ,173,-82,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,173,-82,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,173,-82,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,230,22,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,230,22,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,230,22,50,0,0,0)

#5th object 
api.go_to_cartesian_lin(Motion.MOVJ,143,-50,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,143,-50,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,143,-50,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,171,2,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,171,2,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,171,2,50,0,0,0)

#6th object 
api.go_to_cartesian_lin(Motion.MOVJ,143,-77,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,143,-77,-4,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,143,-77,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,210,-4,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,210,-4,-4,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,210,-4,50,0,0,0)
