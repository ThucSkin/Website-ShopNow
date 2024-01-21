package com.websiteshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.websiteshop.config.StorageProperties;

@EnableConfigurationProperties(StorageProperties.class)
@SpringBootApplication
public class ShopNowApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShopNowApplication.class, args);
		System.out.println("/////////////////Server success on localhost:8080 /////////////////////////");
	}

}
