package cn.halower.infrastructure.user.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;

@Configuration
@EnableResourceServer
public class ResourceServerConfiguration extends ResourceServerConfigurerAdapter {
    Logger log = LoggerFactory.getLogger(ResourceServerConfiguration.class);

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .regexMatchers(".*swagger.*", ".*v2.*", ".*webjars.*", "/infrastructure/login.*", "/infrastructure/registry.*", "/infrastructure/test.*").permitAll()
                .antMatchers("/**").authenticated();
    }


    @Override
    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
        log.info("Configuring ResourceServerSecurityConfigurer ");
        resources.resourceId("infrastructure-service").tokenStore(tokenStore);
    }

    @Autowired
    TokenStore tokenStore;
}
