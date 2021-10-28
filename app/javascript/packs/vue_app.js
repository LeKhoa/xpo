/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import { createApp } from 'vue'
import axios from 'axios'
import App from '../components/App.vue'
import store from './store'
import router from './router'

let app;
document.addEventListener('turbolinks:load', () => {
  const el = document.getElementById('app')
  app = createApp(App, { dataCurrentUser: JSON.parse(el.dataset.currentUser) })

  // config global
  app.config.globalProperties.$http = axios;
  app.config.globalProperties.$http.defaults.headers.common['X-CSRF-Token'] =
    document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  
  app.use(store)
  app.use(router)
  app.config.globalProperties.$store=store;

  app.mount('#app')
});

document.addEventListener('turbolinks:before-render', () => {
  if (app)
    app.unmount();
});
