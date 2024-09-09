package cn.edu.neu.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {

    // APPID，收款账号既APPID对应支付宝账号
    public static String app_id = "2021000119630684";
    // 商户私钥，PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQCa4m9UpUZ6KaRVAaEpf9+YlSJt9qFe8Dgo5qTzV99tf8VhyCbWdZxyUpU4z/brDTJFmh0w/xFgbE210kZ2pXX7LWwk80NtqRfUfYvewTvd2n9Of9Vw42J8TC3gPS0S4ft6nMd7XPjntKFKlJ4Rza6/GV0z1Q+nDNAn7NldFizRkz0H3hP1GhVMx6Hm39fGp8buk2VaFVob7lrmceb9nZQIO4QdTHUj3aeQPnjOGfDuW00ErqdVTw9yYedneiUZlzCQ8yoYT4WZpoaYS5YIcENAzA2vwl5LaNMZUgxwoZcnJweSx2fXTQMM+3b8IuIkhD5NQdhTP9TlDQnsdqeNnLcpAgMBAAECggEBAIhW7x2Z53I+GdRifNWlJNSR4x7dTave1fDbJzS2k402PjAXGmkKWs8f9w9tsbOziB9QzIWG4mr4q2d0VGa4vCSBFYNpSF/Ny5ZXdbp+aw6d+hbF3MNkxhsYjAGqmHTYzKBgRhFIBCsjDCA0tviBEGRUFYE8+mxYkRu0GJsinA1Wocar68muh1BWf+B4dvNeK/IX8CjkZfIfF4PP26YXK8ySGnSkJVctHOUEO1su6PsoUrE9Bi2ZrJfUYB5Uzh84GZEiwrbtWzox5S5THiPP/bAhrnMUTU7JhzrAyvOGFdgyfTBC6GAex3zfiugfSDMDJjsHXlHRgs9cOalWZAxAu4kCgYEA+MOEukjQWmF0QbA+CzhFCpZRg4nYqWQ2Wpjro/GUWoeNmSWo8BjdPCgimGcylUlq8XAUVCr/t6AUUxMcqbRYllge8Ylsvv2sK9SueyWgcfz3GrgNSKkgFXQf8NzOHSvwN/d68YOi/HEmox+QeSs7o3NU1Mx83sKi6MhCaEQguncCgYEAn2PSOd3fENNa5qFTdjiBiPvcKhH2h4/Ws5VII57sQc1MQKcBqn+imfShiGHRMkKAEBCbG8O98VW/Jz5XlkTZh7rWdUYHzT2tBTeAnThttM+kkZrxOpNn6OjnNnVfDEIWqxmv+9+iyRj0qculeyYEQLmB1UFyymT7RFwE1Kjg418CgYEAnLZfOROB3k4idPdYPq02IVNNCraePSgabbyERgV8VgOrGl11LbwcMzd9g9EPNqjHrE3VIKjt63n3E9aoaehpHl1pMPRIA5G/EuWq/X1YtDaOXNCx3aJdyeYb8RrI5eu2KyvG0bsBxFJr6ruJwiuQKIoRWPVxfMvU4Ry3aQPyMkUCgYEAm/VSeKiuYYpNQanNProflWfLj6av8Qk/bcy+H4ybY+97ky9Wo/vroHULsaT0yxbis9Vr0AkBzCi4t696iGCp8PNScMGrVJnquFYMlMnoHqmmP4q6SzR80htCUbka3aW1BIpH9k5mvBqdG59WNl+GfcaGUaKOrZeNfOAFIgh0tEUCgYEAhoIdBZrgW+W6b7wW3XuHbSGl+kONY07fLpUrLqbGHGJ+f3MYnmtp0Na9KI8rhJ2GMEDzrNqqpHKYooryeSR9rJDpjoOL0ktafTZyEHqaszeG2MS2Oj1bzgoJy5eVM3IrUbNDRHphgmujyoUDx10BLJUsf+o8+dRzbbintm/kVfg=";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAitxQGX5Js1QkJZA9c1WjvQ/ZoHptxbtCf/MGqbynaZ5EoVZQJ7VyCpwMeEpYmvJ3P6ojBGnC5cQMu76v0Bwa66kldyjB8OOJCJSUXch/smDtKAhCys//F+L/DKmtfyxjqktW1B5R9Kw3ryyP52bP8glu0hAsRVdCVvZAml4Sd6U2F/Hbl63PjaPf4bx1QIXIUerUAYNKdOTCKNuU1QyS19cGoSrWNZgYjhNr99eibVANuactXh36koa+JO3a8+BHgN5zZQJdjzfz6BsqAAZPrXbcJvZ8dyu3LIOAaUjmNZQpnlxJepTbTWrgnpWr+9mokJMOnwi22ROD76PzjVBEWQIDAQAB";
    // 服务器异步通知页面路径
    public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";
    // 页面跳转同步通知页面路径
    public static String return_url = "http://localhost:8080/payresult";
    // 签名方式
    public static String sign_type = "RSA2";
    // 字符编码格式
    public static String charset = "utf-8";
    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
    
}