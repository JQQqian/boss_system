<template>
  <div style="min-height: 1000px; background-color: #f6f6f8">
    <div style="height: 200px;background-color: #3b526a;padding: 30px 0">
      <div style="width: 80%;margin: 0 auto">
        <div style="display: flex;color:white">
          <img :src="data.employData.avatar" alt="" style="width: 70px;height: 70px;border-radius: 10%;">
          <div style="margin-left: 20px">
            <div style="font-size: 28px;font-weight: bold">{{data.employData.name}}</div>
            <div style="margin-top: 10px">
              <el-icon><Coordinate /></el-icon><span style="margin-right: 20px;font-size: 16px">{{data.employData.stage}}</span>
              <el-icon><User /></el-icon><span style="margin-right: 20px;font-size: 16px">{{data.employData.scale}}</span>
              <el-icon><CollectionTag /></el-icon><span style="font-size: 16px">在招职位:{{data.positionData.length}}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div>
      <div style="margin: 20px auto;width: 80%;text-align: center">
        <el-input v-model="data.name" placeholder="搜索该企业正在招聘的岗位" style="width: 500px;margin-right: 5px  " size="large">
        </el-input>
        <el-button type="info" size="large">搜索</el-button>
      </div>
      <div>

      </div>
    </div>
  </div>

</template>

<script setup>
import {reactive, onMounted} from "vue";
import request from "@/utils/request.js";
import router from "@/router/index.js";
import {ElMessage} from "element-plus";

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  employId: router.currentRoute.value.query.id,
  employData: {},
  positionData: [],
  name: null,
})

const loadEmploy = () => {
  data.employId = router.currentRoute.value.query.id
  request.get('/employ/selectById/' + data.employId).then(res => {
    if(res.code === '200'){
      data.employData = res.data
    }
  })
}

const loadPosition = () => {
  data.employId = router.currentRoute.value.query.id
  request.get('/position/selectAll',{
    params:{
      employId: data.employId,
      name: data.name
    }
  }).then(res => {
    if(res.code === '200'){
      data.positionData = res.data
    }else{
      ElMessage.error(res.msg)
    }
  })
}

loadEmploy()
loadPosition()
</script>