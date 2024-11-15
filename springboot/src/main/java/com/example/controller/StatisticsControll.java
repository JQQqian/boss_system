package com.example.controller;

import com.example.common.Result;
import com.example.entity.Employ;
import com.example.entity.Position;
import com.example.entity.Submit;
import com.example.entity.User;
import com.example.service.EmployService;
import com.example.service.PositionService;
import com.example.service.SubmitService;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/statistics")
public class StatisticsControll {
    @Autowired
    private EmployService employService;

    @Autowired
    private UserService userService;

    @Autowired
    private PositionService positionService;

    @Autowired
    private SubmitService submitService;

    @GetMapping("/base")
    public Result base() {
        Map<String,Integer>map=new HashMap<>();

        List<Employ> employs = employService.selectAll(new Employ());
        List<User> users = userService.selectAll(new User());
        List<Position> positions = positionService.selectAll(new Position());
        List<Submit> submits = submitService.selectAll(new Submit());

        map.put("employNum",employs.size());
        map.put("employeeNum",users.size());
        map.put("positionNum",positions.size());
        map.put("submitNum",submits.size());
        return Result.success(map);
    }
}
