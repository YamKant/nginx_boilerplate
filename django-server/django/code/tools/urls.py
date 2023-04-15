from django.urls import include, path
from rest_framework.routers import Route, DynamicRoute, SimpleRouter, DefaultRouter
from rest_framework.urlpatterns import format_suffix_patterns

from tools.views.OpenGraphView import OpenGraphView
from tools.viewsets import OpenGraphViewSet

app_name = 'tools'

urlpatterns = format_suffix_patterns([
    path('view/open_graph/', OpenGraphView.as_view()),
    path('api/open_graph/', OpenGraphViewSet.open_graph_list, name='open_graph'),
])