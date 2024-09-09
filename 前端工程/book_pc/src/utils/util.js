import CryptoJS from 'crypto-js'
import { baseURL } from './axios'
import { EventEmitter } from 'events'

//补全图片前缀
export const prefix = (url) => {
    return baseURL + `${url}`
}

export const globalEventEmitter = new EventEmitter()

export function populateFormData(obj, keys) {
    const params = new URLSearchParams();
    if (keys) {
        for (const prop of keys) {
            params.append(prop, obj[prop])
        }
    } else {
        for (const prop in obj) {
            params.append(prop, obj[prop])
        }
    }
    return params;
}

export function populateArrayFormData(arr, keys) {
    const params = new URLSearchParams();
    for (let item of arr) {
        if (keys) {
            for (const prop of keys) {
                params.append(prop, item[prop])
            }
        } else {
            for (const prop in item) {
                params.append(prop, item[prop])
            }
        }
    }

    return params;
}

//crypto-js安装： npm install crypto-js --save
//AES算法加密
export function encrypt(message, key) {
    var keyHex = CryptoJS.enc.Utf8.parse(key);
    var encrypted = CryptoJS.DES.encrypt(message, keyHex, {
        mode: CryptoJS.mode.ECB,
        padding: CryptoJS.pad.Pkcs7
    });
    return encrypted.toString();
}
//AES算法解密
export function decrypt(message, key) {
    var keyHex = CryptoJS.enc.Utf8.parse(key);
    var plaintext = CryptoJS.DES.decrypt(message, keyHex, {
        mode: CryptoJS.mode.ECB,
        padding: CryptoJS.pad.Pkcs7
    })
    return plaintext.toString(CryptoJS.enc.Utf8)
}