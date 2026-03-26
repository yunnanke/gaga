/**
 * Fishing Encyclopedia - SPA Logic
 * Single page with modal popups, no page reloads
 */

document.addEventListener('DOMContentLoaded', () => {
    // Set current year
    document.getElementById('year').textContent = new Date().getFullYear();

    // Modal elements
    const modal = document.getElementById('modal');
    const modalBody = document.getElementById('modalBody');
    const closeButtons = document.querySelectorAll('[data-close]');

    // Data from server
    const data = window.APP_DATA || {};

    // ========================================================================
    // MODAL FUNCTIONS
    // ========================================================================

    function openModal(content) {
        modalBody.innerHTML = content;
        modal.classList.add('active');
        modal.setAttribute('aria-hidden', 'false');
        document.body.style.overflow = 'hidden'; // Prevent scroll
    }

    function closeModal() {
        modal.classList.remove('active');
        modal.setAttribute('aria-hidden', 'true');
        document.body.style.overflow = '';
    }

    // Close on button click or overlay click
    closeButtons.forEach(btn => {
        btn.addEventListener('click', closeModal);
    });

    // Close on Escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && modal.classList.contains('active')) {
            closeModal();
        }
    });

    // ========================================================================
    // CARD CLICK HANDLERS (open modals)
    // ========================================================================

    document.querySelectorAll('.card').forEach(card => {
        card.addEventListener('click', () => {
            const modalType = card.dataset.modal;

            if (modalType?.startsWith('fish-')) {
                const id = parseInt(modalType.split('-')[1]);
                const fish = data.fish?.find(f => f.id === id);
                if (fish) openModal(renderFishModal(fish));
            }
            else if (modalType?.startsWith('location-')) {
                const id = parseInt(modalType.split('-')[1]);
                const loc = data.locations?.find(l => l.id === id);
                if (loc) openModal(renderLocationModal(loc));
            }
            else if (modalType?.startsWith('season-')) {
                const key = modalType.split('-')[1];
                const season = data.seasons?.[key];
                if (season) openModal(renderSeasonModal(key, season));
            }
        });
    });

    // ========================================================================
    // MODAL RENDERERS
    // ========================================================================

    function renderFishModal(fish) {
        return `
            <h3>${fish.name}</h3>
            <p><em>${fish.latin_name}</em></p>
            <p>${fish.description}</p>
            
            <div class="detail-row">
                <span class="detail-label">⚖️ Вес:</span>
                <span class="detail-value">${fish.avg_weight} (макс. ${fish.max_weight})</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">📅 Сезон:</span>
                <span class="detail-value">${fish.season}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">📍 Где:</span>
                <span class="detail-value">${fish.locations}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">🏠 Среда:</span>
                <span class="detail-value">${fish.habitat}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">🎣 На что:</span>
                <span class="detail-value">${fish.bait}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">🔧 Методы:</span>
                <span class="detail-value">${fish.fishing_methods}</span>
            </div>
            
            ${fish.best_months?.length ? `
            <div style="margin-top: 1rem;">
                <strong>🗓️ Лучшие месяцы:</strong>
                <div class="badge-list">
                    ${fish.best_months.map(m => `<span class="badge">${m}</span>`).join('')}
                </div>
            </div>` : ''}
        `;
    }

    function renderLocationModal(loc) {
        return `
            <h3>${loc.name}</h3>
            <p>${loc.description}</p>
            
            <div class="detail-row">
                <span class="detail-label">🐟 Водится:</span>
                <span class="detail-value">${loc.fish_types?.join(', ') || '—'}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">📅 Лучший сезон:</span>
                <span class="detail-value">${loc.best_season}</span>
            </div>
            
            ${loc.tips?.length ? `
            <div style="margin-top: 1rem;">
                <strong>💡 Советы:</strong>
                <ul style="margin-top: 0.5rem; padding-left: 1.5rem;">
                    ${loc.tips.map(tip => `<li>${tip}</li>`).join('')}
                </ul>
            </div>` : ''}
        `;
    }

    function renderSeasonModal(key, season) {
        return `
            <h3>${season.name}</h3>
            <p>${season.description}</p>
            
            <div class="detail-row">
                <span class="detail-label">🗓️ Месяцы:</span>
                <span class="detail-value">${season.months.join(', ')}</span>
            </div>
            
            ${season.active_fish?.length ? `
            <div style="margin-top: 1rem;">
                <strong>🐟 Активная рыба:</strong>
                <div class="badge-list">
                    ${season.active_fish.map(f => `<span class="badge">${f}</span>`).join('')}
                </div>
            </div>` : ''}
            
            ${season.tips?.length ? `
            <div style="margin-top: 1rem;">
                <strong>💡 Советы:</strong>
                <ul style="margin-top: 0.5rem; padding-left: 1.5rem;">
                    ${season.tips.map(tip => `<li>${tip}</li>`).join('')}
                </ul>
            </div>` : ''}
        `;
    }

    // ========================================================================
    // SEARCH FUNCTIONALITY
    // ========================================================================

    const searchInput = document.getElementById('searchInput');
    const searchResults = document.getElementById('searchResults');

    searchInput.addEventListener('input', (e) => {
        const query = e.target.value.trim().toLowerCase();

        if (query.length < 2) {
            searchResults.classList.remove('show');
            searchResults.innerHTML = '';
            return;
        }

        const results = data.fish?.filter(f =>
            f.name.toLowerCase().includes(query) ||
            f.description.toLowerCase().includes(query)
        ) || [];

        if (results.length === 0) {
            searchResults.innerHTML = '<div class="search-result">Ничего не найдено</div>';
        } else {
            searchResults.innerHTML = results.map(fish => `
                <div class="search-result" data-fish-id="${fish.id}">
                    <strong>${fish.name}</strong><br>
                    <small style="color: var(--text-muted)">${fish.description.slice(0, 60)}...</small>
                </div>
            `).join('');
        }
        searchResults.classList.add('show');
    });

    // Handle search result click
    searchResults.addEventListener('click', (e) => {
        const result = e.target.closest('.search-result');
        if (result?.dataset.fishId) {
            const fish = data.fish.find(f => f.id == result.dataset.fishId);
            if (fish) {
                openModal(renderFishModal(fish));
                searchResults.classList.remove('show');
                searchInput.value = '';
            }
        }
    });

    // Close search results when clicking outside
    document.addEventListener('click', (e) => {
        if (!e.target.closest('.search-box')) {
            searchResults.classList.remove('show');
        }
    });

    // ========================================================================
    // SMOOTH SCROLL FOR NAV LINKS
    // ========================================================================

    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const target = document.querySelector(link.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });
});
