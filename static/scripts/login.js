const submitButton = document.getElementById("submit-button");

submitButton.addEventListener("click", () => {
    if (submitButton.disabled) return;

    const username = document.getElementById("username").value;
    const email = document.getElementById("email")?.value;
    const phone = document.getElementById("phone")?.value;

    let data = {
        username: username
    }
    if (email) data.email = email;
    if (phone) data.phone = phone;

    fetch("/api/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.href = "/panel";
        } else {
            const messageElement = document.getElementById("message");
            const messageContent = messageElement.innerHTML;
            messageElement.style.color = "red";
            messageElement.innerText = data.data;
            submitButton.disabled = true;
            setTimeout(() => {
                messageElement.style.color = null;
                messageElement.innerHTML = messageContent;
                submitButton.disabled = false;
            }, 3000);
        }
    })

})