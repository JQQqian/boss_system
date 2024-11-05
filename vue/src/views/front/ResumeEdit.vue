<template>
  <div style="min-height: 1000px; background-color: #f6f6f8; padding: 50px 0">
    <div style="min-height: 500px;margin: 20px auto;width: 50%">
      <div style="text-align: center; font-size: 20px">
        在线编辑您的简历
      </div>
      <div style="margin-top: 20px">
        <el-input style="width: 50%;padding-right: 5px" v-model="data.resumeData.name" placeholder="请输入简历名称"></el-input>
        <el-input style="width: 50%;padding-left: 5px" v-model="data.resumeData.username" placeholder="请输入姓名"></el-input>
      </div>
      <div style="margin-top: 10px">
        <el-select v-model="data.resumeData.sex" placeholder="请选择性别" style="width: 50%;padding-right: 5px" >
          <el-option label="男" value="男"></el-option>
          <el-option label="女" value="女"></el-option>
        </el-select>
        <el-select v-model="data.resumeData.salary" placeholder="请选择你的期望薪资" style="width: 50%;padding-left: 5px" >
          <el-option label="3K以下" value="3K以下"></el-option>
          <el-option label="3-5K" value="3-5K"></el-option>
        </el-select>
      </div>

    </div>

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