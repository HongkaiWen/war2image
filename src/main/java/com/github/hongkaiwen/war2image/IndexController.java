package com.github.hongkaiwen.war2image;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author hongkai
 * @create 2018-07-14 3:56 PM
 **/
@RestController
public class IndexController {

    @Autowired
    private EnvConfig envConfig;

    @GetMapping("/")
    public String index(){
        return envConfig.toString();
    }

}
