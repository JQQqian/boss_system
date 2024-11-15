<template>
  <div style="display: flex">
    <div style="flex: 1; display: flex; align-items: center" class="card">
      <img src="../../assets/imgs/employ-kb6_q5aM.jpg" alt="" style="width: 80px;height: 80px">
      <div style="margin-left: 20px">
        <div style="font-size: 20px">平台在招企业数量</div>
        <div style="font-size: 20px; margin-top: 10px">{{ data.employNum }}</div>
      </div>
    </div>
    <div style="flex: 1; margin: 0 10px; display: flex; align-items: center" class="card">
      <img src="../../assets/imgs/employee-BFkiltqs.jpg" alt="" style="width: 80px;height: 80px">
      <div style="margin-left: 20px">
        <div style="font-size: 20px">平台求职用户数量</div>
        <div style="font-size: 20px; margin-top: 10px">{{ data.employeeNum }}</div>
      </div>
    </div>
    <div style="flex: 1; display: flex; align-items: center" class="card">
      <img src="../../assets/imgs/positon-Be3w-_wH.jpg" alt="" style="width: 80px;height: 80px">
      <div style="margin-left: 20px">
        <div style="font-size: 20px">平台在招岗位数量</div>
        <div style="font-size: 20px; margin-top: 10px">{{ data.positionNum }}</div>
      </div>
    </div>
    <div style="flex: 1; margin-left: 10px; display: flex; align-items: center" class="card">
      <img src="../../assets/imgs/submit-D44Yh2-L.jpg" alt="" style="width: 80px;height: 80px">
      <div style="margin-left: 20px">
        <div style="font-size: 20px">平台岗位总投递数量</div>
        <div style="font-size: 20px; margin-top: 10px">{{ data.submitNum }}</div>
      </div>
    </div>
  </div>
</template>

<script setup>

import {reactive, onMounted} from "vue";
import request from "@/utils/request.js";
import {ElMessage} from "element-plus";

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  employNum: 0,
  employeeNum: 0,
  positionNum: 0,
  submitNum: 0,
})

const loadBaseData = () => {
  request.get('/statistics/base').then(res => {
    if (res.code === '200') {
      data.employNum = res.data.employNum
      data.employeeNum = res.data.employeeNum
      data.positionNum = res.data.positionNum
      data.submitNum = res.data.submitNum
    } else {
      ElMessage.error(res.msg)
    }
  })
}

onMounted(() => {
  loadBaseData()
})
</script>