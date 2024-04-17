import { createRouter as createRouter, createWebHistory } from 'vue-router'
import { useStore } from 'vuex'

// Import components
import HomeView from '../views/HomeView.vue';
import LoginView from '../views/LoginView.vue';
import LogoutView from '../views/LogoutView.vue';
import RegisterView from '../views/RegisterView.vue';
import BreweryListView from '../views/BreweryListView.vue';
import BreweryPageView from '../views/BreweryPageView.vue';
import DashboardView from '../views/DashboardView.vue';
import DeleteBeerView from '../views/DeleteBeerView.vue';
import UpdateBreweryView from '../views/UpdateBreweryView.vue';
import NewBreweryView from '../views/NewBreweryView.vue';
import PubCrawlView from '../views/PubCrawlView.vue';
import BreweryRouletteView from '../views/BreweryRouletteView.vue';
import SearchResultsView from '../views/SearchResultsView.vue';


/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */
const routes = [
  {
    path: '/search/:query', // Example: /search/query
    name: 'search',
    component: SearchResultsView,
    meta: {
      requiresAuth: false,
    },
  },
  {
    path: '/',
    name: 'home',
    component: HomeView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/login",
    name: "login",
    component: LoginView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/logout",
    name: "logout",
    component: LogoutView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/register",
    name: "register",
    component: RegisterView,
    meta: {
      requiresAuth: false
    }
  },
    {
    path: "/brewery",
    name: "brewery",
    component: BreweryListView,
    meta: {
      requiresAuth: false
    }
  },

    {
      path: "/brewery/:id",
      name: "brewery-detail",
      component: BreweryPageView,
      meta: {
        requiresAuth: false
      }
    },

    // Dashboard
    {
    path: "/add",
    name: "add",
    component: DashboardView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/delete",
    name: "delete",
    component: DeleteBeerView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/update",
    name: "update",
    component:UpdateBreweryView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/new",
    name: "new",
    component: NewBreweryView,
    meta: {
      requiresAuth: false
    },
  },
  // {
  //   path: "/brewery/pub_crawl",
  //   name: "pub-crawl",
  //   component: PubCrawlView,
  //   meta: {
  //     requiresAuth: false
  //   },
  // },
  {
    path: "/brewery/roulette",
    name: "roulette",
    component: BreweryRouletteView,
    meta: {
      requiresAuth: false
    },
  },
  {
    path: "/map",
    name: "map",
    component: PubCrawlView
  }
  
];

// Create the router
const router = createRouter({
  history: createWebHistory(),
  routes: routes
});

router.beforeEach((to) => {

  // Get the Vuex store
  const store = useStore();

  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    return {name: "login"};
  }
  // Otherwise, do nothing and they'll go to their next destination
});

export default router;
