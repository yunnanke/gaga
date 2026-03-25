% rebase('layout.tpl', title='Места ловли', year=year)

<!-- Hero Section -->
<section class="hero-section" style="min-height: 400px; margin-bottom: 2rem;">
    <div class="hero-content">
        <h1 class="hero-title">Места для рыбалки</h1>
        <p class="hero-subtitle">Выберите идеальное место для вашей следующей рыбалки</p>
    </div>
</section>

<!-- Main Content -->
<div class="container">
    <!-- Breadcrumbs -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb" style="background-color: transparent; padding: 0;">
            <li class="breadcrumb-item"><a href="/" style="color: var(--text-muted);">Главная</a></li>
            <li class="breadcrumb-item active" aria-current="page" style="color: var(--accent-gold);">Места ловли</li>
        </ol>
    </nav>
    
    <!-- Page Description -->
    <div class="text-center mb-5">
        <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto; color: var(--text-muted);">
            От правильного выбора места зависит успех рыбалки. 
            Изучите характеристики различных водоёмов и выберите подходящий вариант.
        </p>
    </div>
    
    <!-- Locations Grid -->
    <div class="row g-4">
        % for location in locations:
        <div class="col-md-6 col-lg-4">
            <div class="card h-100">
                <div class="card-img-wrapper" style="height: 220px; background: linear-gradient(135deg, var(--primary-green) 0%, var(--bg-card) 100%); display: flex; align-items: center; justify-content: center;">
                    <i class="fas fa-map-marked-alt" style="font-size: 4rem; color: var(--accent-gold); opacity: 0.5;"></i>
                </div>
                <div class="card-body">
                    <h3 class="card-title">{{location['name']}}</h3>
                    <p class="card-text">{{location['description']}}</p>
                    
                    <!-- Fish Types -->
                    <div class="mb-3">
                        <small style="color: var(--text-muted); display: block; margin-bottom: 8px;">
                            <i class="fas fa-fish"></i> Водится:
                        </small>
                        <div class="d-flex flex-wrap gap-2">
                            % for fish_name in location['fish_types'][:4]:
                            <span class="badge" style="background-color: rgba(45, 80, 22, 0.3); color: var(--text-main); padding: 4px 10px; border-radius: 20px; font-size: 0.8rem;">
                                {{fish_name}}
                            </span>
                            % end
                            % if len(location['fish_types']) > 4:
                            <span class="badge" style="background-color: rgba(197, 160, 89, 0.3); color: var(--accent-gold); padding: 4px 10px; border-radius: 20px; font-size: 0.8rem;">
                                +{{len(location['fish_types']) - 4}}
                            </span>
                            % end
                        </div>
                    </div>
                    
                    <!-- Season Info -->
                    <div class="mb-3">
                        <small style="color: var(--text-muted);">
                            <i class="fas fa-calendar-alt"></i> 
                            Лучший сезон: <span style="color: var(--accent-gold);">{{location['best_season']}}</span>
                        </small>
                    </div>
                    
                    <!-- Tips Preview -->
                    <div class="mb-3">
                        <small style="color: var(--text-muted); display: block; margin-bottom: 8px;">
                            <i class="fas fa-lightbulb"></i> Советы:
                        </small>
                        <ul style="padding-left: 0; margin: 0;">
                            % for tip in location['tips'][:2]:
                            <li style="font-size: 0.85rem; color: var(--text-muted); margin-bottom: 5px; padding-left: 20px; position: relative;">
                                <span style="position: absolute; left: 0; color: var(--accent-gold);">•</span>
                                {{tip[:60]}}...
                            </li>
                            % end
                        </ul>
                    </div>
                </div>
                <div class="card-footer" style="background-color: transparent; border-top: 1px solid var(--border-color);">
                    <a href="/locations/{{location['name'].replace(' ', '-')}}" class="btn btn-primary btn-sm" style="flex: 1;">
                        Подробнее <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </div>
            </div>
        </div>
        % end
    </div>
    
    <!-- Additional Info Section -->
    <section class="section" style="margin-top: 4rem;">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <div class="card" style="background: linear-gradient(135deg, rgba(45, 80, 22, 0.1) 0%, rgba(30, 30, 30, 0.8) 100%); border: 1px solid var(--primary-green);">
                    <div class="card-body p-5">
                        <h2 class="text-center mb-4">Как выбрать место для рыбалки?</h2>
                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="d-flex align-items-start mb-3">
                                    <div style="background-color: var(--primary-green); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; flex-shrink: 0; margin-right: 15px;">
                                        <i class="fas fa-1" style="color: white;"></i>
                                    </div>
                                    <div>
                                        <h4 style="font-size: 1.1rem; margin-bottom: 5px;">Определите цель</h4>
                                        <p style="font-size: 0.9rem; margin: 0;">Какую рыбу хотите поймать? От этого зависит тип водоёма.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex align-items-start mb-3">
                                    <div style="background-color: var(--primary-green); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; flex-shrink: 0; margin-right: 15px;">
                                        <i class="fas fa-2" style="color: white;"></i>
                                    </div>
                                    <div>
                                        <h4 style="font-size: 1.1rem; margin-bottom: 5px;">Учитывайте сезон</h4>
                                        <p style="font-size: 0.9rem; margin: 0;">Разная рыба активна в разное время года.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex align-items-start mb-3">
                                    <div style="background-color: var(--primary-green); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; flex-shrink: 0; margin-right: 15px;">
                                        <i class="fas fa-3" style="color: white;"></i>
                                    </div>
                                    <div>
                                        <h4 style="font-size: 1.1rem; margin-bottom: 5px;">Изучите рельеф</h4>
                                        <p style="font-size: 0.9rem; margin: 0;">Ямы, бровки, заросли — места стоянки рыбы.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex align-items-start mb-3">
                                    <div style="background-color: var(--primary-green); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; flex-shrink: 0; margin-right: 15px;">
                                        <i class="fas fa-4" style="color: white;"></i>
                                    </div>
                                    <div>
                                        <h4 style="font-size: 1.1rem; margin-bottom: 5px;">Подготовьте снасти</h4>
                                        <p style="font-size: 0.9rem; margin: 0;">Подберите правильные снасти под условия ловли.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Quick Stats -->
    <div class="row text-center mt-5 mb-5">
        <div class="col-md-4 mb-3">
            <div style="padding: 2rem; background-color: var(--bg-card); border-radius: var(--border-radius); border: 1px solid var(--border-color);">
                <i class="fas fa-map-marked-alt" style="font-size: 2.5rem; color: var(--accent-gold); margin-bottom: 1rem;"></i>
                <h3 style="margin: 0; color: var(--text-main);">{{len(locations)}}</h3>
                <p style="margin: 0; color: var(--text-muted); font-size: 0.9rem;">Типов водоёмов</p>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div style="padding: 2rem; background-color: var(--bg-card); border-radius: var(--border-radius); border: 1px solid var(--border-color);">
                <i class="fas fa-fish" style="font-size: 2.5rem; color: var(--accent-gold); margin-bottom: 1rem;"></i>
                <h3 style="margin: 0; color: var(--text-main);">
                    % total_fish = sum(len(loc['fish_types']) for loc in locations)
                    {{total_fish}}
                </h3>
                <p style="margin: 0; color: var(--text-muted); font-size: 0.9rem;">Видов рыб</p>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div style="padding: 2rem; background-color: var(--bg-card); border-radius: var(--border-radius); border: 1px solid var(--border-color);">
                <i class="fas fa-lightbulb" style="font-size: 2.5rem; color: var(--accent-gold); margin-bottom: 1rem;"></i>
                <h3 style="margin: 0; color: var(--text-main);">
                    % total_tips = sum(len(loc['tips']) for loc in locations)
                    {{total_tips}}
                </h3>
                <p style="margin: 0; color: var(--text-muted); font-size: 0.9rem;">Советов</p>
            </div>
        </div>
    </div>
</div>


% define('extra_scripts', '''
<script>
    // Animation on scroll for location cards
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
    });
</script>
''')
