<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{title}}</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>

    <!-- Header -->
    <header class="header">
        <div class="container">
            <h1 class="logo">🎣 Энциклопедия рыбалки</h1>
            <nav class="nav">
                <a href="#fish" class="nav-link">Рыбы</a>
                <a href="#locations" class="nav-link">Места</a>
                <a href="#seasons" class="nav-link">Сезоны</a>
            </nav>
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="Поиск рыбы..." autocomplete="off">
                <div id="searchResults" class="search-results"></div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main">
        <div class="container">
            
            <!-- Fish Section -->
            <section id="fish" class="section">
                <h2 class="section-title">Виды рыб</h2>
                <div class="cards-grid">
                    % for f in fish:
                    <div class="card" data-modal="fish-{{f['id']}}">
                        <div class="card-image">
                            <img src="/static/images/{{f['image']}}" alt="{{f['name']}}" onerror="this.src='/static/images/placeholder.jpg'">
                        </div>
                        <div class="card-body">
                            <h3 class="card-title">{{f['name']}}</h3>
                            <p class="card-text">{{f['description'][:80]}}...</p>
                            <span class="card-tag">{{f['season']}}</span>
                        </div>
                    </div>
                    % end
                </div>
            </section>

            <!-- Locations Section -->
            <section id="locations" class="section">
                <h2 class="section-title">Места ловли</h2>
                <div class="cards-grid">
                    % for loc in locations:
                    <div class="card" data-modal="location-{{loc['id']}}">
                        <div class="card-image">🗺️</div>
                        <div class="card-body">
                            <h3 class="card-title">{{loc['name']}}</h3>
                            <p class="card-text">{{loc['description']}}</p>
                            <span class="card-tag">{{loc['best_season']}}</span>
                        </div>
                    </div>
                    % end
                </div>
            </section>

            <!-- Seasons Section -->
            <section id="seasons" class="section">
                <h2 class="section-title">Сезонность</h2>
                <div class="cards-grid">
                    % for key, season in seasons.items():
                    <div class="card" data-modal="season-{{key}}">
                        <div class="card-image">📅</div>
                        <div class="card-body">
                            <h3 class="card-title">{{season['name']}}</h3>
                            <p class="card-text">{{season['description'][:80]}}...</p>
                            <span class="card-tag">{{', '.join(season['months'])}}</span>
                        </div>
                    </div>
                    % end
                </div>
            </section>

        </div>
    </main>

    <!-- Modal Template (hidden by default) -->
    <div id="modal" class="modal" role="dialog" aria-hidden="true">
        <div class="modal-overlay" data-close></div>
        <div class="modal-content">
            <button class="modal-close" data-close>&times;</button>
            <div id="modalBody" class="modal-body"></div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; <span id="year"></span> Энциклопедия рыбалки</p>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="/static/js/main.js"></script>
    <script>
        // Pass data to JS
        window.APP_DATA = {
            fish: {{!json.dumps(fish, ensure_ascii=False)}},
            locations: {{!json.dumps(locations, ensure_ascii=False)}},
            seasons: {{!json.dumps(seasons, ensure_ascii=False)}}
        };
    </script>
</body>
</html>
