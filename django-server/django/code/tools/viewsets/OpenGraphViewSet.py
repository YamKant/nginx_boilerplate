from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework.decorators import action
from rest_framework import status
from rest_framework.parsers import JSONParser
from django.shortcuts import render, redirect
import requests
from bs4 import BeautifulSoup

class OpenGraphViewSet(ModelViewSet):
    @action(detail=False, methods=['post'])
    def getOpenGraph(self, req):
        try:
            urlPath = req.data['url']
            retData = requests.get(urlPath)
            soup = BeautifulSoup(retData.content, "html.parser")
            context = {
                'og_title': soup.find("meta", property="og:title")["content"],
                'og_image': soup.find("meta", property="og:image")["content"],
                'og_description': soup.find("meta", property="og:description")["content"],
                'og_url': urlPath
            }
            return Response(context, status=status.HTTP_200_OK)
        except Exception as e:
            return Response(False, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

open_graph_list = OpenGraphViewSet.as_view({
    'post': 'getOpenGraph',
})