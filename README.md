# py-data

Play with python and data


```bash
kubect port-forward -n system svc/system-kube-prometheus-sta-prometheus 9090:9090 --address 0.0.0.0

curl -v http://192.168.0.57:9090/api/v1/label/__name__/values

curl -v http://192.168.0.56:9090/api/v1/query/node_time_seconds
curl -v http://192.168.0.57:9090/api/v1/query?query=solax_celsius&time=1708442165.903

curl -v http://192.168.0.57:9090/api/v1/query_range?query=solax_celsius&start=1708438628.893&end=1708442228.893&step=1
```