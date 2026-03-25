% rebase('layout.tpl', title='Главная', year=2026)

<div class="hero">
    <h1>Энциклопедия рыбалки</h1>
    <p>Узнайте, что клюёт, где и когда!</p>
</div>

<div class="fish-catalog">
    <h2>Популярная рыба</h2>
    %for fish in fish_list:
        <div class="fish-card">
            <h3>{{fish['name']}}</h3>
            <p>Сезон: {{fish['season']}}</p>
            <a href="/fish/{{fish['name']}}">Подробнее</a>
        </div>
    %end
</div>