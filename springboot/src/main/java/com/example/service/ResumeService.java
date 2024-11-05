package com.example.service;

import com.example.entity.Resume;
import com.example.mapper.ResumeMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResumeService {

    @Resource
    private ResumeMapper resumeMapper;

    public void add(Resume resume) {
        resumeMapper.insert(resume);
    }

    public void updateById(Resume resume) {
        resumeMapper.updateById(resume);
    }

    public void deleteById(Integer id) {
        resumeMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            resumeMapper.deleteById(id);
        }
    }

    public Resume selectById(Integer id) {
        return resumeMapper.selectById(id);
    }

    public List<Resume> selectAll(Resume resume) {
        return resumeMapper.selectAll(resume);
    }

    public PageInfo<Resume> selectPage(Resume resume, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Resume> list = resumeMapper.selectAll(resume);
        return PageInfo.of(list);
    }

}