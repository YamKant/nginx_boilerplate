from django.urls import include, path
from rest_framework.routers import Route, DynamicRoute, SimpleRouter, DefaultRouter
from rest_framework.urlpatterns import format_suffix_patterns

from api.controllers.HealthCheckController import HealthCheckController
from api.controllers.ProfileController import ProfileController

app_name = 'users'

urlpatterns = format_suffix_patterns([
    path('health_check/', HealthCheckController.as_view(), name='healthcheck_controller'),
    path('profile/', ProfileController.as_view(), name='healthcheck_controller'),
])