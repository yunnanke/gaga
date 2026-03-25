<<<<<<< HEAD
п»ї<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<title>РљР°СЂС‚Р° РјРµСЃС‚</title>

<link rel="stylesheet" href="/static/css/style.css">

<link rel="stylesheet"
 href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>

<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

</head>

<body>

<header>
<h1>рџЋЈ РџРѕРјРѕС‰РЅРёРє СЂС‹Р±Р°РєР°</h1>
<nav>
<a href="/">РљР°СЂС‚Р°</a>
<a href="/encyclopedia">Р­РЅС†РёРєР»РѕРїРµРґРёСЏ</a>
</nav>
</header>

<div id="map"></div>

<div id="spotModal" class="modal">
<div class="modal-content">

<span class="close">&times;</span>

<h2>Р”РѕР±Р°РІРёС‚СЊ РјРµСЃС‚Рѕ</h2>

<form id="spotForm">

<select id="fishType">
<option>РћРєСѓРЅСЊ</option>
<option>Р©СѓРєР°</option>
<option>РљР°СЂРї</option>
<option>Р›РµС‰</option>
<option>РЎСѓРґР°Рє</option>
<option>РЎРѕРј</option>
</select>

<textarea id="comment" placeholder="РљРѕРјРјРµРЅС‚Р°СЂРёР№"></textarea>

<input type="number" id="lat" step="any" placeholder="РЁРёСЂРѕС‚Р°">
<input type="number" id="lng" step="any" placeholder="Р”РѕР»РіРѕС‚Р°">

<button type="submit">РЎРѕС…СЂР°РЅРёС‚СЊ</button>

</form>

</div>
</div>

<footer>В© 2026</footer>

<script src="/static/js/map.js"></script>

</body>
</html>
=======
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
>>>>>>> 74b8900e8b37a61dc69a5e7e79dd462eb6c8f789
