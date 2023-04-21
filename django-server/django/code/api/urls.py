from django.urls import include, path
from rest_framework.routers import Route, DynamicRoute, SimpleRouter, DefaultRouter
from rest_framework.urlpatterns import format_suffix_patterns

from api.controllers import HealthCheckController

app_name = 'users'

urlpatterns = format_suffix_patterns([
    path('', HealthCheckController.health_check_list, name='health_check_list'),
])