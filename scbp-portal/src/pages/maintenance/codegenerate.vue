<template>
  <div>
    <div style="float: left"><img src="~#/codegen/video.gif" alt=""></div>
    <div class="mymain">
      <h2>使用说明</h2>
      <div>第1步: 下载<a href="/static/codegen/generator-scbp-0.0.1.tgz">生成器</a></div>
      <div>第2步: 执行 <code>npm install -g yo</code></div>
      <div>第3步: 执行 <code>npm install -g generator-scbp-0.0.1.tgz</code></div>
      <div>第4步:执行 <code>yo scbp</code></div>
      <div>第5步:进入common/dal 执行<code>mvn mybatis-generator:generate</code></div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'codegenerate'
}
</script>
<style scoped>
.mymain{
  display:table-cell !important;
  padding: 50px 0 0 20px;
  font-size: 20px;
}
</style>
