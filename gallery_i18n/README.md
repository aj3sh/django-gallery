# Django i18n
"i18n" is also know as internationalization. It is also known as localization.

## Initialize i18n

In `settings.py` add `'django.middleware.locale.LocaleMiddleware'` below the `SessionMiddleware`. For example
```python
MIDDLEWARE = [
    ...
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware', # Middleware for localization
    ...
]
```

Add the following settings to add your languages.
```python
# Localizations settings
LANGUAGES = (
    ('en-us', _('English')),
    ('es', _('Spanish')),
    ('ne', _('Nepali')),
)

LOCALE_PATHS = (
    BASE_DIR / 'locale',
)
```

## Make and Compile messages

Install gettext (for ubuntu)
```bash
sudo apt-get install gettext libgettextpo-dev
```

```bash
python manage.py makemessages --all
```

Update your messages in `locale` directories

Compile your messages
```bash
python manage.py compilemessages
```

## Using the translation

```python
from django.utils.translation import gettext as _
my_trans = _('Hello World')
```

In django template
```django
{% load i18n %}
{% trans "Hello World" %}
```


## Changing the language (using cookie)
```python
translation.activate(language)
response.set_cookie(settings.LANGUAGE_COOKIE_NAME, language)
```