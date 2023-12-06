function updateTime() {
    fetch("/current-time")
        .then(response => response.json())
        .then(data => {
            const moscowTimeElement = document.getElementById("moscow-time");
            if (moscowTimeElement) {
                // Check if the time has changed
                if (moscowTimeElement.textContent !== data.time) {
                    moscowTimeElement.textContent = data.time;
                    applyRandomColors();
                }
            }
        })
        .catch(error => {
            console.error("Error fetching time:", error);
        });
}

updateTime();

setInterval(updateTime, 1000);
// Generate a random color in hexadecimal format
function getRandomColor() {
    const letters = '0123456789ABCDEF';
    let color = '#';
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

// Apply random colors to each letter of the text
function applyRandomColors() {
    const textElement = document.getElementById('moscow-time');
    const text = textElement.textContent;
    const coloredText = text.split('').map(letter => {
        const randomColor = getRandomColor();
        return `<span style="color: ${randomColor};">${letter}</span>`;
    }).join('');
    textElement.innerHTML = coloredText;
}