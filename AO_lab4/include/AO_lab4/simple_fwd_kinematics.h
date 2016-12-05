#include <math.h>
#include <iostream>
#include <ros/ros.h>
#include "AO_lab4/FwdKinematics.h"

bool get_pose(AO_lab4::FwdKinematics::Request  &req,
	      AO_lab4::FwdKinematics::Response &res);
