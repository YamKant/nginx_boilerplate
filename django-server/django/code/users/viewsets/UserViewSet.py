from rest_framework import viewsets
from users.models import DjangoUser, User
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework import status

class UserViewSet(viewsets.ModelViewSet): 
    # queryset = User.objects.all()
    # serializer_class = UserSerializer
    # permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def list(self, req):
        queryset = User.objects.filter().values('nickname')
        return Response(queryset, status=status.HTTP_200_OK)

user_list = UserViewSet.as_view({
    'get': 'list',
})