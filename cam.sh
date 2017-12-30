current=$(pwd)

cd /home/pi/bin/programs/camera_inst/mjpg-streamer/mjpg-streamer-experimental
nohup ./mjpg_streamer -i "./input_raspicam.so -fps 10 -x 320 -y 240" -o "./output_http.so -w ./www -p 8080" > cam.log 2> raspin_cam_error.log &
