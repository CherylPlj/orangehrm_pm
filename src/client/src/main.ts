/**
 * OrangeHRM is a comprehensive Human Resource Management (HRM) System that captures
 * all the essential functionalities required for any enterprise.
 * Copyright (C) 2006 OrangeHRM Inc., http://www.orangehrm.com
 *
 * OrangeHRM is free software: you can redistribute it and/or modify it under the terms of
 * the GNU General Public License as published by the Free Software Foundation, either
 * version 3 of the License, or (at your option) any later version.
 *
 * OrangeHRM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with OrangeHRM.
 * If not, see <https://www.gnu.org/licenses/>.
 */

import {createApp} from 'vue';
import components from './components';
import pages from './pages';
import acl, {AclAPI} from './core/plugins/acl/acl';
import toaster, {ToasterAPI} from './core/plugins/toaster/toaster';
import createI18n, {TranslateAPI} from './core/plugins/i18n/translate';
import '@ohrm/oxd/fonts.css';
import '@ohrm/oxd/icons.css';
import '@ohrm/oxd/style.css';
import './core/styles/global.scss';
import './core/plugins/toaster/toaster.scss';
import './core/plugins/loader/loader.scss';

const app = createApp({
  name: 'App',
  components: pages,
});

// Global Register Components
app.use(components);

// Ensure all page components are globally available
Object.entries(pages).forEach(([name, component]) => {
  app.component(name, component);
});

app.use(toaster, {
  duration: 2500,
  persist: false,
  animation: 'oxd-toast-list',
  position: 'bottom',
});

// Get base URL with fallback
// @ts-expect-error: appGlobal is not in window object by default
const baseUrl = window.appGlobal?.baseUrl || '/web/index.php';

const {i18n, init} = createI18n({
  baseUrl: baseUrl,
  resourceUrl: '/core/i18n/messages',
});

app.use(acl);
app.use(i18n);

// https://github.com/vuejs/vue-next/pull/982
declare module '@vue/runtime-core' {
  interface ComponentCustomProperties {
    $toast: ToasterAPI;
    $can: AclAPI;
    $t: TranslateAPI;
  }
}

app.config.globalProperties.global = {
  baseUrl,
};

// Initialize with error handling
init()
  .then(() => {
    console.log('OrangeHRM application initialized successfully');
    app.mount('#app');
  })
  .catch((error) => {
    console.error('Failed to initialize OrangeHRM application:', error);
    // Show error message to user
    const appElement = document.getElementById('app');
    if (appElement) {
      appElement.innerHTML = `
        <div style="text-align: center; padding: 50px; font-family: Arial, sans-serif;">
          <h2>OrangeHRM Application Error</h2>
          <p>Failed to initialize the application. Please check the console for more details.</p>
          <p>Error: ${error.message}</p>
        </div>
      `;
    }
  });
