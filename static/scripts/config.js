const values = document.getElementById("values");
const valuesInitial = values.innerHTML;

const keyInput = document.getElementById("key");
const valueInput = document.getElementById("value");

const putConfigValue = (key, value) => {
    fetch(`/api/config`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({key: key, value: value})
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                addConfigOptions(data.data);
            } else {
                alert(data.data);
            }
        });
};

const addConfigOptions = (options) => {
    values.innerHTML = valuesInitial;
    for (let [key, value] of Object.entries(options)) {
        const tr = document.createElement("tr");
        const tdKey = document.createElement("td");
        const tdValue = document.createElement("td");
        const tdActions = document.createElement("td");
        tdKey.innerText = key;
        tdValue.innerText = value + "";
        const deleteButton = document.createElement("button");
        deleteButton.innerText = "Delete/Reset";
        deleteButton.addEventListener("click", () => putConfigValue(key, null));
        tdActions.appendChild(deleteButton);
        tr.appendChild(tdKey);
        tr.appendChild(tdValue);
        tr.appendChild(tdActions);
        values.appendChild(tr);
    }
};

document.getElementById("submit-button").addEventListener("click", () => {
    if (keyInput.value === "" || valueInput.value === "") {
        return alert("Key cannot be empty");
    }

    putConfigValue(keyInput.value, valueInput.value);
    keyInput.value = "";
    valueInput.value = "";
});

fetch("/api/config")
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            addConfigOptions(data.data);
        } else {
            const panel = document.getElementById("panel");
            panel.classList.add("error-message");
            panel.innerText = data.data;
        }
    });