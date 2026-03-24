const container = document.getElementById('cardContainer');

// Itt tároljuk le a szervertől kapott összes eseményt
let allEvents = [];

// DOM elemek lekérése a szűrőkhöz
const searchInput = document.getElementById('searchInput');
const typeFilter = document.getElementById('typeFilter');
const ageFilter = document.getElementById('ageFilter'); 
const priceFilter = document.getElementById('priceFilter');
const dateFilter = document.getElementById('dateFilter');
const locationFilter = document.getElementById('locationFilter');

// Eseményfigyelők hozzáadása (ha valami változik, lefut a szűrés)
searchInput.addEventListener('input', filterEvents);
typeFilter.addEventListener('change', filterEvents);
ageFilter.addEventListener('change', filterEvents); 
priceFilter.addEventListener('input', filterEvents);
dateFilter.addEventListener('change', filterEvents);
locationFilter.addEventListener('input', filterEvents);

async function loadData() {
    try {
        const response = await fetch('api.php');
        allEvents = await response.json(); 
        
        // Alapértelmezésként az összes eseményt kirajzoljuk
        renderCards(allEvents); 
    } catch (error) {
        console.error('Hiba:', error);
        container.innerHTML = '<p>Hiba történt az adatok betöltésekor.</p>';
    }
}

// Függvény a kártyák kirajzolására (kap egy tömböt, és azt jeleníti meg)
function renderCards(data) {
    container.innerHTML = '';

    if (data.length === 0) {
        container.innerHTML = '<p>Nincs a keresésnek/szűrőknek megfelelő esemény.</p>';
        return;
    }

    data.forEach(esemeny => {
        const card = document.createElement('div');
        card.className = 'card';

        const kepSzotar = {
            'Sport': 'sport.png',
            'Színház': 'szinhaz.png',
            'Egyéb': 'egyeb.png',
            'Mozi': 'mozi.png',
            'Koncert': 'koncert.png',
            'Fesztivál': 'fesztival.png',
            'Rendezvények': 'rendezveny.png'
        };

        const fajlNev = kepSzotar[esemeny.tipus] || 'egyeb.jpg';
        const kepUtvonal = `esemenyKepek/${fajlNev}`;

        card.innerHTML = `
            <img src="${kepUtvonal}" alt="${esemeny.nev}" class="card-image">
            
            <div class="card-title-bar">
                <h2>${esemeny.nev}</h2>
            </div>
            
            <div class="card-details">
                <h3>${esemeny.nev}</h3>
                <p><strong>Típus:</strong> ${esemeny.tipus}</p>
                <p><strong>Helyszín:</strong> ${esemeny.hely}</p>
                <p><strong>Korhatár:</strong> ${esemeny.korhatar}</p>
                <p><strong>Időpont:</strong> ${esemeny.idopont}</p>
                <p style="margin-top: 15px;">${esemeny.rovid_leiras}</p>            
                <div class="price-tag">${esemeny.jegy_ara} Ft</div>
            </div>
        `;

        container.appendChild(card);
    });
}

// Függvény az adatok szűrésére
function filterEvents() {
    // Kiolvassuk a mezők aktuális értékét
    const searchText = searchInput.value.toLowerCase();
    const selectedType = typeFilter.value;
    const selectedAge = ageFilter.value; 
    const maxPrice = priceFilter.value ? parseInt(priceFilter.value) : Infinity;
    const selectedDate = dateFilter.value; // Formátum: YYYY-MM-DD
    const searchLocation = locationFilter.value.toLowerCase();

    // Végigmegyünk az összes eseményen, és megnézzük, megfelel-e a feltételeknek
    const filteredEvents = allEvents.filter(esemeny => {
        // Név ellenőrzése (ha üres a kereső, mindenre igaz)
        const matchName = esemeny.nev.toLowerCase().includes(searchText);
        
        // Típus ellenőrzése
        const matchType = selectedType === "" || esemeny.tipus === selectedType;

        //Korhatár ellenőrzés
        const matchAge = selectedAge === "" || esemeny.korhatar === selectedAge;
        
        // Ár ellenőrzése (ügyelve arra, hogy a jegy_ara lehet string is)
        const matchPrice = parseInt(esemeny.jegy_ara) <= maxPrice;
        
        // Dátum ellenőrzése (a te adatbázisodban az idopont 'YYYY-MM-DD HH:MM:SS', ezért a startsWith tökéletes ide)
        const matchDate = selectedDate === "" || esemeny.idopont.startsWith(selectedDate);
        
        // Helyszín ellenőrzése
        const matchLocation = esemeny.hely.toLowerCase().includes(searchLocation);

        // Csak akkor marad a listában, ha MINDEN feltételnek megfelel
        return matchName && matchType && matchAge && matchPrice && matchDate && matchLocation;
    });

    renderCards(filteredEvents);
}

loadData();