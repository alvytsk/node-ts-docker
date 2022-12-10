import express from 'express';
import { analytics } from './utils/analytics.js';

const msg = 'Hello world!!!';
console.log(msg);

analytics('index.ts');

const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('Server is up and running!');
});

app.listen(PORT, () => {
  console.log(`server started at http://localhost:${PORT}`);
});
