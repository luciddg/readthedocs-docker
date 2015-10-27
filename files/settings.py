ACCOUNT_EMAIL_REQUIRED = False
ACCOUNT_EMAIL_VERIFICATION = 'none'
ALLOW_PRIVATE_REPOS = True

REDIS = {
    'host': 'redis',
    'port': 6379,
    'db': 0,
}

BROKER_URL = 'redis://redis:6379/0'
CELERY_RESULT_BACKEND = 'redis://redis:6379/0'

DOCKER_ENABLED = True
DOCKER_SOCKET = 'unix:///var/run/docker.sock'

SLUMBER_API_HOST = 'http://slumber:8000'
SLUMBER_USERNAME = 'test'
SLUMBER_PASSWORD = 'test'

PRODUCTION_DOMAIN = '192.168.99.100'

ES_HOSTS = ['elasticsearch:9200']

#EMAIL_HOST
#EMAIL_HOST_USER
#EMAIL_HOST_PASSWORD
#EMAIL_PORT
