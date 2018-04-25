// Containers
import Full from '@/pages/maintenance/index'
import Dashboard from '@/pages/maintenance/dashboard'
const routes = [
  {
    path: '/maintenance',
    redirect: '/maintenance/registry',
    name: '服务运维',
    component: Full,
    children: [
      {
        path: 'registry',
        name: '注册中心',
        component: Dashboard
      },
      {
        path: 'gateway',
        name: '服务网关',
        component: Dashboard
      },
      {
        path: 'monitor',
        name: '监控中心',
        component: Dashboard
      },
      {
        path: 'zipkin',
        name: '服务追踪',
        component: Dashboard
      },
      {
        path: 'config',
        name: '配置中心',
        component: Dashboard
      },
      {
        path: 'codegenerate',
        name: '代码生成',
        component: () => import('@/pages/maintenance/codegenerate')
      },
      {
        path: 'docs',
        name: '文档中心',
        component: Dashboard
      }
    ]
  }
]

export default routes
