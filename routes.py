# -*- coding: utf-8 -*-
"""
Fishing Encyclopedia - Routes Module
All HTTP handlers and application logic
"""

from bottle import Bottle, route, template, request, redirect, static_file, HTTPError
from datetime import datetime
import database
import os

app = Bottle()

<<<<<<< HEAD
# ГЛАВНЫЕ СТРАНИЦЫ

@app.route('/')
def index():
    """Главная страница с каталогом рыб"""
    return template('index', 
                   title='Главная', 
                   year=2026,
                   fish_list=database.fish_data[:6],  # Показать 6 популярных
                   statistics=database.statistics)

@app.route('/fish')
def fish_catalog():
    """Страница со всеми видами рыб"""
    query = request.query.get('q', '').strip()
    
    if query:
        # Поиск по названию рыбы
        results = database.search_fish(query)
        return template('fish_catalog',
                       title='Поиск: ' + query,
                       year=2026,
                       fish_list=results,
                       search_query=query)
    
    # Показать все рыбы
    return template('fish_catalog',
                   title='Все виды рыб',
                   year=2026,
                   fish_list=database.fish_data,
                   search_query='')

@app.route('/fish/<name>')
def fish_detail(name):
    """Страница с подробной информацией о рыбе"""
    # Декодируем имя из URL (заменяем %20 на пробел)
    fish_name = name.replace('-', ' ').replace('_', ' ')
    
    fish = database.get_fish_by_name(fish_name)
    
    if not fish:
        return HTTPError(404, "Рыба не найдена")
    
    # Определяем сезон для подсветки
    current_season = None
    for season_key, season_data in database.seasons_data.items():
        if fish['season'].lower() in season_data['name'].lower():
            current_season = season_data
            break
    
    return template('fish_detail',
                   title=fish['name'],
                   year=2026,
                   fish=fish,
                   season_info=current_season,
                   related_fish=database.get_fish_by_location(fish['locations'].split(',')[0].strip())[:3])

# МЕСТА ЛОВЛИ

@app.route('/locations')
def locations_catalog():
    """Страница со всеми типами мест для рыбалки"""
    return template('locations',
                   title='Места ловли',
                   year=2026,
                   locations=database.locations_data)

@app.route('/locations/<name>')
def location_detail(name):
    """Страница с информацией о конкретном месте"""
    location_name = name.replace('-', ' ').replace('_', ' ')
    
    location = None
    for loc in database.locations_data:
        if loc['name'].lower() == location_name.lower():
            location = loc
            break
    
    if not location:
        return HTTPError(404, "Место не найдено")
    
    # Получаем рыб для этого места
    fish_in_location = database.get_fish_by_location(location['name'])
    
    return template('location_detail',
                   title=location['name'],
                   year=2026,
                   location=location,
                   fish_list=fish_in_location)

# СЕЗОННОСТЬ

@app.route('/seasons')
def seasons_catalog():
    """Страница с информацией о сезонах"""
    return template('seasons',
                   title='Сезонность',
                   year=2026,
                   seasons=database.seasons_data)

@app.route('/seasons/<season>')
def season_detail(season):
    """Страница с подробной информацией о сезоне"""
    season_key = season.lower()
    
    if season_key not in database.seasons_data:
        return HTTPError(404, "Сезон не найден")
    
    season_info = database.seasons_data[season_key]
    
    # Получаем рыб, активных в этот сезон
    active_fish = []
    for fish in database.fish_data:
        if season_info['name'].lower() in fish['season'].lower():
            active_fish.append(fish)
    
    return template('season_detail',
                   title=season_info['name'],
                   year=2026,
                   season=season_info,
                   fish_list=active_fish)

# ПОИСК И ФИЛЬТРЫ

