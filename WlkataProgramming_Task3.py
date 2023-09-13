#version python 3.8
#coding=utf-8
from mirobot import *
from time import sleep
api=Mirobot()
#Please do not delete the above code
api.home_simultaneous()

#1st row
api.go_to_cartesian_lin(Motion.MOVJ,194,-91,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,194,-91,-5,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,194,-91,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,270,-17,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,270,-17,-5,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,270,-17,50,0,0,0)

#2nd row
api.go_to_cartesian_lin(Motion.MOVJ,167,-84,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,167,-84,-5,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,167,-84,50,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,272,-17.5,50,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,272,-17.5,18,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,272,-17.5,50,0,0,0)

#3rd row
api.go_to_cartesian_lin(Motion.MOVJ,138,-80,70,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,138,-80,-5,0,0,0)
api.suction_cup_on()
api.go_to_cartesian_lin(Motion.MOVJ,138,-80,70,0,0,0)

api.go_to_cartesian_lin(Motion.MOVJ,274,-18,70,0,0,0)
api.go_to_cartesian_lin(Motion.MOVJ,274,-18,40,0,0,0)
api.suction_cup_off()
api.go_to_cartesian_lin(Motion.MOVJ,274,-18,70,0,0,0)