from django.urls import path

from . import views

app_name = 'gallery_i18n'

urlpatterns = [
    path('', views.ExampleView.as_view(), name='example'),
    path('change-language/<str:language>', views.ChangeLanguageView.as_view(), name='change-language')
]
