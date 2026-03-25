% rebase('layout.tpl', title=fish['name'], year=year)

<!-- Hero Section -->
<section class="hero-section" style="min-height: 500px; margin-bottom: 0; position: relative; overflow: hidden;">
    <!-- Background Image with Overlay -->
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, var(--bg-dark) 100%), url('/static/images/{{fish['image']}}') center/cover no-repeat; z-index: 1;"></div>
    
    <div class="hero-content" style="position: relative; z-index: 2; padding-top: 4rem;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <span class="badge" style="background-color: var(--accent-gold); color: var(--bg-dark); padding: 8px 16px; border-radius: 20px; font-size: 0.9rem; font-weight: 600; margin-bottom: 1rem; display: inline-block;">
                        <i class="fas fa-fish me-2"></i>{{fish['latin_name']}}
                    </span>
                    <h1 class="hero-title" style="text-align: left; margin-bottom: 1rem; font-size: 4.5rem; text-shadow: 3px 3px 15px rgba(0,0,0,0.8);">
                        {{fish['name']}}
                    </h1>
                    <p class="hero-subtitle" style="text-align: left; font-size: 1.3rem; max-width: 600px; text-shadow: 2px 2px 10px rgba(0,0,0,0.8);">
                        {{fish['description']}}
                    </p>
                    
                    <!-- Quick Stats in Hero -->
                    <div class="d-flex flex-wrap gap-3 mt-4">
                        <div style="background-color: rgba(30, 30, 30, 0.8); backdrop-filter: blur(10px); padding: 1rem 1.5rem; border-radius: var(--border-radius); border: 1px solid var(--border-color);">
                            <i class="fas fa-weight-hanging" style="color: var(--accent-gold); margin-right: 8px;"></i>
                            <span style="color: var(--text-main); font-weight: 600;">{{fish['avg_weight']}}</span>
                            <small style="color: var(--text-muted); display: block; font-size: 0.8rem;">Средний вес</small>
                        </div>
                        <div style="background-color: rgba(30, 30, 30, 0.8); backdrop-filter: blur(10px); padding: 1rem 1.5rem; border-radius: var(--border-radius); border: 1px solid var(--border-color);">
                            <i class="fas fa-crown" style="color: var(--accent-gold); margin-right: 8px;"></i>
                            <span style="color: var(--text-main); font-weight: 600;">{{fish['max_weight']}}</span>
                            <small style="color: var(--text-muted); display: block; font-size: 0.8rem;">Макс. вес</small>
                        </div>
                        <div style="background-color: rgba(30, 30, 30, 0.8); backdrop-filter: blur(10px); padding: 1rem 1.5rem; border-radius: var(--border-radius); border: 1px solid var(--border-color);">
                            <i class="fas fa-calendar-alt" style="color: var(--accent-gold); margin-right: 8px;"></i>
                            <span style="color: var(--text-main); font-weight: 600;">{{fish['season']}}</span>
                            <small style="color: var(--text-muted); display: block; font-size: 0.8rem;">Сезон ловли</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Main Content -->
