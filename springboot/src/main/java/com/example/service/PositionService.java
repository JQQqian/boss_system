package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.entity.Position;
import com.example.mapper.PositionMapper;
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

    public void add(Position position) {
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
        PageHelper.startPage(pageNum, pageSize);
        List<Position> list = positionMapper.selectAll(position);
        return PageInfo.of(list);
    }

}
