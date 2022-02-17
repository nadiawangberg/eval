#!/bin/bash
# $1 - scene_name (office / office_w_people)
# $2 - duration (2m)
# $3 - rviz (true / false)


read -p "launch semantic segmentation kimera_vio (ours) or the original kimera_vio? [dyn / orig] : " KIMERAVERSION

if [[ "$KIMERAVERSION" == "dyn" ]]
then
  #Use dynamic kimera_vio (ours)
  source ~/catkin_ws/devel/setup.bash
  roslaunch robust_slam kimera_uhumans.launch scene:=$1 record_for_evo:=true d:=$2 rviz:=$3 bag_suffix:="dyn"
else
  #Use original kimera_vio
  source ~/catkin_ws2/devel/setup.bash
  roslaunch robust_slam kimera_uhumans.launch scene:=$1 record_for_evo:=true d:=$2 rviz:=$3 bag_suffix:="orig"
fi


#roslaunch robust_slam kimera_uhumans.launch scene:=$1 record_for_evo:=true d:=$2 rviz:=$3 # With seg_frame

#roslaunch robust_slam kimera_uhumans.launch scene:=$1 record_for_evo:=true d:=$2 rviz:=$3 seg_frame_topic:="-" #Without seg_frame

#Sleeping to wait for rosprocesses exiting (TODO(Nadia) - is this neccesary?)
sleep 2

if [[ "$KIMERAVERSION" == "dyn" ]]
then
  #Use seg frame
  ./plot_for_evo.sh $1_$2_dyn --plot # ./plot_for_evo.sh <name_of_rosbag> <should_plot> 
else
  #Use original - no segmentation frame
  ./plot_for_evo.sh $1_$2_orig --plot
fi