export default {
  items: [
    {
      name: '服务运维',
      icon: 'icon-social-reddit',
      url: '/maintenance',
      children: [
        {
          name: '注册中心',
          url: '/maintenance/registry',
          icon: 'icon-book-open'

        },
        {
          name: '服务网关',
          url: '/maintenance/gateway',
          icon: 'icon-film'
        },
        {
          name: '配置中心',
          url: '/maintenance/config',
          icon: 'icon-layers'
        },
        {
          name: '监控中心',
          url: '/maintenance/monitor',
          icon: 'icon-speedometer'
        },
        {
          name: '服务追踪',
          url: '/maintenance/zipkin',
          icon: 'icon-social-linkedin'
        },
        {
          name: '服务仓库',
          url: '/maintenance/repository',
          icon: 'icon-social-dropbox'
        },
        {
          name: '代码生成器',
          url: '/maintenance/codegenerate',
          icon: 'icon-social-dropbox'
        },
        {
          name: '文档中心',
          url: '/maintenance/docs',
          icon: 'icon-notebook'
        }
      ]
    }
  ]
}
