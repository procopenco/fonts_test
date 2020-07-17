docker build -t fonts_test .

docker run --name fonts -it --rm -v /home/maxpro/workspace/fonts_test:/app fonts_test node /app/run.js

# docker kill fonts
# docker rm fonts
