package com.newbie.controllers;

import com.newbie.models.ApiMeta;
import com.newbie.repositorys.ApiMetaRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("apidoc")
public class ApiDocController {
    @Autowired
    private ApiMetaRepository repository;

    @GetMapping("/")
    public Iterable<ApiMeta> apiMetas(){
      return  repository.findAll();
    }

    @PutMapping("/")
    public void Update(@RequestBody ApiMeta apiMeta){
        ApiMeta oldApiDoc = repository.findById(apiMeta.getServiceName()).get();
        oldApiDoc.setDescription(apiMeta.getDescription());
        oldApiDoc.setIsPrivate(apiMeta.getIsPrivate());
        repository.save(oldApiDoc);
    }

    @DeleteMapping("/{serviceName}")
    public void Delete(@PathVariable String serviceName){
        repository.deleteById(serviceName);
    }
}
