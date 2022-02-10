# Evaluation of Kimera
based on evo - https://github.com/MichaelGrupp/evo

## Launch kimera and plot metrics
This script launches a ros launchfile which launches kimera_vio_ros, a particular **scene** from the uHumans2 dataset, **rviz** and a rosbag record for a set **duration**. After the set duration this script plots and displays the ATE and RPE metrics using [evo](https://github.com/MichaelGrupp/evo), and stores the data into the eval/evaluation folder. 

`./launch_and_plot.sh <scene> <duration> <rviz>`

e.g

`./launch_and_plot.sh office_w_people 3m false`

## Visualize plots 
`./plot_for_evo.sh <scene>_<duration> --plot`
  
e.g

`./plot_for_evo.sh office_w_people_3m --plot`
