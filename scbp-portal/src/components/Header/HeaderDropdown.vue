<template>
      <b-nav-item-dropdown right no-caret>
        <template slot="button-content">
          <img src="/static/img/avatars/6.jpg" class="img-avatar" alt="admin@bootstrapmaster.com">
        </template>
        <b-dropdown-header tag="div" class="text-center"><strong>账户管理</strong></b-dropdown-header>
        <b-dropdown-item><i class="fa fa-bell-o"></i> 异常通知<b-badge variant="info">{{itemsCount}}</b-badge></b-dropdown-item>
        <b-dropdown-item><i class="fa fa-envelope-o"></i> 消息通知<b-badge variant="success">{{itemsCount}}</b-badge></b-dropdown-item>
        <b-dropdown-item><i class="fa fa-lock"></i> 退出</b-dropdown-item>
      </b-nav-item-dropdown>
</template>
<script>
export default {
  name: 'header-dropdown',
  data: () => {
    return { itemsCount: 10 }
  }
}
</script>
