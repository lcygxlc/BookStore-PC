package cn.edu.neu.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class CORSConfig {

    /**
     * CORS是一个W3C标准，全称是”跨域资源共享”（Cross-origin resource sharing），
     * 允许浏览器向跨源服务器，发出XMLHttpRequest请求，从而克服了AJAX只能同源使用的限制。
     *
     * 它通过服务器增加一个特殊的Header[Access-Control-Allow-Origin]来告诉客户端跨域
     * 的限制，如果浏览器支持CORS、并且判断Origin通过的话，就会允许XMLHttpRequest发起
     * 跨域请求。*/
    @Bean
    public CorsFilter corsFilter() {

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        //允许用户发送、处理 cookie
        config.setAllowCredentials(true); // you USUALLY want this
        //允许http://localhost:8080发起跨域请求
        config.addAllowedOrigin("http://localhost:8080");

        //允许跨域请求包含content-type
        config.addAllowedHeader("*");
        //设置允许跨域请求的方法，默认允许简单请求方式，GET/HEAD/POST被允许
        config.addAllowedMethod("GET");
        config.addAllowedMethod("PUT");
        config.addAllowedMethod("POST");
        // CORS配置对所有接口都有效
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }
}