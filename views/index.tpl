<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<title>Карта мест</title>

<link rel="stylesheet" href="/static/css/style.css">

<link rel="stylesheet"
 href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>

<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

</head>

<body>

<header>
<h1>🎣 Помощник рыбака</h1>
<nav>
<a href="/">Карта</a>
<a href="/encyclopedia">Энциклопедия</a>
</nav>
</header>

<div id="map"></div>

<div id="spotModal" class="modal">
<div class="modal-content">

<span class="close">&times;</span>

<h2>Добавить место</h2>

<form id="spotForm">

<select id="fishType">
<option>Окунь</option>
<option>Щука</option>
<option>Карп</option>
<option>Лещ</option>
<option>Судак</option>
<option>Сом</option>
</select>

<textarea id="comment" placeholder="Комментарий"></textarea>

<input type="number" id="lat" step="any" placeholder="Широта">
<input type="number" id="lng" step="any" placeholder="Долгота">

<button type="submit">Сохранить</button>

</form>

</div>
</div>

<footer>© 2026</footer>

<script src="/static/js/map.js"></script>

</body>
</html>