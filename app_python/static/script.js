function updateTime() {
    fetch("/time")
        .then(response => {
            if (response.status === 200) {
                return response.json();
            } else {
                throw new Error("Failed to retrieve time");
            }
        })
        .then(data => {
            const timeElement = document.getElementById("time");
            if (timeElement) {
                // Check if the time has changed
                if (timeElement.textContent !== data.time) {
                    timeElement.textContent = data.time;
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
    const textElement = document.getElementById('time');
    const text = textElement.textContent;
    const coloredText = text.split('').map(letter => {
        const randomColor = getRandomColor();
        return `<span style="color: ${randomColor};">${letter}</span>`;
    }).join('');
    textElement.innerHTML = coloredText;
}
