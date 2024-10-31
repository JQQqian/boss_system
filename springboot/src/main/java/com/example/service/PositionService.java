package com.example.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
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

import java.util.Arrays;
import java.util.Collections;
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
        Position position = positionMapper.selectById(id);
        String tags = position.getTags();
        if (ObjectUtil.isNotEmpty(tags)) {
            String[] split = tags.split(",");
            position.setTagList(Arrays.asList(split));
        }
        return position;
    }

    public List<Position> selectAll(Position position) {
        List<Position> positions = positionMapper.selectAll(position);
        for (Position dbPosition : positions) {
            String tags = dbPosition.getTags();
            if (ObjectUtil.isNotEmpty(tags)) {
                String[] split = tags.split(",");
                List<String> list = Arrays.asList(split);
                if (list.size() > 3) {
                    dbPosition.setTagList(list.subList(0, 3));
                } else {
                    dbPosition.setTagList(list);
                }
            }
        }
        return positions;
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

    /**
     * 推荐岗位（基于协同过滤推荐算法）
     */
    public List<Position> recommend() {
        // TODO 暂时就随便取3个，后面我们在这里使用协同过滤推荐算法来推荐
        List<Position> positions = positionMapper.selectAll(new Position());
        Collections.shuffle(positions);
        if (positions.size() > 3) {
            positions = positions.subList(0, 3);
        }
        extracted(positions);
        return positions;
    }

    private static void extracted(List<Position> positions) {
        for(Position dbPosition : positions) {
            String tags = dbPosition.getTags();
            if(ObjectUtil.isNotEmpty(tags)) {
                String[] split = tags.split(",");
                List<String> list = Arrays.asList(split);
                if(list.size() > 3) {
                    dbPosition.setTagList(list.subList(0, 3));
                } else {
                    dbPosition.setTagList(list);
                }
            }
        }
    }
}
