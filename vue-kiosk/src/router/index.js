import { createRouter, createWebHistory } from 'vue-router'
import PaymentView from '../views/pointpay/PaymentView.vue'
import PointSaveView from '../views/pointpay/PointSaveView.vue'

const routes = [
  {
    path: '/payment',
    name: 'paymentview',
    component: PaymentView
  },
  {
    path: '/pointsave',
    name: 'pointsave',
    component: PointSaveView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
