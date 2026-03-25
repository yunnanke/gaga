from bottle import Bottle, route, template, request, redirect, static_file, HTTPError
import database

app = Bottle()

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
    app.run(host='localhost', port=8080, debug=True, reloader=True)