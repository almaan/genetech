## rstudio-server loading issue

If you are having issues accessing the rstudio-server after updating docker (page just keeps loading), you can try the following solution:

### remove genetech docker image

You can do this form the desktop application or fro the terminal. From the terminal, make sure to stop the container, then remove it:

```
docker stop <container_id>
docker rm <container_id>
```

Then you can remove the image:

```
docker rmi <image_id>
```

Also, remove `.config/` and `.local/` from the `genetech/` folder:

```
cd genetech
rm .config/ .local/
```

Below is a video showing how to complete these steps using the docker desktop app and the terminal:

[![]](https://user-images.githubusercontent.com/23736938/146781471-0fc61fa8-8743-48a4-9fe2-6da5835c596a.mov)

### Create docker image

Next, we will create the genetech docker image + container. Make sure to replace __GENETECH_PATH__ with the correct path to the `genetech/` folder on your system:

```
sudo docker run -d -p 1337:8787 --name genetech -e DISABLE_AUTH=true -v GENETECH_PATH:/home/genetech -e ROOT=TRUE almaand/genetech:bb2255
```

Below is a video showing how to complete this step in the terminal:

[![]](https://user-images.githubusercontent.com/23736938/146782053-d02b63d3-d374-4aef-93c8-42b02b4ee38e.mov)

