<template>
  <div style="min-height: 1000px; background-color: #f6f6f8; padding: 50px 0">
    <div style="min-height: 500px;margin: 20px auto;width: 50%">
      <div style="text-align: center; font-size: 20px">
        在线编辑您的简历
      </div>
      <div style="margin-top: 20px">
        <el-input style="width: 50%;padding-right: 5px" v-model="data.resumeData.name"
                  placeholder="请输入简历名称"></el-input>
        <el-input style="width: 50%;padding-left: 5px" v-model="data.resumeData.username"
                  placeholder="请输入姓名"></el-input>
      </div>
      <div style="margin-top: 10px">
        <el-select v-model="data.resumeData.sex" placeholder="请选择性别" style="width: 50%;padding-right: 5px">
          <el-option label="男" value="男"></el-option>
          <el-option label="女" value="女"></el-option>
        </el-select>
        <el-select v-model="data.resumeData.salary" placeholder="请选择你的期望薪资"
                   style="width: 50%;padding-left: 5px">
          <el-option label="3K以下" value="3K以下"></el-option>
          <el-option label="3-5K" value="3-5K"></el-option>
          <el-option label="5-10k" value="5-10k"></el-option>
          <el-option label="10-20k" value="10-20k"></el-option>
          <el-option label="20-50k" value="20-50k"></el-option>
          <el-option label="50k以上" value="50k以上"></el-option>
        </el-select>
      </div>
      <div style="margin-top: 10px">
        <el-select v-model="data.resumeData.education" placeholder="请选择你的学历"
                   style="width: 50%;padding-right: 5px">
          <el-option label="初中及以下" value="初中及以下"></el-option>
          <el-option label="中专/中技" value="中专/中技"></el-option>
          <el-option label="高中" value="高中"></el-option>
          <el-option label="大专" value="大专"></el-option>
          <el-option label="本科" value="本科"></el-option>
          <el-option label="硕士" value="硕士"></el-option>
          <el-option label="博士" value="博士"></el-option>
          <el-option label="博士后" value="博士后"></el-option>
        </el-select>
        <el-select v-model="data.resumeData.experience" placeholder="请选择你的工作年限"
                   style="width: 50%;padding-left: 5px">
          <el-option label="在校生" value="在校生"></el-option>
          <el-option label="应届生" value="应届生"></el-option>
          <el-option label="1年以内" value="1年以内"></el-option>
          <el-option label="1到3年" value="1到3年"></el-option>
          <el-option label="3到5年" value="3到5年"></el-option>
          <el-option label="5到10年" value="5到10年"></el-option>
          <el-option label="10年以上" value="10年以上"></el-option>
        </el-select>
      </div>
      <div style="margin-top: 10px">
        <el-input style="width: 50%; padding-right: 5px" v-model="data.resumeData.phone"
                  placeholder="请输入联系电话"></el-input>
        <el-input style="width: 50%; padding-left: 5px" v-model="data.resumeData.email"
                  placeholder="请输入联系邮箱"></el-input>
      </div>
      <div style="margin-top: 20px">
        <el-button type="success" @click="addEduExp">添加教育经历</el-button>
      </div>
      <div style="margin-top: 10px;font-size: 16px;" v-if="data.resumeData.eduExpList.length">
        <div style="font-weight: bold">教育经历</div>
        <div style="margin-top: 10px; margin-bottom: 20px" v-for="item in data.resumeData.eduExpList">
          <div style="display: flex;align-items: center">
            <div style="flex:1;color: #00bebd">{{ item.start }} ~ {{ item.end ? item.end : '至今' }}</div>
            <div style="flex:1;color: #00bebd;font-weight: bold">{{ item.school }}</div>
            <div style="flex:1;color: #00bebd;font-weight: bold">{{ item.speciality }}({{item.education}})</div>
          </div>
          <div style="display: flex; width: 30px">
            <el-icon style="color: #00bebd; cursor: pointer"><Edit /></el-icon>
            <el-icon style="color: red; cursor: pointer"><Delete /></el-icon>
          </div>
        </div>
        <div style="margin-top: 10px">主修课程：{{ item.course }}</div>
      </div>
      <div></div>
      <div style="margin-top: 50px; text-align: center">
        <el-button type="info" style="padding: 20px 30px" @click="saveResume">保存简历</el-button>
      </div>
    </div>
    <el-dialog title="填写教育经历" v-model="data.eduFormVisible" width="40%" destroy-on-close>
      <el-form ref="form" :model="data.eduForm" label-width="70px" style="padding: 20px">
        <el-form-item prop="school" label="学校名称">
          <el-input v-model="data.eduForm.school" placeholder="请输入学校名称"></el-input>
        </el-form-item>
        <el-form-item prop="speciality" label="专业名称">
          <el-input v-model="data.eduForm.speciality" placeholder="请输入专业名称"></el-input>
        </el-form-item>
        <el-form-item prop="education" label="选择学历">
          <el-select v-model="data.eduForm.education" placeholder="请选择你的学历" style="width: 50%; padding-right: 5px; width: 100%">
            <el-option label="初中及以下" value="初中及以下"></el-option>
            <el-option label="中专/中技" value="中专/中技"></el-option>
            <el-option label="高中" value="高中"></el-option>
            <el-option label="大专" value="大专"></el-option>
            <el-option label="本科" value="本科"></el-option>
            <el-option label="硕士" value="硕士"></el-option>
            <el-option label="博士" value="博士"></el-option>
            <el-option label="博士后" value="博士后"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="start" label="入学时间">
          <el-date-picker style="width: 100%"
                          v-model="data.eduForm.start"
                          type="date"
                          placeholder="请选择日期"
                          value-format="YYYY-MM-DD"
          />
        </el-form-item>
        <el-form-item prop="end" label="毕业时间">
          <el-date-picker style="width: 100%"
                          v-model="data.eduForm.end"
                          type="date"
                          placeholder="请选择日期"
                          value-format="YYYY-MM-DD"
          />
        </el-form-item>
        <el-form-item prop="course" label="主修课程">
          <el-input type="textarea" :rows="4" v-model="data.eduForm.course" placeholder="请输入主修课程"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.eduFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveEduExp">确 定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import {reactive} from "vue";
import request from "@/utils/request.js";
import {ElMessage} from "element-plus";

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  resumeData: {
    eduExpList: []
  },
  eduForm: {},
  eduFormVisible: false,

})

const saveResume = () => {
  data.resumeData.userId = data.user.id
  request.post('/resume/add', data.resumeData).then(res => {
    if (res.code === '200') {
      ElMessage.success('保存成功')
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const addEduExp = () => {
  data.eduForm = {
    id: new Date().getTime() + Math.random().toString(36).substr(2)
  }
  data.eduFormVisible = true
}
const saveEduExp = () => {
  data.resumeData.eduExpList.push(data.eduForm)
  data.eduFormVisible = false
}
</script>