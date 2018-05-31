Build:
```
docker build -t ppope/geopandas .
```

Run:
```
docker run \
  --name=geopandas \
  -it -p 8888:8888 \
  --volume "/home/$USER:/home/jovyan/work" \
  ppope/geopandas
```

