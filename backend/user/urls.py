from django.urls import path

from . import views

urlpatterns = [
    path('sungmin/22/', views.test, name='test'),
]