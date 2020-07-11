## Sample Java Web Application with Servlet API 3.x 

This demo is based on servlet demo from oracle sample available [here](https://www.oracle.com/webfolder/technetwork/tutorials/obe/java/basic_app_embedded_tomcat/basic_app-tomcat-embedded.html).

I have made few fixes to original demo to make it compatible with current scenario.

I have modified my [Dockerfile](./Dockerfile) to support `Multi Stage Build`.

You just need `docker` installed to build entire webapp and also create an executable container image for it.

## Steps

1. Use either `cmd` or `powershell` or `bash` terminal and use following commands:
    
    NOTE: the `$` symbol represent a `prompt` it's not part of command.

    ```
    ## clone this repository in current directory
    ## Don't worry, You DON'T NEED GitHub account!
    $ git clone https://github.com/mahendra-shinde/ci-servlet-demo
    $ cd ci-servlet-demo
    ## Build a new container image `temp` (can be replaced with whatever name you want!)
    $ docker build -t temp .
    ```

2.  Once you build an image, run the application using following command:

    ```bash
    ## replace `temp` with image name you have used in last command
    $ docker run --name myapp -d -p 8080:8080 temp
    ```

3.  Now, Open web browser to visit url `http://localhost:8080/`

4.  Now, to clean-up, stop the above container and delete it.

    ```bash
    ## stop and delete the container
    $ docker stop myapp
    $ docker rm myapp
    ## Optionally, delete the image as well
    ## WARN: image cannot be deleted if any stopped / running container
    ## is based on this image.
    $ docker rmi temp
    ```