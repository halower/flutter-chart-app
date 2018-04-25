export default {
  namespaced: true,
  state: {
    maintenance: [
      {
        name: '注册中心',
        url: 'http://192.168.1.161:9001/'
      },
      {
        name: '服务网关',
        url: 'http://192.168.1.161:9004/swagger-ui.html'
      },
      {
        name: '监控中心',
        url: 'http://192.168.1.161:9006'
      },
      {
        name: '服务追踪',
        url: 'http://192.168.1.161:9411/zipkin/'
      },
      {
        name: '配置中心',
        url: 'http://192.168.1.161:9011'
      },
      {
        name: '文档中心',
        url: 'http://192.168.1.158/huyanfang/scbp-document'
      }
    ]
  },
  getters: {
    getCurrentUrl: (state) => (name) => {
      return state.maintenance.find(m => m.name === name).url
    }
  }
}
