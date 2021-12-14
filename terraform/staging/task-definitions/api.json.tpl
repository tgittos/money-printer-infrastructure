[
  {
    "essential": true,
    "memory": 512,
    "name": "api",
    "cpu": 1,
    "image": "${REPOSITORY_URL}/api:latest",
    "environment": []
  },
  {
    "essential": true,
    "memory": 512,
    "name": "scheduler",
    "cpu": 1,
    "image": "${REPOSITORY_URL}/scheduler:latest",
    "environment": []
  }
]