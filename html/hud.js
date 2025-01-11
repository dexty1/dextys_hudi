window.onload = function() {
    window.addEventListener('message', function(event) {
        if (event.data.type === 'updateStatus') {
            updateHUD(event.data.status);
        }
    });

    function updateHUD(status) {
        // Päivitetään rahasaldot
        document.getElementById('bank-value').textContent = 'Bank: $' + status.bank;
        document.getElementById('cash-value').textContent = 'Cash: $' + status.cash;
        document.getElementById('job-value').textContent = 'Job: ' + status.job;

        // Työ2: Jos pelaajalla on toinen työ, näytetään se
        if (status.job2 && status.job2 !== "None") {
            document.getElementById('job2-container').style.display = 'flex';
            document.getElementById('job2-value').textContent = 'Job2: ' + status.job2;
        } else {
            document.getElementById('job2-container').style.display = 'none';
        }

        // Jengi: Jos pelaajalla on jengi, näytetään se
        if (status.gang && status.gang !== "None") {
            document.getElementById('gang-container').style.display = 'flex';
            document.getElementById('gang-value').textContent = 'Gang: ' + status.gang;
        } else {
            document.getElementById('gang-container').style.display = 'none';
        }
    }
};
