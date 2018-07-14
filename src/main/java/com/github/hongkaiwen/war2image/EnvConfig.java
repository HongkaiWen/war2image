package com.github.hongkaiwen.war2image;

import lombok.Data;
import lombok.ToString;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author hongkai
 * @create 2018-07-14 4:00 PM
 **/
@Component
@ConfigurationProperties(
        prefix = "env"
)
@Data
@ToString
public class EnvConfig {

    private String envName;

    private String dbIp;

}
