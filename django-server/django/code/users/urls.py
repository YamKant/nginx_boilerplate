from django.urls import include, path
from rest_framework.routers import Route, DynamicRoute, SimpleRouter, DefaultRouter
from rest_framework.urlpatterns import format_suffix_patterns

from users.viewsets import UserViewSet

app_name = 'users'

urlpatterns = format_suffix_patterns([
    path('', UserViewSet.user_list, name='user_list'),
])