#!/bin/bash

envsubst < "./server.properties.template" > "./server.properties" && ./bedrock_server