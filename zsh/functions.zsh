#!/usr/bin/env zsh

function gi() {
    curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;
}

function mkd() {
    mkdir -p "$@" && cd "$_";
}

function rspndr-cluster-task-debug() {
  local service="${1:-staging-server-service}"
  local cluster="${2:-staging-cluster}"
  local local_debug_port="${3:-5005}"

  echo "Getting latest running ECS task in cluster: $cluster..."

  local task_arn=$(aws ecs list-tasks \
    --cluster "$cluster" \
    --service-name "$service" \
    --query 'taskArns[0]' \
    --output text | tr -d '\r' | tr -d '\n' | xargs)

  if [[ -z "$task_arn" || "$task_arn" == "None" ]]; then
    echo "❌ No running task ARNs found for service $service in cluster $cluster"
    return 1
  fi
  
  local container_debug_port=$(aws ecs describe-tasks \
    --cluster "$cluster" \
    --tasks "$task_arn" \
    --query "tasks[0].containers[0].networkBindings[?hostPort>=\`5000\` && hostPort<=\`5999\`].hostPort | [0]" \
    --output text)

  if [[ -z "$container_debug_port" || "$container_debug_port" == "None" ]]; then
    echo "❌ No debug port between the range of 5000-5999 found."
    return 1
  fi
  
  echo "✅ Resolved container debug port: $container_debug_port"

  local container_instance_arn=$(aws ecs describe-tasks \
    --cluster "$cluster" \
    --tasks "$task_arn" \
    --query "tasks[0].containerInstanceArn" \
    --output text)

  if [[ -z "$container_instance_arn" || "$container_instance_arn" == "None" ]]; then
    echo "❌ Failed to get EC2 Container Instance ARN."
    return 1
  fi

  echo "✅ Resolved container's instance ARN: $container_instance_arn"

  local ec2_instance_id=$(aws ecs describe-container-instances \
    --cluster "$cluster" \
    --container-instances "$container_instance_arn" \
    --query "containerInstances[0].ec2InstanceId" \
    --output text)

  if [[ -z "$ec2_instance_id" || "$ec2_instance_id" == "None" ]]; then
    echo "❌ Failed to resolve EC2 instance ID from container instance."
    return 1
  fi

  echo "✅ Resolved container's EC2 Instance ID: $ec2_instance_id"

  echo "Starting port forward: localhost:$local_debug_port → container:$container_debug_port..."

  aws ssm start-session \
    --target "$ec2_instance_id" \
    --document-name AWS-StartPortForwardingSessionToRemoteHost \
    --parameters "host=[\"127.0.0.1\"],portNumber=[\"$container_debug_port\"],localPortNumber=[\"$local_debug_port\"]"
}
