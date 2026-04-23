const API_URL = "https://restaurante2-xryd.onrender.com";

const map = document.getElementById('map');

async function fetchMesas() {
  const res = await fetch(`${API_URL}/mesas`);
  return await res.json();
}

function getColor(estado) {
  if (estado === 'Ocupada') return 'red';
  if (estado === 'Reservada') return 'blue';
  return 'green';
}

async function renderMesas() {
  const mesas = await fetchMesas();
  map.innerHTML = '';

  mesas.forEach(mesa => {
    const layout = tableLayout[mesa.numero];
    if (!layout) return;

    const div = document.createElement('div');
    div.className = 'table';
    div.style.left = layout.x + '%';
    div.style.top = layout.y + '%';
    div.style.backgroundColor = getColor(mesa.estado_calculado);
    div.innerText = mesa.numero;

    div.onclick = async () => {
      if (mesa.estado_calculado !== 'Disponible') return;

      if (confirm(`Start order for Table ${mesa.numero}?`)) {
        await fetch(`${API_URL}/checkin`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ id_mesa: mesa.id_mesa })
        });

        renderMesas();
      }
    };

    map.appendChild(div);
  });
}

setInterval(renderMesas, 5000);
renderMesas();
