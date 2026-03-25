# -*- coding: utf-8 -*-
"""Fishing Encyclopedia - Application Entry Point"""

from bottle import Bottle, run
import routes

app = Bottle()

app.merge(routes.app) 

# ============================================================================
# RUN APPLICATION
# ============================================================================

if __name__ == '__main__':
    print("🎣 Fishing Encyclopedia SPA starting...")
    print(f"📁 Project: {routes.BASE_DIR if hasattr(routes, 'BASE_DIR') else '.'}")
    print("🌐 Open: http://localhost:8080")
    print("=" * 60)
    
    run(
        app=app,
        host='0.0.0.0',
        port=8080,
        debug=True,
        reloader=True
    )