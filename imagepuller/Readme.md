## Values

| path | description |
| --- | --- |
| `src.image` | the image you want to pull. in skopeo image format |
| `src.pullSecret.enabled` | whether or not to use a pull secret when pulling the image |
| `src.pullSecret.name` | the name of the Kubernetes container registry pull secret to use when pulling the image | 
| `src.pullSecret.key` | the key name in the Kubernetes Secret containing the registry credentials |
| `dst.image` | the name for the locally created image. in skopeo image format |
| `initPuller.image` | the image for the init container containing skopeo |
| `initPuller.command` | the command to run in the init container, excludingsource and destination |
| `initPuller.secretMountPath` | where to mount the pull secret in the init container |
| `initPuller.secretProjection` | how to call the mounted file containint the pull secret |

## Examples

Pull a public image from Docker Hub: 
```
helm install imagepuller --set src.image=docker://index.docker.io/itaysk/cyan:blue --set dst.image=docker-daemon:itaysk/cyan:blue
```

Pull and rename: 
```
helm install imagepuller --set src.image=docker://index.docker.io/itaysk/cyan:blue --set dst.image=docker-daemon:myorg/mycyan:v1
```

Pull a private image from Docker Hub. This assumes a Kubernetes :

```
kubectl create secret docker-registry regcred --docker-username=itaysk --docker-password='***'

helm install imagepuller --set src.image=docker://index.docker.io/itaysk/private:latest --set dst.image=docker-daemon:itaysk/private:latest --set src.pullSecret.enabled=true
```