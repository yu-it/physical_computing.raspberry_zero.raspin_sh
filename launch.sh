current=$(pwd)

cd /home/pi/bin/programs/camera_inst/mjpg-streamer/mjpg-streamer-experimental
nohup ./mjpg_streamer -i "./input_raspicam.so -fps 10 -x 320 -y 240" -o "./output_http.so -w ./www -p 8080" &
cd $current
cd ../raspin
nohup npm start &
sleep 10
cd ../physical_computing.raspberry_zero.raspin_client
nohup sudo python sensor.py &
nohup sudo python computing_resource_monitor.py &
nohup sudo python physical_controller.py &
