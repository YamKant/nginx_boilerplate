from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework import status

class HealthCheckController(viewsets.ModelViewSet): 
    # queryset = User.objects.all()
    # serializer_class = UserSerializer
    # permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def list(self, req):
        return Response({"status": "ok"}, status=status.HTTP_200_OK)

health_check_list = HealthCheckController.as_view({
    'get': 'list',
})