@app.route('/search')
def search():
    """Страница поиска"""
    query = request.query.get('q', '').strip()
    fish_type = request.query.get('type', '').strip()
    location = request.query.get('location', '').strip()
    
    results = database.fish_data
    
    # Фильтр по поисковому запросу
    if query:
        results = database.search_fish(query)
    
    # Фильтр по типу рыбы (хищная/мирная)
    if fish_type:
        # Можно расширить логику фильтрации
        pass
    
    # Фильтр по месту ловли
    if location:
        results = [f for f in results if location.lower() in f['locations'].lower()]
    
    return template('search_results',
                   title='Результаты поиска',
                   year=2026,
                   fish_list=results,
                   query=query,
                   filters={'type': fish_type, 'location': location})

@app.route('/api/search')
def api_search():
    """API endpoint для поиска (возвращает JSON)"""
    query = request.query.get('q', '').strip()
    
    if not query:
        return {'error': 'Query parameter is required'}
    
    results = database.search_fish(query)
    
    # Возвращаем только нужные поля
    simplified = [
        {
            'id': f['id'],
            'name': f['name'],
            'description': f['description'][:100] + '...',
            'season': f['season'],
            'image': f['image']
        }
        for f in results
    ]
    
    return {'results': simplified, 'count': len(simplified)}

# ДОПОЛНИТЕЛЬНЫЕ СТРАНИЦЫ

@app.route('/about')
def about():
    """Страница 'О проекте'"""
    return template('about',
                   title='О проекте',
                   year=2026,
                   stats=database.statistics)

@app.route('/contact')
def contact():
    """Страница контактов"""
    return template('contact',
                   title='Контакты',
                   year=2026)

@app.route('/tips')
def tips():
    """Страница с советами для начинающих"""
    tips_list = [
        {
            "title": "Выбор снастей",
            "content": "Подбирайте снасти под вид рыбы и условия ловли."
        },
        {
            "title": "Время рыбалки",
            "content": "Раннее утро и вечер — лучшее время для клева."
        },
        {
            "title": "Прикормка",
            "content": "Используйте прикормку для привлечения рыбы к месту ловли."
        },
        {
            "title": "Погода",
            "content": "Давление и температура воды влияют на активность рыбы."
        }
    ]
    return template('tips',
                   title='Советы рыболову',
                   year=2026,
                   tips=tips_list)

# СТАТИЧЕСКИЕ ФАЙЛЫ

@app.route('/static/<filepath:path>')
def server_static(filepath):
    """Раздача статических файлов (CSS, JS, изображения)"""
    return static_file(filepath, root='./static')

@app.route('/images/<filename>')
def server_images(filename):
    """Раздача изображений рыб"""
    return static_file(filename, root='./static/images')

# ОБРАБОТЧИКИ ОШИБОК

@app.error(404)
def error_404(error):
    """Страница 404"""
    return template('error',
                   title='Страница не найдена',
                   year=2026,
                   error_code=404,
                   error_message='Запрошенная страница не существует')

@app.error(500)
def error_500(error):
    """Страница 500"""
    return template('error',
                   title='Ошибка сервера',
                   year=2026,
                   error_code=500,
                   error_message='Произошла внутренняя ошибка сервера')

# ЗАПУСК ПРИЛОЖЕНИЯ

if __name__ == '__main__':
    # Запуск в режиме разработки
=======
# ============================================================================
# GLOBAL SETTINGS
# ============================================================================

# Dynamic year (instead of hardcoded 2026)
CURRENT_YEAR = datetime.now().year

# Path to static files
STATIC_ROOT = os.path.join(os.path.dirname(__file__), 'static').replace('\\', '/')

# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

def safe_get(data, key, default=''):
    """Safe dictionary access with default value"""
    if data is None:
        return default
    return data.get(key, default)

def safe_split(value, separator=','):
    """Safe string split with None check"""
    if not value:
        return []
    return [item.strip() for item in value.split(separator) if item.strip()]

def get_season_info_for_fish(fish):
    """Get season information for a specific fish"""
    fish_season = safe_get(fish, 'season', '').lower()
    
    for season_key, season_data in database.seasons_data.items():
        if fish_season in season_data['name'].lower() or season_data['name'].lower() in fish_season:
            return season_data
    
    return None

