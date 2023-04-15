from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework.response import Response
from rest_framework.views import APIView

class OpenGraphView(APIView):
    renderer_classes = [TemplateHTMLRenderer]
    template_name = 'tools/open_graph.html'

    def get(self, request):
        return Response({'msg': 'open_graph page rendering'})
