import { createRouter, createWebHistory } from 'vue-router'
import PaymentView from '../views/pointpay/PaymentView.vue'
import PointSaveView from '../views/pointpay/PointSaveView.vue'
import ReceiptView from '../views/pointpay/ReceiptView.vue'

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
  },
  {
    path: '/',
    name: 'receipt',
    component: ReceiptView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