def get_related_fish(current_fish, limit=3):
    """Get related fish based on location"""
    locations = safe_split(safe_get(current_fish, 'locations'))
    if not locations:
        return []
    
    related = database.get_fish_by_location(locations[0])
    # Exclude current fish from results
    return [f for f in related if f['id'] != current_fish['id']][:limit]

# ============================================================================
# MAIN PAGES
# ============================================================================

@app.route('/')
def index():
    """Home page with fish catalog"""
    try:
        fish_list = database.fish_data[:6] if database.fish_data else []
        
        return template('index', 
                       title='Главная', 
                       year=CURRENT_YEAR,
                       fish_list=fish_list,
                       statistics=database.statistics)
    except Exception as e:
        print(f"[ERROR] index: {str(e)}")
        return HTTPError(500, "Internal server error")

@app.route('/fish')
def fish_catalog():
    """Page with all fish species"""
    try:
        query = request.query.get('q', '').strip()
        
        if query:
            results = database.search_fish(query)
        else:
            results = database.fish_data
        
        return template('fish_catalog',
                       title='Поиск: ' + query if query else 'Все виды рыб',
                       year=CURRENT_YEAR,
                       fish_list=results if results else [],
                       search_query=query)
    except Exception as e:
        print(f"[ERROR] fish_catalog: {str(e)}")
        return HTTPError(500, "Internal server error")

@app.route('/fish/<name>')
def fish_detail(name):
    """Page with detailed fish information"""
    try:
        fish_name = name.replace('-', ' ').replace('_', ' ')
        fish = database.get_fish_by_name(fish_name)
        
        if not fish:
            return HTTPError(404, "Рыба не найдена")
        
        # Get season info
        season_info = get_season_info_for_fish(fish)
        
        # Get related fish
        related_fish = get_related_fish(fish)
        
        # Safe data preparation
        fish_safe = {
            'id': safe_get(fish, 'id', 0),
            'name': safe_get(fish, 'name', 'Неизвестно'),
            'latin_name': safe_get(fish, 'latin_name', ''),
            'description': safe_get(fish, 'description', ''),
            'avg_weight': safe_get(fish, 'avg_weight', ''),
            'max_weight': safe_get(fish, 'max_weight', ''),
            'season': safe_get(fish, 'season', ''),
            'best_months': safe_get(fish, 'best_months', []),
            'locations': safe_get(fish, 'locations', ''),
            'habitat': safe_get(fish, 'habitat', ''),
            'bait': safe_get(fish, 'bait', ''),
            'fishing_methods': safe_get(fish, 'fishing_methods', ''),
            'image': safe_get(fish, 'image', 'default.jpg'),
            'features': safe_get(fish, 'features', [])
        }
        
        return template('fish_detail',
                       title=fish_safe['name'],
                       year=CURRENT_YEAR,
                       fish=fish_safe,
                       season_info=season_info,
                       related_fish=related_fish)
    except Exception as e:
        print(f"[ERROR] fish_detail: {str(e)}")
        return HTTPError(500, "Internal server error")

# ============================================================================
# FISHING LOCATIONS
# ============================================================================

@app.route('/locations')
def locations_catalog():
    """Page with all fishing location types"""
    try:
        locations = database.locations_data if database.locations_data else []
        
        return template('locations',
                       title='Места ловли',
                       year=CURRENT_YEAR,
                       locations=locations)
    except Exception as e:
        print(f"[ERROR] locations_catalog: {str(e)}")
        return HTTPError(500, "Internal server error")

