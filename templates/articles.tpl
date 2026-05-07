<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{title}}</title>
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/style_art.css">
</head>
<body>

    <header class="header">
        <div class="container">
            <a href="/" class="logo">🎣 Помощник рыбака</a>
            <nav class="nav">
                <a href="#featured" class="nav-link">Подборка</a>
                <a href="#guides" class="nav-link">Практика</a>
                <a href="#tips" class="nav-link">Подсказки</a>
                <a href="/" class="nav-home">На главную</a>
            </nav>
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="Поиск рыбы..." autocomplete="off">
                <div id="searchResults" class="search-results"></div>
            </div>
        </div>
    </header>

    <main class="main">
        <div class="container">
            <section class="articles-hero">
                <div class="hero-panel">
                    <div class="hero-copy">
                        <span class="hero-kicker">База знаний рыбака</span>
                        <h1 class="hero-title">Полезные статьи для выезда, сезона и стабильного клева</h1>
                        <p class="hero-text">
                            Здесь собраны материалы, которые реально помогают на воде: как подобрать снасть под условия,
                            читать поведение рыбы по сезону, не терять время на пустых точках и безопасно планировать рыбалку.
                        </p>
                        <div class="hero-points">
                            <div class="hero-point">
                                <strong>Сезонность</strong>
                                <span>Когда рыба активна и как перестраивать тактику по температуре воды.</span>
                            </div>
                            <div class="hero-point">
                                <strong>Снасти</strong>
                                <span>Что взять с берега, на лодку, на фидер, спиннинг или поплавок.</span>
                            </div>
                            <div class="hero-point">
                                <strong>Практика</strong>
                                <span>Короткие прикладные советы без лишней теории и абстрактных схем.</span>
                            </div>
                        </div>
                    </div>

                    <article class="hero-feature">
                        <div>
                            <div class="article-meta">
                                <span class="meta-chip">Стартовая статья</span>
                                <span class="meta-chip">Для всех уровней</span>
                            </div>
                            <div class="hero-feature-image">
                                <img src="/static/images/река.png" alt="Рыбалка на реке" onerror="this.src='/static/images/озеро.png'">
                            </div>
                            <h2>Как выбрать место ловли на незнакомом водоеме</h2>
                            <p>
                                Разбор берегового рельефа, течения, глубины, ветра и точек стоянки рыбы.
                                Хорошая отправная статья перед любой поездкой.
                            </p>
                        </div>
                        <span class="card-tag">Чтение: 8 минут</span>
                    </article>
                </div>
            </section>

            <section id="featured" class="section">
                <h2 class="section-title">Подборка статей</h2>
                <div class="cards-grid articles-grid">
                    <article class="card fade-in">
                        <div class="card-image">
                            <img src="/static/images/река.png" alt="Выбор места на реке" onerror="this.src='/static/images/озеро.png'">
                        </div>
                        <div class="card-body article-body">
                            <div class="article-meta">
                                <span class="meta-chip">Тактика</span>
                                <span class="meta-chip">Береговая ловля</span>
                            </div>
                            <h3 class="card-title">Как выбрать перспективную точку на реке</h3>
                            <p class="card-text">
                                На что смотреть в первую очередь: свалы, обратки, границы струи, нависающие кусты и участки с разной скоростью течения.
                            </p>
                            <ul class="article-list">
                                <li>Как читать воду без эхолота.</li>
                                <li>Где искать хищника и белую рыбу.</li>
                                <li>Когда точку стоит менять сразу.</li>
                            </ul>
                            <div class="article-footer">
                                <span class="card-tag">7 минут</span>
                                <span class="article-link">Практический гид</span>
                            </div>
                        </div>
                    </article>

                    <article class="card fade-in">
                        <div class="card-image">
                            <img src="/static/images/лето.png" alt="Летняя рыбалка" onerror="this.src='/static/images/весна.png'">
                        </div>
                        <div class="card-body article-body">
                            <div class="article-meta">
                                <span class="meta-chip">Сезонность</span>
                                <span class="meta-chip">Лето</span>
                            </div>
                            <h3 class="card-title">Летняя рыбалка: как искать рыбу в жару</h3>
                            <p class="card-text">
                                Почему активность смещается на утро и вечер, как работает тень, глубина и аэрация, и какие приманки лучше оставить в коробке.
                            </p>
                            <ul class="article-list">
                                <li>Перспективные часы клева.</li>
                                <li>Тактика для перегретой воды.</li>
                                <li>Ошибки на мелководье.</li>
                            </ul>
                            <div class="article-footer">
                                <span class="card-tag">6 минут</span>
                                <span class="article-link">Сезонный разбор</span>
                            </div>
                        </div>
                    </article>

                    <article class="card fade-in">
                        <div class="card-image">
                            <img src="/static/images/щука.png" alt="Снасти для щуки и окуня" onerror="this.src='/static/images/окунь.png'">
                        </div>
                        <div class="card-body article-body">
                            <div class="article-meta">
                                <span class="meta-chip">Снасти</span>
                                <span class="meta-chip">Спиннинг</span>
                            </div>
                            <h3 class="card-title">Базовый набор спиннингиста без лишних покупок</h3>
                            <p class="card-text">
                                Как собрать рабочий комплект под щуку, окуня и судака: удилище, катушка, шнур, поводки и минимальный набор приманок.
                            </p>
                            <ul class="article-list">
                                <li>Что брать новичку в первую очередь.</li>
                                <li>Где можно не переплачивать.</li>
                                <li>Какие тесты и длины универсальнее.</li>
                            </ul>
                            <div class="article-footer">
                                <span class="card-tag">9 минут</span>
                                <span class="article-link">Подбор снастей</span>
                            </div>
                        </div>
                    </article>

                    <article class="card fade-in">
                        <div class="card-image">
                            <img src="/static/images/карась.png" alt="Насадки для мирной рыбы" onerror="this.src='/static/images/карп.png'">
                        </div>
                        <div class="card-body article-body">
                            <div class="article-meta">
                                <span class="meta-chip">Насадки</span>
                                <span class="meta-chip">Мирная рыба</span>
                            </div>
                            <h3 class="card-title">Какие наживки и прикорм работают в разное время года</h3>
                            <p class="card-text">
                                Подбор насадки под холодную и теплую воду, изменение ароматики и частые ошибки при стартовом закорме.
                            </p>
                            <ul class="article-list">
                                <li>Мотыль, опарыш, кукуруза и тесто.</li>
                                <li>Когда уменьшать кормовое пятно.</li>
                                <li>Как не перекормить точку.</li>
                            </ul>
                            <div class="article-footer">
                                <span class="card-tag">8 минут</span>
                                <span class="article-link">По прикормке</span>
                            </div>
                        </div>
                    </article>

                    <article class="card fade-in">
                        <div class="card-image">
                            <img src="/static/images/осень.png" alt="Осенняя рыбалка" onerror="this.src='/static/images/зима.png'">
                        </div>
                        <div class="card-body article-body">
                            <div class="article-meta">
                                <span class="meta-chip">Сезонность</span>
                                <span class="meta-chip">Осень</span>
                            </div>
                            <h3 class="card-title">Осенний хищник: где искать щуку, судака и окуня</h3>
                            <p class="card-text">
                                Как меняются стоянки рыбы при остывании воды, почему работают бровки и как подбирать темп проводки.
                            </p>
                            <ul class="article-list">
                                <li>Приоритетные глубины.</li>
                                <li>Паузы и ступенька в холодной воде.</li>
                                <li>Когда крупная приманка оправдана.</li>
                            </ul>
                            <div class="article-footer">
                                <span class="card-tag">7 минут</span>
                                <span class="article-link">Для хищника</span>
                            </div>
                        </div>
                    </article>

                    <article class="card fade-in">
                        <div class="card-image">
                            <img src="/static/images/озеро.png" alt="Безопасность на рыбалке" onerror="this.src='/static/images/река.png'">
                        </div>
                        <div class="card-body article-body">
                            <div class="article-meta">
                                <span class="meta-chip">Безопасность</span>
                                <span class="meta-chip">Выезд</span>
                            </div>
                            <h3 class="card-title">Что проверить перед выездом на водоем</h3>
                            <p class="card-text">
                                Набор обязательных действий перед дорогой: прогноз, ветер, подход к берегу, связь, аптечка, фонарь и запасной комплект одежды.
                            </p>
                            <ul class="article-list">
                                <li>Минимум, который нельзя игнорировать.</li>
                                <li>Риски весной и поздней осенью.</li>
                                <li>Порядок подготовки на один день.</li>
                            </ul>
                            <div class="article-footer">
                                <span class="card-tag">5 минут</span>
                                <span class="article-link">Чек-лист</span>
                            </div>
                        </div>
                    </article>
                </div>
            </section>

            <section id="guides" class="section">
                <h2 class="section-title">Короткие практические заметки</h2>
                <div class="insight-grid">
                    <article class="insight-card">
                        <h3>Как читать погоду перед рыбалкой</h3>
                        <p>
                            Давление само по себе не работает в отрыве от ветра, облачности и резкости перемен.
                            Самые стабильные выезды чаще получаются при плавной смене условий, а не после резких скачков.
                        </p>
                    </article>
                    <article class="insight-card">
                        <h3>Когда стоит уменьшать размер приманки</h3>
                        <p>
                            Если есть выходы, тычки или сопровождения без атаки, сначала упрощают подачу:
                            меньший размер, более длинная пауза, тоньше поводок и спокойнее анимация.
                        </p>
                    </article>
                    <article class="insight-card">
                        <h3>Почему одна точка перестает работать</h3>
                        <p>
                            Причина часто не в отсутствии рыбы, а в шуме, перекорме, изменении света или уровня воды.
                            Полезно иметь рядом 2-3 запасных рубежа и переходить между ними без затяжных ожиданий.
                        </p>
                    </article>
                </div>
            </section>

            <section id="tips" class="section">
                <h2 class="section-title">Что читать в первую очередь</h2>
                <div class="cards-grid articles-grid">
                    <article class="card fade-in">
                        <div class="card-body article-body">
                            <div class="article-meta">
                                <span class="meta-chip">Новичкам</span>
                            </div>
                            <h3 class="card-title">1. Подбор точки</h3>
                            <p class="card-text">
                                Если место выбрано слабо, даже хорошая снасть не спасет. Начинать лучше с понимания рельефа, течения и кормовой базы.
                            </p>
                        </div>
                    </article>
                    <article class="card fade-in">
                        <div class="card-body article-body">
                            <div class="article-meta">
                                <span class="meta-chip">После этого</span>
                            </div>
                            <h3 class="card-title">2. Сезон и время суток</h3>
                            <p class="card-text">
                                Вторая по важности тема: когда рыба смещается на глубину, выходит на мель, активна в сумерках или в пасмурную погоду.
                            </p>
                        </div>
                    </article>
                    <article class="card fade-in">
                        <div class="card-body article-body">
                            <div class="article-meta">
                                <span class="meta-chip">Закрепление</span>
                            </div>
                            <h3 class="card-title">3. Снасти и насадки</h3>
                            <p class="card-text">
                                И только затем имеет смысл детально подбирать оснастку, подачу приманки и прикорм под конкретную рыбу и водоем.
                            </p>
                        </div>
                    </article>
                </div>
            </section>
        </div>
    </main>

    <div id="modal" class="modal" role="dialog" aria-hidden="true">
        <div class="modal-overlay" data-close></div>
        <div class="modal-content">
            <button class="modal-close" data-close>&times;</button>
            <div id="modalBody" class="modal-body"></div>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p>&copy; <span id="year"></span> Помощник рыбака</p>
        </div>
    </footer>

    <script>
        window.APP_DATA = window.APP_DATA || { fish: [], locations: [], seasons: {} };
    </script>
    <script src="/static/js/main.js"></script>
</body>
</html>