<div class="container" style="margin-top: -50px; position: relative; z-index: 3;">
    <!-- Breadcrumbs -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb" style="background-color: transparent; padding: 0;">
            <li class="breadcrumb-item"><a href="/" style="color: var(--text-muted);"><i class="fas fa-home"></i> Главная</a></li>
            <li class="breadcrumb-item"><a href="/fish" style="color: var(--text-muted);">Рыбы</a></li>
            <li class="breadcrumb-item active" aria-current="page" style="color: var(--accent-gold);">{{fish['name']}}</li>
        </ol>
    </nav>
    
    <div class="row g-4">
        <!-- Main Content Column -->
        <div class="col-lg-8">
            <!-- Description Card -->
            <div class="card mb-4" style="background-color: var(--bg-card); border: 1px solid var(--border-color);">
                <div class="card-header" style="background-color: transparent; border-bottom: 1px solid var(--border-color); padding: 1.5rem;">
                    <h3 style="margin: 0; color: var(--accent-gold);"><i class="fas fa-info-circle me-2"></i>Описание</h3>
                </div>
                <div class="card-body p-4">
                    <p style="font-size: 1.1rem; line-height: 1.8; color: var(--text-main);">{{fish['description']}}</p>
                    
                    <!-- Features List -->
                    % if fish.get('features'):
                    <div class="mt-4">
                        <h4 style="color: var(--text-main); font-size: 1.2rem; margin-bottom: 1rem;"><i class="fas fa-star me-2" style="color: var(--accent-gold);"></i>Особенности</h4>
                        <ul class="info-list">
                            % for feature in fish['features']:
                            <li style="padding: 10px 0; border-bottom: 1px solid var(--border-color); color: var(--text-muted);">
                                <i class="fas fa-check-circle" style="color: var(--primary-green); margin-right: 10px;"></i>
                                {{feature}}
                            </li>
                            % end
                        </ul>
                    </div>
                    % end
                </div>
            </div>
            
            <!-- Habitat & Location Card -->
            <div class="card mb-4" style="background-color: var(--bg-card); border: 1px solid var(--border-color);">
                <div class="card-header" style="background-color: transparent; border-bottom: 1px solid var(--border-color); padding: 1.5rem;">
                    <h3 style="margin: 0; color: var(--accent-gold);"><i class="fas fa-map-marker-alt me-2"></i>Места обитания</h3>
                </div>
                <div class="card-body p-4">
                    <div class="row g-4">
                        <div class="col-md-6">
                            <div style="background-color: rgba(45, 80, 22, 0.1); padding: 1.5rem; border-radius: var(--border-radius); border-left: 3px solid var(--primary-green); height: 100%;">
                                <h4 style="font-size: 1.1rem; color: var(--text-main); margin-bottom: 0.5rem;">
                                    <i class="fas fa-water me-2" style="color: var(--primary-green);"></i>Где обитает
                                </h4>
                                <p style="color: var(--text-muted); margin: 0;">{{fish['locations']}}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div style="background-color: rgba(197, 160, 89, 0.1); padding: 1.5rem; border-radius: var(--border-radius); border-left: 3px solid var(--accent-gold); height: 100%;">
                                <h4 style="font-size: 1.1rem; color: var(--text-main); margin-bottom: 0.5rem;">
                                    <i class="fas fa-binoculars me-2" style="color: var(--accent-gold);"></i>Где искать
                                </h4>
                                <p style="color: var(--text-muted); margin: 0;">{{fish['habitat']}}</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Location Links -->
                    <div class="mt-4">
                        <small style="color: var(--text-muted); display: block; margin-bottom: 10px;">Популярные места для ловли:</small>
                        <div class="d-flex flex-wrap gap-2">
                            % for loc in fish['locations'].split(','):
                            <a href="/locations" class="badge" style="background-color: var(--bg-card-hover); color: var(--text-main); padding: 8px 15px; border-radius: 20px; border: 1px solid var(--border-color); transition: all 0.3s ease;">
                                {{loc.strip()}}
                            </a>
                            % end
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Fishing Methods Card -->
            <div class="card mb-4" style="background-color: var(--bg-card); border: 1px solid var(--border-color);">
                <div class="card-header" style="background-color: transparent; border-bottom: 1px solid var(--border-color); padding: 1.5rem;">
                    <h3 style="margin: 0; color: var(--accent-gold);"><i class="fas fa-fishing-rod me-2"></i>Способы ловли</h3>
                </div>
                <div class="card-body p-4">
                    <div class="mb-4">
                        <h4 style="font-size: 1.1rem; color: var(--text-main); margin-bottom: 1rem;">
                            <i class="fas fa-tools me-2" style="color: var(--primary-green);"></i>Методы ловли
                        </h4>
                        <p style="color: var(--text-main); font-size: 1.05rem;">{{fish['fishing_methods']}}</p>
                    </div>
                    
                    <div>
                        <h4 style="font-size: 1.1rem; color: var(--text-main); margin-bottom: 1rem;">
                            <i class="fas fa-bait me-2" style="color: var(--accent-gold);"></i>На что клюёт
                        </h4>
                        <div class="d-flex flex-wrap gap-2">
                            % for bait in fish['bait'].split(','):
                            <span style="background-color: rgba(197, 160, 89, 0.15); color: var(--accent-gold); padding: 8px 15px; border-radius: 20px; border: 1px solid rgba(197, 160, 89, 0.3); font-size: 0.95rem;">
                                {{bait.strip()}}
                            </span>
                            % end
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Sidebar Column -->
        <div class="col-lg-4">
            <!-- Season Info Card -->
            % if season_info:
            <div class="card mb-4" style="background: linear-gradient(135deg, rgba(45, 80, 22, 0.2) 0%, rgba(30, 30, 30, 0.9) 100%); border: 1px solid var(--primary-green);">
                <div class="card-body p-4">
                    <h3 style="color: var(--primary-green); margin-bottom: 1rem; font-size: 1.3rem;">
                        <i class="fas fa-calendar-check me-2"></i>{{season_info['name']}}
                    </h3>
                    <p style="color: var(--text-muted); font-size: 0.95rem; margin-bottom: 1.5rem;">{{season_info['description']}}</p>
                    
                    <div style="margin-bottom: 1.5rem;">
                        <small style="color: var(--text-muted); display: block; margin-bottom: 8px;">Лучшие месяцы:</small>
                        <div class="d-flex flex-wrap gap-2">
                            % for month in season_info['months']:
                            <span style="background-color: var(--primary-green); color: white; padding: 4px 10px; border-radius: 15px; font-size: 0.8rem;">
                                {{month}}
                            </span>
                            % end
                        </div>
                    </div>
                    
                    <div>
                        <small style="color: var(--text-muted); display: block; margin-bottom: 8px;">Лучшие наживки:</small>
                        <div class="d-flex flex-wrap gap-2">
                            % for bait in season_info['best_baits'][:3]:
                            <span style="background-color: rgba(197, 160, 89, 0.2); color: var(--accent-gold); padding: 4px 10px; border-radius: 15px; font-size: 0.8rem;">
                                {{bait}}
                            </span>
                            % end
                        </div>
                    </div>
                    
                    <a href="/seasons/{{season_info['name'].lower()}}" class="btn btn-primary btn-sm" style="width: 100%; margin-top: 1.5rem;">
                        Подробнее о сезоне <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </div>
            </div>
            % end
            
            <!-- Best Months Card -->
            <div class="card mb-4" style="background-color: var(--bg-card); border: 1px solid var(--border-color);">
                <div class="card-header" style="background-color: transparent; border-bottom: 1px solid var(--border-color); padding: 1rem 1.5rem;">
                    <h4 style="margin: 0; color: var(--text-main); font-size: 1.1rem;">
                        <i class="fas fa-clock me-2" style="color: var(--accent-gold);"></i>Лучшее время
                    </h4>
                </div>
                <div class="card-body p-3">
                    <div class="d-flex flex-wrap gap-2">
                        % for month in fish['best_months']:
                        <span style="background-color: var(--bg-card-hover); color: var(--text-main); padding: 6px 12px; border-radius: 20px; border: 1px solid var(--border-color); font-size: 0.9rem;">
                            {{month}}
                        </span>
                        % end
                    </div>
                </div>
            </div>
            
            <!-- Share Card -->
            <div class="card mb-4" style="background-color: var(--bg-card); border: 1px solid var(--border-color);">
                <div class="card-body p-4 text-center">
                    <h4 style="color: var(--text-main); margin-bottom: 1rem; font-size: 1.1rem;">Поделиться</h4>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="#" style="width: 45px; height: 45px; background-color: var(--bg-card-hover); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--text-muted); transition: all 0.3s ease;">
                            <i class="fab fa-vk" style="font-size: 1.3rem;"></i>
                        </a>
                        <a href="#" style="width: 45px; height: 45px; background-color: var(--bg-card-hover); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--text-muted); transition: all 0.3s ease;">
                            <i class="fab fa-telegram" style="font-size: 1.3rem;"></i>
                        </a>
                        <a href="#" style="width: 45px; height: 45px; background-color: var(--bg-card-hover); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--text-muted); transition: all 0.3s ease;">
                            <i class="fab fa-whatsapp" style="font-size: 1.3rem;"></i>
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Quick Stats -->
            <div class="card" style="background-color: var(--bg-card); border: 1px solid var(--border-color);">
                <div class="card-body p-4">
                    <h4 style="color: var(--text-main); margin-bottom: 1.5rem; font-size: 1.1rem;">
                        <i class="fas fa-chart-bar me-2" style="color: var(--accent-gold);"></i>Статистика
                    </h4>
                    
                    <div style="margin-bottom: 1.5rem;">
                        <div class="d-flex justify-content-between mb-2">
                            <span style="color: var(--text-muted); font-size: 0.9rem;">Популярность</span>
                            <span style="color: var(--accent-gold); font-weight: 600;">85%</span>
                        </div>
                        <div style="background-color: var(--bg-card-hover); height: 8px; border-radius: 10px; overflow: hidden;">
                            <div style="background: linear-gradient(90deg, var(--primary-green) 0%, var(--accent-gold) 100%); width: 85%; height: 100%; border-radius: 10px;"></div>
                        </div>
                    </div>
                    
                    <div style="margin-bottom: 1.5rem;">
                        <div class="d-flex justify-content-between mb-2">
                            <span style="color: var(--text-muted); font-size: 0.9rem;">Сложность ловли</span>
                            <span style="color: var(--accent-gold); font-weight: 600;">60%</span>
                        </div>
                        <div style="background-color: var(--bg-card-hover); height: 8px; border-radius: 10px; overflow: hidden;">
                            <div style="background: linear-gradient(90deg, var(--accent-gold) 0%, var(--primary-green) 100%); width: 60%; height: 100%; border-radius: 10px;"></div>
                        </div>
                    </div>
                    
                    <div>
                        <div class="d-flex justify-content-between mb-2">
                            <span style="color: var(--text-muted); font-size: 0.9rem;">Гастрономическая ценность</span>
                            <span style="color: var(--accent-gold); font-weight: 600;">90%</span>
                        </div>
                        <div style="background-color: var(--bg-card-hover); height: 8px; border-radius: 10px; overflow: hidden;">
                            <div style="background: linear-gradient(90deg, var(--primary-green) 0%, var(--accent-gold) 100%); width: 90%; height: 100%; border-radius: 10px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Related Fish Section -->
    % if related_fish and len(related_fish) > 0:
    <section class="section mt-5" style="border-top: 1px solid var(--border-color); padding-top: 4rem;">
        <h2 class="section-title">Похожие виды рыб</h2>
        <div class="row g-4">
            % for related in related_fish[:3]:
            % if related['id'] != fish['id']:
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-img-wrapper" style="height: 200px; background: linear-gradient(135deg, var(--primary-green) 0%, var(--bg-card) 100%); display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-fish" style="font-size: 3rem; color: var(--accent-gold); opacity: 0.5;"></i>
                    </div>
                    <div class="card-body p-3">
                        <h4 style="font-size: 1.2rem; margin-bottom: 0.5rem; color: var(--text-main);">{{related['name']}}</h4>
                        <p style="font-size: 0.9rem; color: var(--text-muted); margin-bottom: 1rem;">{{related['description'][:80]}}...</p>
                        <a href="/fish/{{related['name'].replace(' ', '-')}}" class="btn btn-outline btn-sm" style="width: 100%;">
                            Подробнее
                        </a>
                    </div>
                </div>
            </div>
            % end
            % end
        </div>
    </section>
    % end
    
    <!-- Back to Catalog -->
    <div class="text-center mt-5 mb-5">
        <a href="/fish" class="btn btn-accent" style="padding: 1rem 3rem; font-size: 1.1rem;">
            <i class="fas fa-arrow-left me-2"></i>Вернуться к каталогу
        </a>
    </div>
</div>

<!-- Extra Scripts -->
% define('extra_scripts', '''
<script>
    // Animation on scroll
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
        
        // Share buttons functionality
        const shareButtons = document.querySelectorAll('.card-body a[href="#"]');
        shareButtons.forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                const fishName = "{{fish['name']}}";
                const url = window.location.href;
                
                if (this.querySelector('.fa-vk')) {
                    window.open(`https://vk.com/share.php?url=${encodeURIComponent(url)}&title=${encodeURIComponent(fishName)}`, '_blank');
                } else if (this.querySelector('.fa-telegram')) {
                    window.open(`https://t.me/share/url?url=${encodeURIComponent(url)}&text=${encodeURIComponent(fishName)}`, '_blank');
                } else if (this.querySelector('.fa-whatsapp')) {
                    window.open(`https://wa.me/?text=${encodeURIComponent(fishName + ' - ' + url)}`, '_blank');
                }
            });
        });
    });
</script>
''')