@app.route('/locations/<name>')
def location_detail(name):
    """Page with information about specific location"""
    try:
        location_name = name.replace('-', ' ').replace('_', ' ')
        
        location = None
        for loc in database.locations_data:
            if loc['name'].lower() == location_name.lower():
                location = loc
                break
        
        if not location:
            return HTTPError(404, "Место не найдено")
        
        fish_in_location = database.get_fish_by_location(location['name'])
        
        return template('location_detail',
                       title=location['name'],
                       year=CURRENT_YEAR,
                       location=location,
                       fish_list=fish_in_location if fish_in_location else [])
    except Exception as e:
        print(f"[ERROR] location_detail: {str(e)}")
        return HTTPError(500, "Internal server error")

# ============================================================================
# SEASONS
# ============================================================================

@app.route('/seasons')
def seasons_catalog():
    """Page with season information"""
    try:
        return template('seasons',
                       title='Сезонность',
                       year=CURRENT_YEAR,
                       seasons=database.seasons_data)
    except Exception as e:
        print(f"[ERROR] seasons_catalog: {str(e)}")
        return HTTPError(500, "Internal server error")

@app.route('/seasons/<season>')
def season_detail(season):
    """Page with detailed season information"""
    try:
        season_key = season.lower()
        
        if season_key not in database.seasons_data:
            return HTTPError(404, "Сезон не найден")
        
        season_info = database.seasons_data[season_key]
        
        # Get fish active in this season
        active_fish = []
        for fish in database.fish_data:
            if season_info['name'].lower() in fish['season'].lower():
                active_fish.append(fish)
        
        return template('season_detail',
                       title=season_info['name'],
                       year=CURRENT_YEAR,
                       season=season_info,
                       fish_list=active_fish)
    except Exception as e:
        print(f"[ERROR] season_detail: {str(e)}")
        return HTTPError(500, "Internal server error")

# ============================================================================
# SEARCH AND FILTERS
# ============================================================================

@app.route('/search')
def search():
    """Search page"""
    try:
        query = request.query.get('q', '').strip()
        fish_type = request.query.get('type', '').strip()
        location = request.query.get('location', '').strip()
        
        results = database.fish_data
        
        if query:
            results = database.search_fish(query)
        
        if location:
            results = [f for f in results if location.lower() in safe_get(f, 'locations', '').lower()]
        
        return template('search_results',
                       title='Результаты поиска',
                       year=CURRENT_YEAR,
                       fish_list=results if results else [],
                       query=query,
                       filters={'type': fish_type, 'location': location})
    except Exception as e:
        print(f"[ERROR] search: {str(e)}")
        return HTTPError(500, "Internal server error")

@app.route('/api/search')
def api_search():
    """API endpoint for search (returns JSON)"""
    try:
        query = request.query.get('q', '').strip()
        
        if not query:
            return {'error': 'Query parameter is required', 'count': 0, 'results': []}
        
        results = database.search_fish(query)
        
        simplified = [
            {
                'id': f['id'],
                'name': f['name'],
                'description': f['description'][:100] + '...' if len(f['description']) > 100 else f['description'],
                'season': f['season'],
                'image': f['image']
            }
            for f in results
        ]
        
        return {'results': simplified, 'count': len(simplified)}
    except Exception as e:
        print(f"[ERROR] api_search: {str(e)}")
        return {'error': 'Internal server error', 'count': 0, 'results': []}

# ============================================================================
# ADDITIONAL PAGES
# ============================================================================

@app.route('/about')
def about():
    """About page"""
    try:
        return template('about',
                       title='О проекте',
                       year=CURRENT_YEAR,
                       stats=database.statistics)
    except Exception as e:
        print(f"[ERROR] about: {str(e)}")
        return HTTPError(500, "Internal server error")

@app.route('/contact')
def contact():
    """Contact page"""
    try:
        return template('contact',
                       title='Контакты',
                       year=CURRENT_YEAR)
    except Exception as e:
        print(f"[ERROR] contact: {str(e)}")
        return HTTPError(500, "Internal server error")

