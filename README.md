# tekton-pipelines
Repositório dedicado a aplicação `Tekton Pipelines`. Essa aplicação está sendo deployada com o ArgoCD referenciando o path `src`. 
A reponsábilidade desse path é concentrar todos os manifestos nescessários para subir o serviço no cluster Kubernetes. 

- Caso queira obter mais informações sobre o Tekton recomendo a leitura da doc oficial: https://tekton.dev/

## Criação das secrets
As seguintes secrets são necessárias para o webhook e algumas outras tarefas:

### Task git-clone
```sh
cat <<EOF | kubectl -n tekton-pipelines apply -f - 
kind: Secret
apiVersion: v1
metadata:
  name: github-credentials
    namespace: tekton-pipelines
data:
  id_rsa: ""
  known_hosts: ""
EOF
```

### Task set-status
```sh
cat <<EOF | kubectl -n tekton-pipelines apply -f - 
kind: Secret
apiVersion: v1
metadata:
  name: github-token
  namespace: tekton-pipelines
data:
  token: ""
EOF
```

### Interceptor GitHub (webhook)
```sh
cat <<EOF | kubectl -n tekton-pipelines apply -f - 
apiVersion: v1
kind: Secret
metadata:
  name: github-interceptor-secret
  namespace: tekton-pipelines
type: Opaque
stringData:
  secretToken: ""
EOF
```

```sh
bf8a3f9e3f9a44577
```
