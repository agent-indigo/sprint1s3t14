if (document.cookie === "") {
    window.location.href = "/";
} else {
    fetch("/api/token")
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const welcomeBack = document.getElementById("welcome-back");
            const phone = document.getElementById("phone");
            const email = document.getElementById("email");

            welcomeBack.innerText = `Welcome Back ${data.data.username}!`
            phone.innerText = `${data.data.phone || "Unknown"}`
            email.innerText = `${data.data.email || "Unknown"}`
        } else {
            window.location.href = "/";
        }
    });
}