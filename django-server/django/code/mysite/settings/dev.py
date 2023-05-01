import os
from .base import *

SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY')

DEBUG = True

ALLOWED_HOSTS = [
    '127.0.0.1',
    'localhost'
]

INSTALLED_APPS += [
]

DATABASES = {
     'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

MIDDLEWARE += [
]