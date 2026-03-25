# -*- coding: utf-8 -*-
"""
Fishing Encyclopedia - Application Entry Point
"""

import bottle
import os
import sys
from datetime import datetime

# Import routes from routes module
import routes

# ============================================================================
# APPLICATION SETTINGS
# ============================================================================

PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))
STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static').replace('\\', '/')

HOST = os.environ.get('SERVER_HOST', 'localhost')
try:
    PORT = int(os.environ.get('SERVER_PORT', '5555'))
except ValueError:
    PORT = 5555

DEBUG_MODE = '--debug' in sys.argv[1:] or 'SERVER_DEBUG' in os.environ

# ============================================================================
# BOTTLE CONFIGURATION
# ============================================================================

if DEBUG_MODE:
    bottle.debug(True)
    print("[DEBUG] Debug mode enabled")

bottle.TEMPLATE_PATH.insert(0, os.path.join(PROJECT_ROOT, 'views').replace('\\', '/'))

# Get application instance from routes.py
app = routes.app

# ============================================================================
# ADDITIONAL ROUTES (Only Health Checks, Static files moved to routes.py)
# ============================================================================

@app.route('/health')
def health_check():
    return {
        'status': 'healthy',
        'service': 'Fishing Encyclopedia',
        'version': '1.0.0',
        'debug': DEBUG_MODE,
        'timestamp': datetime.now().isoformat()
    }

@app.route('/api/status')
def api_status():
    import database
    return {
        'status': 'online',
        'database': {
            'fish_species': len(database.fish_data),
            'locations': len(database.locations_data),
            'seasons': len(database.seasons_data)
        },
        'server': {
            'host': HOST,
            'port': PORT,
            'debug': DEBUG_MODE
        }
    }

# ============================================================================
# ERROR HANDLERS (Global)
# ============================================================================

@bottle.error(404)
def error_404(error):
    bottle.response.content_type = 'text/html'
    return bottle.template('error', 
                          title='Страница не найдена',
                          year=datetime.now().year,
                          error_code=404,
                          error_message='Запрошенная страница не существует.')

@bottle.error(500)
def error_500(error):
    bottle.response.content_type = 'text/html'
    error_detail = str(error.exception) if DEBUG_MODE else 'Внутренняя ошибка сервера'
    
    return bottle.template('error',
                          title='Ошибка сервера',
                          year=datetime.now().year,
                          error_code=500,
                          error_message=error_detail)

# ============================================================================
# RUN APPLICATION
# ============================================================================

if __name__ == '__main__':
    print("=" * 60)
    print("Fishing Encyclopedia - Starting Server")
    print("=" * 60)
    print(f"Project: {PROJECT_ROOT}")
    print(f"Host: {HOST}:{PORT}")
    print(f"Debug: {'ENABLED' if DEBUG_MODE else 'DISABLED'}")
    print("=" * 60)
    
    bottle.run(
        app=app,
        server='wsgiref',
        host=HOST,
        port=PORT,
        debug=DEBUG_MODE,
        reloader=DEBUG_MODE
    )