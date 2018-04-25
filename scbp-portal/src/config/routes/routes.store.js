import maintenance from '@/pages/maintenance/z-routes'

let routes = [
  {
    path: '/',
    redirect: '/maintenance',
    name: 'SCBP'
  }
]
// 添加业务路由
routes = routes.concat(maintenance)

export default routes
