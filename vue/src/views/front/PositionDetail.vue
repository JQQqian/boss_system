<template>
  <div style="min-height: 1000px; background-color: #f6f6f8">
    <div style="height: 200px;background-color: #3b526a;padding: 30px 0">
      <div style="width: 80%;margin: 0 auto">
        <div style="font-width: bold;font-size:28px;color:white">
          <span>{{ data.positionData.name }}</span>
          <span style="margin-left: 30px;color: #f26d49">{{ data.positionData.salary }}</span>
        </div>
        <div style="margin-top:15px;color:white;display: flex">
          <div style="display: flex;align-items:center">
            <el-icon><LocationInformation /></el-icon>
            <div style="margin-left:5px">{{ data.positionData.employCity}}</div>
          </div>
          <div style="display: flex; align-items: center; margin-left: 30px">
            <el-icon><Calendar /></el-icon>
            <div style="margin-left:5px">{{ data.positionData.experience}}</div>
          </div>
          <div style="display: flex; align-items: center; margin-left: 30px">
            <el-icon><School /></el-icon>
            <div style="margin-left:5px">{{ data.positionData.education}}</div>
          </div>
          <div style="display: flex; align-items: center; margin-left: 30px">
            <el-icon><Monitor /></el-icon>
            <div style="margin-left:5px">{{ data.positionData.type}}</div>
          </div>
        </div>
        <div style="margin-top: 20px">
          <el-button type="success" style="padding: 20px 30px">收藏岗位</el-button>
          <el-button type="info" style="padding: 20px 30px">投递简历</el-button>
        </div>

      </div>
    </div>
  </div>

</template>

<script setup>
import {reactive, onMounted} from "vue";
import request from "@/utils/request.js";
import {ElMessage} from "element-plus";
import router from "@/router/index.js";


const data = reactive({
  positionId: router.currentRoute.value.query.id,
  positionData: {}
})

const loadPosition = () => {
  data.positionId = router.currentRoute.value.query.id
  request.get('/position/selectById/' + data.positionId).then(res => {
    if (res.code === '200') {
      data.positionData = res.data
    } else {
      ElMessage.error(res.msg)
    }
  })
}

onMounted(() => {
  loadPosition()
})

</script>