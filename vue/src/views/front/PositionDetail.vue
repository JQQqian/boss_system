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
    <div style="margin: 20px auto; width: 80%; display: flex">
      <div style="flex: 1; margin-right: 10px; min-height: 500px; background-color: white; border-radius: 10px; padding: 20px 30px">
        <div style="font-size: 20px; font-weight: bold; color: #222222">职位描述</div>
        <div style="margin-top: 15px">
          <el-tag type="info" v-for="item in data.positionData.tagList" style="margin-right: 10px">{{ item }}</el-tag>
        </div>
        <div style="margin-top: 30px" v-html="data.positionData.content"></div>
      </div>
      <div style="width: 300px; margin-left: 5px">
        <div style="text-align: center; background-color: #d1d7d7; color: #222222; font-size: 16px; line-height: 40px; font-weight: bold; border-top-left-radius: 10px; border-top-right-radius: 10px">公司基本信息</div>
        <div style="background-color: white; padding: 20px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px">
          <div style="display: flex; align-items: center; margin-bottom: 10px">
            <img :src="data.positionData.employAvatar" alt="" style="margin-right: 10px; width: 40px; height: 40px; border-radius: 10px; border: 1px solid #cccccc">
            <div style="color: #414a60; font-size: 18px; margin-left: 10px">{{ data.positionData.employName }}</div>
          </div>
          <div style="display: flex; align-items: center; line-height: 30px; font-size: 15px; color: #333333">
            <el-icon><Coordinate /></el-icon>
            <div style="margin-left: 10px">{{ data.positionData.employStage }}</div>
          </div>
          <div style="display: flex; align-items: center; line-height: 30px; font-size: 15px; color: #333333">
            <el-icon><User /></el-icon>
            <div style="margin-left: 10px">{{ data.positionData.employScale }}</div>
          </div>
          <div style="display: flex; align-items: center; line-height: 30px; font-size: 15px; color: #333333">
            <el-icon><OfficeBuilding /></el-icon>
            <div style="margin-left: 10px">{{ data.positionData.employAddress }}</div>
          </div>
          <div style="margin-top: 20px; text-align: center">
            <el-button type="success" style="padding: 20px 30px">查看全部职位</el-button>
          </div>
        </div>
        <div style="margin-top: 20px; text-align: center; background-color: #d1d7d7; color: #222222; font-size: 16px; line-height: 40px; font-weight: bold; border-top-left-radius: 10px; border-top-right-radius: 10px">你可能对这些职位感兴趣</div>
        <div class="card" style="margin-bottom: 5px; cursor: pointer" v-for="it in data.recommendData">
          <div style="display: flex; padding: 0 5px">
            <div style="flex: 1; text-align: left; font-size: 16px">{{ it.name }}</div>
            <div style="width: 100px; text-align: right; color: red">{{ it.salary }}</div>
          </div>
          <div style="margin: 10px 0; padding: 0 5px; text-align: left">
            <el-tag style="margin-right: 5px" type="info" v-for="tag in it.tagList">{{ tag }}</el-tag>
          </div>
          <div style="display: flex; align-items: center; padding: 10px 5px">
            <div style="width: 35px"><img :src="it.employAvatar" alt="" style="width: 35px; height: 35px; border-radius: 5px; border: 1px solid #cccccc"></div>
            <div style="flex: 1; margin-left: 20px">{{ it.employName }}</div>
            <div style="width: 80px; text-align: right">{{ it.employStage }}</div>
          </div>
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

const loadRecommend = () => {
  request.get('/position/recommend').then(res => {
    if (res.code === '200') {
      data.recommendData = res.data
    } else {
      ElMessage.error(res.msg)
    }
  })
}

onMounted(() => {
  loadPosition()
  loadRecommend()
})

</script>