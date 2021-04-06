Notice! This project is unmaintained. You can use https://openkruise.io/en-us/docs/imagepulljob.html as an alternative

Pull container images to your nodes so that they are already present when containers are launched.

This repo was created following this gist: https://gist.github.com/itaysk/7bc3e56d69c4d72a549286d98fd557dd from this blog post: http://blog.itaysk.com/2017/12/26/the-single-use-daemonset-pattern-and-prepulling-images-in-kubernetes.

## Usage

### With Helm
See the [Helm chart readme](/imagepuller/Readme.md) for comperhansive information, here's an example:

```
git clone https://github.com/itaysk/kube-imagepuller
cd kube-imagepuller
helm install imagepuller --set src.image=docker://index.docker.io/from/this:tag --set dst.image=docker-daemon:to/that:tag
```

### Without Helm
You can use [imagepuller.yaml](imagepuller.yaml) which is generated from the Helm chart using

```
helm template imagepuller > imagepuller.yaml
```

1. Download the rendered manifest:

```
curl -L -O https://raw.githubusercontent.com/itaysk/kube-imagepuller/master/imagepuller.yaml
```

2. Edit the important parameters, most importantly the source, and destination images at:

```
spec.template.spec.initContainers[0].command
```

3. Create in Kubernetes:

```
kubectl create -f imagepuller.yaml
```
