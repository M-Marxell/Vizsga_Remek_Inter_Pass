// Kosár adatok 
let kosar = JSON.parse(localStorage.getItem('kosar') || localStorage.getItem('cart')) || [];

// Kosár megjelenítése
function megjelenitKosarat() {
    const kosarElem = document.getElementById('cart-items');
    if (!kosarElem) return;
    kosarElem.innerHTML = '';

    kosar.forEach(tetel => {
        const itemDiv = document.createElement('div');
        itemDiv.className = 'cart-item';
        itemDiv.innerHTML = `
            <div class="item-details">
                <h3>${esemeny.nev}</h3>
                <p>Ár: ${esemeny.jegy_ara} Ft</p>
            </div>
            <div class="quantity-controls">
                <button onclick="valtoztatMennyiseget(${tetel.id}, -1)">-</button>
                <span>${esemeny.quantity}</span>
                <button onclick="valtoztatMennyiseget(${tetel.id}, 1)">+</button>
            </div>
            <div class="item-total">${esemeny.jegy_ara * esemeny.quantity} Ft</div>
            <button class="remove-btn" onclick="torolTermeket(${esemeny.id})">Törlés</button>
        `;
        kosarElem.appendChild(itemDiv);
    });

    frissitOsszesen();
}

// Termék hozzáadása a kosárhoz
function hozzaadKosarhoz(id, name, price) {
    const letezoTetel = kosar.find(tetel => tetel.id === id);
    if (letezoTetel) {
        letezoTetel.quantity += 1;
    } else {
        kosar.push({ id, name, price, quantity: 1 });
    }
    mentesKosar();
    megjelenitKosarat();
}

// Mennyiség változtatása
function valtoztatMennyiseget(id, delta) {
    const tetel = kosar.find(tetel => tetel.id === id);
    if (tetel) {
        tetel.quantity += delta;
        if (tetel.quantity <= 0) {
            torolTermeket(id);
        } else {
            mentesKosar();
            megjelenitKosarat();
        }
    }
}

// Termék törlése
function termekTorles(id) {
    kosar = kosar.filter(tetel => tetel.id !== id);
    mentesKosar();
    megjelenitKosarat();
}

// mentés localStorage-ba
function mentesKosar() {
    localStorage.setItem('kosar', JSON.stringify(kosar));
}

// Összeg frissítése
function frissitOsszesen() {
    const totalElement = document.getElementById('total-price');
    if (!totalElement) return;
    const total = kosar.reduce((sum, tetel) => sum + tetel.price * tetel.quantity, 0);
    totalElement.textContent = total;
}

// Inicializálás
document.addEventListener('DOMContentLoaded', () => {
    megjelenitKosarat();

    // Esemény delegálás a dinamikusan létrehozott .btn_cart elemekhez
    document.body.addEventListener('click', (event) => {
        const btn = event.target.closest('.btn_cart');
        if (!btn) return;

        const id = parseInt(btn.dataset.id);
        const name = btn.dataset.name;
        const price = parseInt(btn.dataset.price);
        if (!isNaN(id) && name && !isNaN(price)) {
            hozzaadKosarhoz(id, name, price);
            alert('Termék hozzáadva a kosárhoz!');
        }
    });
});
