current=$(pwd)

cd /home/pi/bin/programs/camera_inst/mjpg-streamer/mjpg-streamer-experimental
nohup ./mjpg_streamer -i "./input_raspicam.so -fps 10 -x 320 -y 240 -vf" -o "./output_http.so -w ./www -p 8080" > cam.log 2> raspin_cam_error.log &
sleep 3
cd $current
cd ../raspin
nohup npm start > npm_raspin.log 2> npm_raspin_error.log &
sleep 15
cd ../physical_computing.raspberry_zero.raspin_client
if [ -e ./raspin ]; then
 ln -s ../raspin_client/raspin raspin
else
 echo "no action"
fi
nohup sudo python sensor.py > sensor.log 2> sensor_error.log &
nohup sudo python computing_resource_monitor.py > computing_resource_monitor.log 2> computing_resource_monitor_error.log &
nohup sudo python physical_controller.py > physical.log 2> physical_error.log &
