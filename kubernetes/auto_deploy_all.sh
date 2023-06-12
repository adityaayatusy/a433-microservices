#!/bin/bash

arg="${1:-apply}"

kubectl "$arg" -f rabbitmq/rabbitmq-pv-pvc.yml
kubectl "$arg" -f rabbitmq/rabbitmq-statefulset.yml
kubectl "$arg" -f rabbitmq/rabbitmq-service.yml

if [ "$arg" = "apply" ]; then
   kubectl wait --namespace=default --timeout=50s --for=condition=Ready pod/rabbitmq-0
fi

kubectl "$arg" -f order/order-deployment.yml
kubectl "$arg" -f order/order-service.yml

kubectl "$arg" -f shipping/shipping-deployment.yml
kubectl "$arg" -f shipping/shipping-service.yml

kubectl "$arg" -f istio/gateway.yml
kubectl "$arg" -f istio/order-virtual-service.yml