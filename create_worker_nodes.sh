aws cloudformation create-stack --stack-name registration-worker-nodes --template-body file://worker_nodes.yml --parameters file://worker_nodes_parameters.json --capabilities CAPABILITY_IAM
