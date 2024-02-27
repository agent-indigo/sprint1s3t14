const express = require('express');
const path = require('path');

const app = express();
const staticFilesDirectory = path.join(__dirname, 'static');

app.use('/static', express.static(staticFilesDirectory));
app.use(express.urlencoded({ extended: true }));

app.get('/login', (req, res) => {
  res.sendFile(path.join(__dirname, 'static', 'login.html'));
});

app.post('/login', (req, res) => {
  const { username, password } = req.body;
  if (username === 'example' && password === 'password') {
    res.send('Login successful');
  } else {
    res.send('Invalid username or password');
  }
});

const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});