### python 安装
## unbuntu 16.04 
	unbuntu 16.04 系统默认的 python 是 2.x 版本，手动安装python3.5以上到
自定义目录。
	建立软链接：sudo l  -s /usr/bin/python3 /usr/bin/python3.5/bin/python

## pip 
	pip -V
	pip3 -V

## pip install
	sudo apt-get update
	sudp apt-get install python-pip
	sudp apt-get install python3-pip
	
## 查看 python 已安装包信息
	pip list
	pip3 list

## virtualenv install
	sudo apt-get install python-virtualenv
	or
	pip3 install virtualenv   
	pip3 install virtualenv-clone 
	pip3 install virtualenvwrapper

## vi ~/.bashrc
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
	export WORKON_HOME=$HOME/.virtualenvs
	source /usr/local/bin/virtualenvwrapper.sh

	source ~/.bashrc

## mkvirtualenv
	mkvirtual virName
	workon virName
	deactivate

### Djongo

## djongo install
	workon xiaoxiao
	pip install django
	pip list

## djongo version
	python -m django --version
	django-admin help

1. django-admin startproject mysite
2. python manage.py runserver 0.0.0.0:8080
3. python manage.py startapp polls

## polls/views.py
	from django.htt import HttpResponse
	def index(request):
		return HttpResponse("Hello world, polls index.");
## touch polls/urls.py
	from django.urls import path
	from .import views

	urlpatterns = [
		path('', views.index, name='index'),
	]
	
