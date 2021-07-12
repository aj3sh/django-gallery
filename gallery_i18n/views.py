from django.shortcuts import redirect
from django.views.generic import View, TemplateView
from django.utils import translation
from django.utils.translation import gettext as _
from django.conf import settings

class ExampleView(TemplateView):
    template_name = 'gallery_i18n/example.html'
    
    def get_context_data(self, **kwargs):
        kwargs['title_text'] = _('Hello World')
        return super().get_context_data(**kwargs)

class ChangeLanguageView(View):
    def get(self, request, *args, **kwargs):
        language = self.kwargs.get('language')
        translation.activate(language)
        if self.request.GET.get('redirect') != None:
            response = redirect(self.request.get('redirect'))
        else:
            response = redirect('gallery_i18n:example')
        response.set_cookie(settings.LANGUAGE_COOKIE_NAME, language)
        return response