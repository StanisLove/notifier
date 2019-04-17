import axios from 'axios';

export const HTTP = axios.create({
  baseUrl: `http://127.0.0.1`,
  headers: {}
})
