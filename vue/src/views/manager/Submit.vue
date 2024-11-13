<template>
  <div>
    <div class="card" style="margin-bottom: 5px">
      <el-input v-model="data.name" prefix-icon="Search" style="width: 240px; margin-right: 10px"
                placeholder="请输入职位名称查询"></el-input>
      <el-input v-if="data.user.role === 'ADMIN'" v-model="data.employName" prefix-icon="Search"
                style="width: 240px; margin-right: 10px" placeholder="请输入公司名称查询"></el-input>
      <el-button type="info" plain @click="load">查询</el-button>
      <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
    </div>
    <div class="card" style="margin-bottom: 5px">
      <el-button type="primary" plain @click="handleAdd" v-if="data.user.role === 'EMPLOY'">发布职位</el-button>
      <el-button type="danger" plain @click="delBatch" v-if="data.user.role === 'EMPLOY'">批量删除</el-button>
    </div>
    <div class="card" style="margin-bottom: 5px">
      <el-table stripe :data="data.tableData" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55"/>
        <el-table-column prop="employName" label="招聘企业"/>
        <el-table-column prop="name" label="职位名称"/>
        <el-table-column prop="userId" label="投递用户"/>
        <el-table-column prop="userId" label="投递简历"/>
        <el-table-column prop="time" label="投递时间"/>
        <el-table-column prop="status" label="投递状态">
          <template v-slot="scope">
            <el-tag v-if="scope.row.status === '审核通过'" type="success">{{ scope.row.status }}</el-tag>
            <el-tag v-if="scope.row.status === '审核不通过'" type="danger">{{ scope.row.status }}</el-tag>
            <el-tag v-if="scope.row.status === '待审核'" type="warning">{{ scope.row.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="150" fixed="right">
          <template v-slot="scope">
            <el-button v-if="data.user.role === 'EMPLOY'" type="primary" circle :icon="Edit" @click="handleEdit(scope.row)"></el-button>
            <el-button v-if="data.user.role === 'ADMIN'" type="primary" circle :icon="Check" @click="changeStatus(scope.row,'审核通过')"></el-button>
            <el-button v-if="data.user.role === 'ADMIN'" type="primary" circle :icon="Close" @click="changeStatus(scope.row,'审核不通过')"></el-button>
            <el-button type="danger" circle :icon="Delete" @click="handleDelete(scope.row)"></el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="card" v-if="data.total">
      <el-pagination @current-change="load" background layout="prev, pager, next" :page-size="data.pageSize"
                     v-model:current-page="data.pageNum" :total="data.total"/>
    </div>

  </div>
</template>

<script setup>

import request from "@/utils/request.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {Check, Close, Delete, Edit} from "@element-plus/icons-vue";
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import {onBeforeUnmount, reactive, ref, shallowRef} from "vue";


const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
})

const load = () => {
  request.get('/submit/selectPage', {
    params: {

    }
  })
}


</script>

