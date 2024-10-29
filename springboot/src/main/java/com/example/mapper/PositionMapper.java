package com.example.mapper;

import com.example.entity.Position;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PositionMapper {

    int insert(Position position);

    void updateById(Position position);

    void deleteById(Integer id);

    @Select("select * from `position` where id = #{id}")
    Position selectById(Integer id);

    List<Position> selectAll(Position position);

}
