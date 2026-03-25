let map = L.map('map').setView([59.9343, 30.3351], 10);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

let modal = document.getElementById("spotModal");
let closeBtn = document.querySelector(".close");

closeBtn.onclick = () => modal.style.display = "none";

let currentCoords = null;


// загрузка точек
fetch("/api/spots")
    .then(res => res.json())
    .then(data => {
        data.forEach(addMarker);
    });


function addMarker(spot) {
    L.marker([spot.lat, spot.lng])
        .addTo(map)
        .bindPopup(`
        <b>${spot.fish}</b><br>
        ${spot.lat}, ${spot.lng}<br>
        ${spot.comment}
    `);
}


// клик по карте
map.on("click", function (e) {

    currentCoords = e.latlng;

    document.getElementById("lat").value = currentCoords.lat;
    document.getElementById("lng").value = currentCoords.lng;

    modal.style.display = "block";
});


// отправка
document.getElementById("spotForm").addEventListener("submit", function (e) {

    e.preventDefault();

    let data = {
        fish: document.getElementById("fishType").value,
        comment: document.getElementById("comment").value,
        lat: parseFloat(document.getElementById("lat").value),
        lng: parseFloat(document.getElementById("lng").value)
    };

    fetch("/api/spots", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
    })
        .then(() => {
            addMarker(data);
            modal.style.display = "none";
        });

});