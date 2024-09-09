import request from "axios";
export const baseURL = 'http://localhost:8888'
export const axios = request.create({
    baseURL: baseURL,
    withCredentials: true,
    headers: { 'X-Requested-With': 'XMLHttpRequest' }
});