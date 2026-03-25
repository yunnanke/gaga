% rebase('layout.tpl', title='Сезонность', year=year)

<!-- Hero Section -->
<section class="hero-section" style="min-height: 400px; margin-bottom: 2rem;">
    <div class="hero-content">
        <h1 class="hero-title">Сезонность рыбалки</h1>
        <p class="hero-subtitle">Узнайте, когда и какую рыбу лучше ловить</p>
    </div>
</section>

<!-- Main Content -->
<div class="container">
    <!-- Breadcrumbs -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb" style="background-color: transparent; padding: 0;">
            <li class="breadcrumb-item"><a href="/" style="color: var(--text-muted);">Главная</a></li>
            <li class="breadcrumb-item active" aria-current="page" style="color: var(--accent-gold);">Сезонность</li>
        </ol>
    </nav>
    
    <!-- Page Description -->
    <div class="text-center mb-5">
        <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto; color: var(--text-muted);">
            Каждый сезон имеет свои особенности. 
            Правильный выбор времени года значительно увеличит ваши шансы на успех.
        </p>
    </div>
    
    <!-- Seasons Grid -->
    <div class="row g-4">
        <!-- Spring -->
        <div class="col-md-6 col-lg-3">
            <div class="card h-100" style="border-top: 4px solid #4CAF50;">
                <div class="card-body text-center p-4">
                    <div style="width: 80px; height: 80px; background: linear-gradient(135deg, #4CAF50 0%, #2d5016 100%); border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-seedling" style="font-size: 2.5rem; color: white;"></i>
                    </div>
                    <h3 class="card-title" style="color: #4CAF50;">{{seasons['spring']['name']}}</h3>
                    <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 1.5rem;">
                        {{', '.join(seasons['spring']['months'])}}
                    </p>
                    <p class="card-text" style="text-align: left;">{{seasons['spring']['description']}}</p>
                    
                    <!-- Active Fish -->
                    <div style="text-align: left; margin: 1.5rem 0;">
                        <small style="color: var(--text-muted); display: block; margin-bottom: 10px;">
                            <i class="fas fa-fish"></i> Активная рыба:
                        </small>
                        <div class="d-flex flex-wrap gap-2">
                            % for fish in seasons['spring']['active_fish'][:3]:
                            <span style="background-color: rgba(76, 175, 80, 0.2); color: #4CAF50; padding: 3px 8px; border-radius: 15px; font-size: 0.75rem;">
                                {{fish}}
                            </span>
                            % end
                        </div>
                    </div>
                    
                    <a href="/seasons/spring" class="btn btn-outline" style="border-color: #4CAF50; color: #4CAF50; width: 100%;">
                        Подробнее
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Summer -->
        <div class="col-md-6 col-lg-3">
            <div class="card h-100" style="border-top: 4px solid #FF9800;">
                <div class="card-body text-center p-4">
                    <div style="width: 80px; height: 80px; background: linear-gradient(135deg, #FF9800 0%, #e65100 100%); border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-sun" style="font-size: 2.5rem; color: white;"></i>
                    </div>
                    <h3 class="card-title" style="color: #FF9800;">{{seasons['summer']['name']}}</h3>
                    <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 1.5rem;">
                        {{', '.join(seasons['summer']['months'])}}
                    </p>
                    <p class="card-text" style="text-align: left;">{{seasons['summer']['description']}}</p>
                    
                    <!-- Active Fish -->
                    <div style="text-align: left; margin: 1.5rem 0;">
                        <small style="color: var(--text-muted); display: block; margin-bottom: 10px;">
                            <i class="fas fa-fish"></i> Активная рыба:
                        </small>
                        <div class="d-flex flex-wrap gap-2">
                            % for fish in seasons['summer']['active_fish'][:3]:
                            <span style="background-color: rgba(255, 152, 0, 0.2); color: #FF9800; padding: 3px 8px; border-radius: 15px; font-size: 0.75rem;">
                                {{fish}}
                            </span>
                            % end
                        </div>
                    </div>
                    
                    <a href="/seasons/summer" class="btn btn-outline" style="border-color: #FF9800; color: #FF9800; width: 100%;">
                        Подробнее
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Autumn -->
        <div class="col-md-6 col-lg-3">
            <div class="card h-100" style="border-top: 4px solid #795548;">
                <div class="card-body text-center p-4">
                    <div style="width: 80px; height: 80px; background: linear-gradient(135deg, #795548 0%, #3e2723 100%); border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-leaf" style="font-size: 2.5rem; color: white;"></i>
                    </div>
                    <h3 class="card-title" style="color: #795548;">{{seasons['autumn']['name']}}</h3>
                    <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 1.5rem;">
                        {{', '.join(seasons['autumn']['months'])}}
                    </p>
                    <p class="card-text" style="text-align: left;">{{seasons['autumn']['description']}}</p>
                    
                    <!-- Active Fish -->
                    <div style="text-align: left; margin: 1.5rem 0;">
                        <small style="color: var(--text-muted); display: block; margin-bottom: 10px;">
                            <i class="fas fa-fish"></i> Активная рыба:
                        </small>
                        <div class="d-flex flex-wrap gap-2">
                            % for fish in seasons['autumn']['active_fish'][:3]:
                            <span style="background-color: rgba(121, 85, 72, 0.2); color: #795548; padding: 3px 8px; border-radius: 15px; font-size: 0.75rem;">
                                {{fish}}
                            </span>
                            % end
                        </div>
                    </div>
                    
                    <a href="/seasons/autumn" class="btn btn-outline" style="border-color: #795548; color: #795548; width: 100%;">
                        Подробнее
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Winter -->
        <div class="col-md-6 col-lg-3">
            <div class="card h-100" style="border-top: 4px solid #03A9F4;">
                <div class="card-body text-center p-4">
                    <div style="width: 80px; height: 80px; background: linear-gradient(135deg, #03A9F4 0%, #01579b 100%); border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-snowflake" style="font-size: 2.5rem; color: white;"></i>
                    </div>
                    <h3 class="card-title" style="color: #03A9F4;">{{seasons['winter']['name']}}</h3>
                    <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 1.5rem;">
                        {{', '.join(seasons['winter']['months'])}}
                    </p>
                    <p class="card-text" style="text-align: left;">{{seasons['winter']['description']}}</p>
                    
                    <!-- Active Fish -->
                    <div style="text-align: left; margin: 1.5rem 0;">
                        <small style="color: var(--text-muted); display: block; margin-bottom: 10px;">
                            <i class="fas fa-fish"></i> Активная рыба:
                        </small>
                        <div class="d-flex flex-wrap gap-2">
                            % for fish in seasons['winter']['active_fish'][:3]:
                            <span style="background-color: rgba(3, 169, 244, 0.2); color: #03A9F4; padding: 3px 8px; border-radius: 15px; font-size: 0.75rem;">
                                {{fish}}
                            </span>
                            % end
                        </div>
                    </div>
                    
                    <a href="/seasons/winter" class="btn btn-outline" style="border-color: #03A9F4; color: #03A9F4; width: 100%;">
                        Подробнее
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Seasonal Calendar -->
    <section class="section mt-5">
        <h2 class="section-title">Календарь рыболова</h2>
        <div class="card" style="background-color: var(--bg-card); border: 1px solid var(--border-color);">
            <div class="card-body p-4">
                <div class="table-responsive">
                    <table class="table-custom" style="margin: 0;">
                        <thead>
                            <tr>
                                <th>Сезон</th>
                                <th>Месяцы</th>
                                <th>Лучшая рыба</th>
                                <th>Особенности</th>
                            </tr>
                        </thead>
                        <tbody>
                            % for season_key, season_data in seasons.items():
                            <tr>
                                <td style="font-weight: 600; color: var(--accent-gold);">
                                    % if season_key == 'spring':
                                        <i class="fas fa-seedling me-2"></i>
                                    % elif season_key == 'summer':
                                        <i class="fas fa-sun me-2"></i>
                                    % elif season_key == 'autumn':
                                        <i class="fas fa-leaf me-2"></i>
                                    % else:
                                        <i class="fas fa-snowflake me-2"></i>
                                    % end
                                    {{season_data['name']}}
                                </td>
                                <td>{{', '.join(season_data['months'])}}</td>
                                <td>
                                    % for fish in season_data['active_fish'][:3]:
                                    <span style="margin-right: 5px;">{{fish}}</span>
                                    % end
                                    % if len(season_data['active_fish']) > 3:
                                    <span style="color: var(--text-muted);">+{{len(season_data['active_fish']) - 3}}</span>
                                    % end
                                </td>
                                <td style="color: var(--text-muted); font-size: 0.9rem;">
                                    {{season_data['tips'][0][:50]}}...
                                </td>
                            </tr>
                            % end
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Tips Section -->
    <section class="section">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h2 class="text-center mb-5">Общие советы по сезонной рыбалке</h2>
                <div class="row g-4">
                    % all_tips = []
                    % for season_key, season_data in seasons.items():
                        % all_tips.append((season_data['name'], season_data['tips']))
                    % end
                    
                    % for season_name, tips in all_tips:
                    <div class="col-md-6">
                        <div class="card" style="background: linear-gradient(135deg, rgba(45, 80, 22, 0.1) 0%, rgba(30, 30, 30, 0.8) 100%);">
                            <div class="card-body p-4">
                                <h4 style="color: var(--accent-gold); margin-bottom: 1.5rem;">
                                    <i class="fas fa-calendar-check me-2"></i>{{season_name}}
                                </h4>
                                <ul class="info-list" style="margin: 0;">
                                    % for tip in tips:
                                    <li style="margin-bottom: 12px; padding-left: 25px; position: relative; color: var(--text-muted);">
                                        <span style="position: absolute; left: 0; color: var(--primary-green);">?</span>
                                        {{tip}}
                                    </li>
                                    % end
                                </ul>
                            </div>
                        </div>
                    </div>
                    % end
                </div>
            </div>
        </div>
    </section>
    
    <!-- CTA Section -->
    <div class="text-center mt-5 mb-5">
        <div class="card" style="background: linear-gradient(135deg, var(--primary-green) 0%, var(--bg-card) 100%); border: none;">
            <div class="card-body p-5">
                <h2 style="margin-bottom: 1rem;">Готовы к рыбалке?</h2>
                <p style="max-width: 600px; margin: 0 auto 2rem; color: var(--text-muted);">
                    Изучите виды рыб, выберите место и сезон — и вперёд, за трофеем!
                </p>
                <div class="d-flex gap-3 justify-content-center flex-wrap">
                    <a href="/fish" class="btn btn-accent">
                        <i class="fas fa-fish me-2"></i>Все виды рыб
                    </a>
                    <a href="/locations" class="btn btn-outline-light">
                        <i class="fas fa-map-marked-alt me-2"></i>Места ловли
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


% define('extra_scripts', '''
<script>
    // Animation on scroll for season cards
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.card');
        cards.forEach((card, index) => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            setTimeout(() => {
                card.style.transition = 'all 0.6s ease';
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, index * 100);
        });
        
        // Highlight current season (if needed)
        const currentMonth = new Date().getMonth();
        let currentSeason = '';
        if (currentMonth >= 2 && currentMonth <= 4) currentSeason = 'spring';
        else if (currentMonth >= 5 && currentMonth <= 7) currentSeason = 'summer';
        else if (currentMonth >= 8 && currentMonth <= 10) currentSeason = 'autumn';
        else currentSeason = 'winter';
        
        // Add visual indicator to current season
        const seasonCards = document.querySelectorAll('.card');
        seasonCards.forEach(card => {
            const seasonLink = card.querySelector('a[href="/seasons/' + currentSeason + '"]');
            if (seasonLink) {
                card.style.boxShadow = '0 0 30px rgba(197, 160, 89, 0.3)';
                card.style.borderColor = 'var(--accent-gold)';
            }
        });
    });
</script>
''')
