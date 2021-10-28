import { createWebHistory, createRouter } from "vue-router";
import Home from '../../components/home/Home.vue';

import Dashboard from '../../components/dashboard/Dashboard.vue';
import Payment from '../../components/dashboard/Payment.vue';
import Profile from '../../components/profile/Profile.vue';
import Support from '../../components/support/Support.vue';
import Transactions from '../../components/transactions/Transactions.vue';

const routes = [

  {
    path: '/',
    name: 'home',
    component: Home,
    children: [
      {
        path: 'dashboard',
        name: 'dashboard',
        component: Dashboard,
      },
      {
        path: 'profile',
        name: 'profile',
        component: Profile,
      },
      {
        path: 'support',
        name: 'support',
        component: Support,
      },
      {
        path: 'transactions',
        name: 'transactions',
        component: Transactions,
      },
      {
        path: 'payment',
        name: 'payment',
        component: Payment,
      },
    ]
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;