@app.route('/tips')
def tips():
    """Tips page for beginners"""
    try:
        tips_list = [
            {
                "title": "Выбор снастей",
                "content": "Подбирайте снасти в зависимости от вида рыбы и условий ловли."
            },
            {
                "title": "Время рыбалки",
                "content": "Раннее утро и вечер — лучшее время для рыбалки."
            },
            {
                "title": "Прикормка",
                "content": "Используйте прикормку для привлечения рыбы к месту ловли."
            },
            {
                "title": "Погода",
                "content": "Давление и температура воды влияют на активность рыбы."
            }
        ]
        return template('tips',
                       title='Советы рыболовам',
                       year=CURRENT_YEAR,
                       tips=tips_list)
    except Exception as e:
        print(f"[ERROR] tips: {str(e)}")
        return HTTPError(500, "Internal server error")

# ============================================================================
# STATIC FILES
# ============================================================================

@app.route('/static/<filepath:path>')
def server_static(filepath):
    """Serve static files (CSS, JS, images)"""
    try:
        return static_file(filepath, root=STATIC_ROOT)
    except Exception as e:
        print(f"[ERROR] server_static: {str(e)}")
        return HTTPError(404, "File not found")

@app.route('/images/<filename>')
def server_images(filename):
    """Serve fish images"""
    try:
        images_root = os.path.join(STATIC_ROOT, 'images').replace('\\', '/')
        return static_file(filename, root=images_root)
    except Exception as e:
        print(f"[ERROR] server_images: {str(e)}")
        return HTTPError(404, "Image not found")

# ============================================================================
# ERROR HANDLERS
# ============================================================================

@app.error(404)
def error_404(error):
    """404 error page"""
    try:
        return template('error',
                       title='Страница не найдена',
                       year=CURRENT_YEAR,
                       error_code=404,
                       error_message='Запрошенная страница не существует')
    except Exception as e:
        print(f"[ERROR] error_404: {str(e)}")
        return '<h1>404 - Страница не найдена</h1>'

@app.error(500)
def error_500(error):
    """500 error page"""
    try:
        # Правильная проверка DEBUG_MODE
        DEBUG_MODE = getattr(bottle, 'DEBUG_MODE', False)
        
        error_detail = str(error.exception) if DEBUG_MODE else 'Внутренняя ошибка сервера'
        
        return template('error',
                       title='Ошибка сервера',
                       year=CURRENT_YEAR,
                       error_code=500,
                       error_message=error_detail)
    except Exception as e:
        print(f"[ERROR] error_500: {str(e)}")
        return '<h1>500 - Внутренняя ошибка сервера</h1>'

# ============================================================================
# HEALTH CHECK ENDPOINTS
# ============================================================================

@app.route('/health')
def health_check():
    """Health check endpoint for monitoring"""
    return {
        'status': 'healthy',
        'service': 'Fishing Encyclopedia',
        'version': '1.0.0',
        'timestamp': datetime.now().isoformat()
    }

@app.route('/api/status')
def api_status():
    """API endpoint for application status"""
    try:
        return {
            'status': 'online',
            'database': {
                'fish_species': len(database.fish_data) if database.fish_data else 0,
                'locations': len(database.locations_data) if database.locations_data else 0,
                'seasons': len(database.seasons_data) if database.seasons_data else 0
            },
            'server': {
                'python_version': '3.x',
                'timestamp': datetime.now().isoformat()
            }
        }
    except Exception as e:
        return {
            'status': 'error',
            'message': str(e)
        }

# ============================================================================
# RUN APPLICATION (for direct execution)
# ============================================================================

if __name__ == '__main__':
    print("=" * 60)
    print("Fishing Encyclopedia - Starting Server")
    print("=" * 60)
    print(f"Year: {CURRENT_YEAR}")
    print(f"Fish species: {len(database.fish_data)}")
    print(f"Locations: {len(database.locations_data)}")
    print(f"Seasons: {len(database.seasons_data)}")
    print("=" * 60)
    
>>>>>>> dc2b27a9e9c4267acd5b17ab66fba0ddcd8ebb7a
    app.run(host='localhost', port=8080, debug=True, reloader=True)