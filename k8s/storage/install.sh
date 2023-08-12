#!/bin/bash
kubectl create namespace storage 
kubectl create -f mysql.yaml -f  phpmyadmin.yaml -f  phpredisadmin.yaml -f  redis.yaml
