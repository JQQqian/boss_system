package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Employ;
import com.example.entity.Position;
import com.example.mapper.EmployMapper;
import com.example.mapper.PositionMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 职位信息业务层方法
 */
@Service
public class PositionService {

    @Resource
    private PositionMapper positionMapper;
    @Resource
    private EmployMapper employMapper;

    public void add(Position position) {
        Account currentUser = TokenUtils.getCurrentUser();
        Employ employ = employMapper.selectById(currentUser.getId());
        position.setEmployId(employ.getId());
        position.setIndustryId(employ.getIndustryId());
        position.setStatus("待审核");
        positionMapper.insert(position);
    }

    public void updateById(Position position) {
        positionMapper.updateById(position);
    }

    public void deleteById(Integer id) {
        positionMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            positionMapper.deleteById(id);
        }
    }

    public Position selectById(Integer id) {
        return positionMapper.selectById(id);
    }

    public List<Position> selectAll(Position position) {
        return positionMapper.selectAll(position);
    }

    public PageInfo<Position> selectPage(Position position, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.EMPLOY.name().equals(currentUser.getRole())) {
            position.setEmployId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Position> list = positionMapper.selectAll(position);
        return PageInfo.of(list);
    }

}
