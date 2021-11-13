from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.generic import View, TemplateView




def test(request):
    json = {
            'message': 'hello 22 years old sungmin',
            'name': 'sungmin',
            'age': 23
        }
    return JsonResponse(json, json_dumps_params={'ensure_ascii': True})
    