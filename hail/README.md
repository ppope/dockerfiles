### hail + Spark + Jupyter + Python 3

Modified from:
* https://github.com/shusson/docker-pyhail/blob/master/Dockerfile

Build:
```
docker build -t hail-spark-jupyter-py3:latest .
```

Run:
```
docker run -it \
  --name=hail \
  -p 8888:8888 \
  --volume "/home/$USER:/work" \
  hail-spark-jupyter-py3
```

TODO:
* `import hail` fails
