# -*- coding: utf-8 -*-
<<<<<<< HEAD
"""
Fishing Encyclopedia - Routes Module
All HTTP handlers and application logic
"""
=======
"""Fishing Encyclopedia - Routes Module"""
>>>>>>> golubevBranch

from bottle import Bottle, route, template, request, static_file, HTTPResponse
import json
import os
import database

# Создаём приложение
app = Bottle()

# Пути к директориям
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
STATIC_DIR = os.path.join(BASE_DIR, 'static')
TEMPLATES_DIR = os.path.join(BASE_DIR, 'templates')

# ВАЖНО: Указываем Bottle где искать шаблоны
from bottle import TEMPLATE_PATH
TEMPLATE_PATH.insert(0, TEMPLATES_DIR)

# ============================================================================
# MAIN PAGES
# ============================================================================

@app.route('/')
def index():
    """Главная страница"""
    return template('index',
                   title='Энциклопедия рыбалки',
                   fish=database.fish_data,
                   locations=database.locations_data,
                   seasons=database.seasons_data,
                   json=json)  

@app.route('/fish')
def fish_catalog():
    """Каталог рыб"""
    return template('fish_catalog',
                   title='Все виды рыб',
                   fish=database.fish_data)

@app.route('/locations')
def locations_catalog():
    """Места ловли"""
    return template('locations',
                   title='Места для рыбалки',
                   locations=database.locations_data)

@app.route('/seasons')
def seasons_catalog():
    """Сезоны"""
    return template('seasons',
                   title='Сезонность рыбалки',
                   seasons=database.seasons_data)

# ============================================================================
# API ENDPOINTS
# ============================================================================

@app.route('/api/search')
def api_search():
    """API: Поиск рыбы"""
    query = request.query.get('q', '').strip()
    
    if not query:
        return json.dumps({'results': []}, ensure_ascii=False)
    
    results = database.search_fish(query)
    return json.dumps({'results': results}, ensure_ascii=False)

# ============================================================================
# STATIC FILES
# ============================================================================

@app.route('/static/<filepath:path>')
def serve_static(filepath):
    """Раздача статических файлов"""
    return static_file(filepath, root=STATIC_DIR)
