const container = document.getElementById('cardContainer');

// Your Ticketmaster API URL
const apiUrl = 'https://app.ticketmaster.com/discovery/v1/events.json?apikey=4dsfsf94tyghf85jdhshwge334';

async function loadData() {
    try {
        const response = await fetch(apiUrl);

        // Check if the API key is valid or if there's a server error
        if (!response.ok) {
            throw new Error(`HTTP hiba! Státusz: ${response.status}`);
        }

        const data = await response.json();

        // Clear the "Loading..." text
        container.innerHTML = '';

        // Ticketmaster stores the array of events inside data._embedded.events
        // We use optional chaining (?.) just in case the API returns an empty response
        const events = data._embedded ? data._embedded.events : [];

        if (events.length === 0) {
            container.innerHTML = '<p>No events found.</p>';
            return;
        }

        // Loop through the events and generate the cards
        events.forEach(event => {
            // 1. Get the Title
            const title = event.name || 'Unknown Event';

            // 2. Get the Image (Ticketmaster returns an array of images, we grab the first one)
            const imageUrl = (event.images && event.images.length > 0) 
                ? event.images[0].url 
                : 'https://via.placeholder.com/300x200?text=No+Image';

            // 3. Get the Description (If 'info' is missing, we use the start date as a fallback)
            let description = event.info || event.description;
            if (!description && event.dates && event.dates.start) {
                description = `Date: ${event.dates.start.localDate || 'TBA'}`;
            } else if (!description) {
                description = 'No description available.';
            }

            // Create the card element
            const card = document.createElement('div');
            card.className = 'card';

            // Inject your HTML structure with the Ticketmaster data
            card.innerHTML = `
                <img src="${imageUrl}" alt="${title}">
                <h2>${title}</h2>
                <p>${description}</p>
            `;

            // Add the card to the container
            container.appendChild(card);
        });

    } catch (error) {
        console.error('Error fetching data:', error);
        container.innerHTML = '<p>Failed to load data. Please check your API key and endpoint.</p>';
    }
}

// Run the function
loadData();