# $1 - scene_name (office / office_w_people)
# $2 - duration (2m)
# $3 - rviz (true / false)

roslaunch robust_slam kimera_uhumans.launch scene:=$1 record_for_evo:=true d:=$2 rviz:=$3

echo "start wait for 2 seconds"
sleep 2
echo "end wait for 2 seconds"

./plot_for_evo.sh $1_$2 --plot