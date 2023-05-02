from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import os

class ProfileController(APIView): 
    def get(self, req, format=None):
        settingProfile = os.environ.get('PROFILE')
        return Response(settingProfile, status=status.HTTP_200_OK)