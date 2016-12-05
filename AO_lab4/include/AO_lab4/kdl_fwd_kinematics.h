#include <ros/ros.h>
#include <iostream>
#include <kdl/kdl.hpp>
#include <kdl/chain.hpp>
#include <kdl/chainfksolver.hpp>
#include <kdl/chainfksolverpos_recursive.hpp>
#include <math.h>
#include <stdlib.h>
#include "AO_lab4/FwdKinematics.h"

bool get_pose(AO_lab4::FwdKinematics::Request  &req,
	      AO_lab4::FwdKinematics::Response &res);
