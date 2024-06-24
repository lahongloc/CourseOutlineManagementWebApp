/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.configs;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.annotation.Order;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author lahon
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.comwe.controllers",
    "com.comwe.repositories",
    "com.comwe.services"
})
@Order(2)
@PropertySource("classpath:application.properties")
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    
    @Autowired
    private Environment env;

    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //for log in, log out..
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http)
            throws Exception {
        http.formLogin().loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password");

        http.formLogin().defaultSuccessUrl("/")
                .failureUrl("/login?error");
        http.logout().logoutSuccessUrl("/login");
        http.exceptionHandling()
                .accessDeniedPage("/login?accessDenied");
        
        http.authorizeRequests()
                .antMatchers("/users-manager/").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests()
                .antMatchers("/outline-management/**").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests()
                .antMatchers("/generate-pdf/").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests()
                .antMatchers("/subjects-management/").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests()
                .antMatchers("/outlines-statistic/").access("hasRole('ROLE_ADMIN')");
        
        
        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/**/add")
                .access("hasRole('ROLE_ADMIN')");
//        .antMatchers("/**/pay")
//                .access("hasAnyRole('ROLE_ADMIN', 'LECTURER')");
        http.csrf().disable();
    }

    @Bean
    public Cloudinary cloudinary() {
        Cloudinary cloudinary
                = new Cloudinary(ObjectUtils.asMap(
                        "cloud_name", "dad8ejn0r",
                        "api_key", "916986197549325",
                        "api_secret", "8ZDd8GQafg9rc9_h5UrIBt0SZ4Q",
                        "secure", true));
        return cloudinary;
    }

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername("locla2405@gmail.com");
        mailSender.setPassword("mxefvqoykuezxuwz");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }
    
    @Bean
    public AmazonS3 amazonS3() {
        BasicAWSCredentials awsCreds = new BasicAWSCredentials(
                this.env.getProperty("aws.accessKey"),
                this.env.getProperty("aws.secretKey")
        );
        return AmazonS3ClientBuilder.standard()
                .withRegion(this.env.getProperty("aws.s3.region"))
                .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
                .build();
    }
}
