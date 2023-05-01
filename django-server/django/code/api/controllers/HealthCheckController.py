from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class HealthCheckController(APIView): 
    def get(self, req, format=None):
        return Response({"status": "ok"}, status=status.HTTP_200_OK)