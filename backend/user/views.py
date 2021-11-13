import json
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.generic import View, TemplateView
from pymongo import MongoClient


def display(request):
    client = MongoClient('localhost', 27017)
    db = client['baedalgeek_test']
    collection = db['Users']

    doc = collection.find().sort([('_id',-1)]).limit(1)[0]
    json = {}
    json['name'] = doc['name']
    json['age'] = doc['age']
    return JsonResponse(json, json_dumps_params={'ensure_ascii': True})

def test(request):
    



    json = {
            'message': 'hello 22 years old sungmin',
            'name': 'sungmin',
            'age': 23
        }
    return JsonResponse(json, json_dumps_params={'ensure_ascii': True})
    