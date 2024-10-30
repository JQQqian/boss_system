<template>
  <div style="min-height: 1000px; background-color: #f6f6f8">
    <img src="@/assets/imgs/banner.png" alt="" style="width: 100%;height: 120px">
    <div style="margin: 25px auto; width: 70%; text-align: center">
      <el-input size="large" v-model="data.name" placeholder="请输入你感兴趣的职位" style="width: 500px; margin-right: 5px"></el-input>
      <el-button size="large" type="info">搜索</el-button>
    </div>
    <div style="margin: 0 auto; width: 70%; text-align: center">
      <div style="display: flex">
        <div style="flex: 1"><img style="width: 100%; height: 240px; border-top-left-radius: 10px" :src="data.leftAd.img" alt=""></div>
        <div style="flex: 2; margin: 0 2px"><img style="width: 100%; height: 240px" :src="data.centerAd.img" alt=""></div>
        <div style="flex: 1"><img style="width: 100%; height: 240px; border-top-right-radius: 10px" :src="data.rightAd.img" alt=""></div>
      </div>
      <div style="display: flex">
        <div style="flex: 1"><img style="width: 100%; height: 120px; border-bottom-left-radius: 10px" :src="data.leftDownAd.img" alt=""></div>
        <div style="flex: 2; margin: 0 2px"><img style="width: 100%; height: 120px" :src="data.centerDownAd.img" alt=""></div>
        <div style="flex: 1"><img style="width: 100%; height: 120px; border-bottom-right-radius: 10px" :src="data.rightDownAd.img" alt=""></div>
      </div>
    </div>
  </div>
  <div class="front-footer">
    <div
        style="width: 70%; margin: 0 auto; line-height: 50px; height: 50px; font-size: 14px; color: #93999F; text-align: center">
      <span style="color: #666666">友情链接：</span>
      <span style="margin-left: 10px"><a style="margin-left: 10px; color: #93999F" href="https://www.baidu.com/"
                                         target="_blank">百度一下</a></span>
      <span style="margin-left: 10px"><a style="margin-left: 10px; color: #93999F" href="https://www.google.com"
                                         target="_blank">谷歌一下</a></span>
      <span style="margin-left: 10px"><a style="margin-left: 10px; color: #93999F" href="https://www.baidu.com"
                                         target="_blank">我的博客</a></span>
    </div>
    <div style="text-align: center; line-height: 30px; font-size: 13px; margin-bottom: 10px; color: #93999F">
      Copyright ©2024 www.baidu.cn 版权所有 <a style="margin-left: 10px; color: #93999F"
                                               href="https://beian.miit.gov.cn/" target="_blank">皖ICP备
      2023033553号-1</a>
    </div>
  </div>
</template>

<script setup>
import {reactive} from "vue";
import {ElMessage} from "element-plus";
import request from "@/utils/request.js";

const data = reactive({
  name: null,
  advertiseData: [],
  centerAd: {},
  leftAd: {},
  rightAd: {},
  centerDownAd: {},
  leftDownAd: {},
  rightDownAd: {}
})

const loadAdvertise = () => {
  request.get('/advertise/selectAll').then(res => {
    if (res.code === '200') {
      data.advertiseData = res.data
      let centerArr = res.data.filter(v => v.location === '中心大图')
      data.centerAd = centerArr && centerArr.length > 0 ? centerArr[0] : {}
      let leftArr = res.data.filter(v => v.location === '左侧大图')
      data.leftAd = leftArr && leftArr.length > 0 ? leftArr[0] : {}
      let rightArr = res.data.filter(v => v.location === '右侧大图')
      data.rightAd = rightArr && rightArr.length > 0 ? rightArr[0] : {}

      let centerDownArr = res.data.filter(v => v.location === '中心小图')
      data.centerDownAd = centerDownArr && centerDownArr.length > 0 ? centerDownArr[0] : {}
      let leftDownArr = res.data.filter(v => v.location === '左侧小图')
      data.leftDownAd = leftDownArr && leftDownArr.length > 0 ? leftDownArr[0] : {}
      let rightDownArr = res.data.filter(v => v.location === '右侧小图')
      data.rightDownAd = rightDownArr && rightDownArr.length > 0 ? rightDownArr[0] : {}
    } else {
      ElMessage.error(res.msg)
    }
  })
}

loadAdvertise()
</script>