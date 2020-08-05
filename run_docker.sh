docker run -d \
  --name isb_ugf_python38_container \
  -v $(pwd)/app:/app \
  -p 8080:80 \
  isb_ugf_python38_image \
  /start-reload.sh




#
# docker exec -it isb_ugf_python38_container bash