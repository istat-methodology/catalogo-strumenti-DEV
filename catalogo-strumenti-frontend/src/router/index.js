import Vue from "vue";
import VueRouter from "vue-router";
import store from "@/store";
import { Role } from "@/common";
import Home from "@/views/Home";

Vue.use(VueRouter);

const routes = [
  {
    path: "/login",
    component: () => import("../views/auth/Login"),
    meta: { authorize: [] }
  },
  {
    path: "/register",
    component: () => import("../views/auth/Register"),
    meta: { authorize: [] }
  },
  {
    path: "/error",
    component: () => import("../views/error/Error"),
    meta: { authorize: [] }
  },
  {
    path: "/unauthorized",
    component: () => import("../views/error/Unauthorized"),
    meta: { authorize: [] }
  },
  {
    path: "/",
    redirect: "/catalogue",
    name: "Home",
    component: Home,
    meta: { authorize: [] },
    children: [
      {
        path: "catalogue",
        name: "Catalogue",
        component: () => import("../views/catalogue/Catalogue"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/tools",
        name: "ToolList",
        component: () => import("../views/catalogue/tools/ToolList"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/aggiungi",
        name: "ToolAdd",
        component: () => import("../views/catalogue/tools/ToolAdd"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/modifica/:id",
        name: "ToolEdit",
        component: () => import("../views/catalogue/tools/ToolEdit"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/tools/dettaglio/:id",
        name: "ToolDetails",
        component: () => import("../views/catalogue/tools/ToolDetails"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/metodi",
        name: "MethodList",
        component: () =>
          import("../views/catalogue/statisticalMethods/StatisticalMethodList"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/metodi/modifica/:id",
        name: "MethodEdit",
        component: () =>
          import("../views/catalogue/statisticalMethods/StatisticalMethodEdit"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/metodi/aggiungi",
        name: "MethodAdd",
        component: () =>
          import("../views/catalogue/documentation/DocumentationAdd"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/documentazione",
        name: "DocumentationList",
        component: () =>
          import("../views/catalogue/documentation/DocumentationList"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/documentazione/modifica/:id",
        name: "DocumentationEdit",
        component: () =>
          import("../views/catalogue/documentation/DocumentationEdit"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/documentazione/aggiungi",
        name: "DocumentationAdd",
        component: () =>
          import("../views/catalogue/documentation/DocumentationAdd"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/referenti",
        name: "AgentList",
        component: () => import("../views/catalogue/agent/AgentList"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/referenti/modifica/:id",
        name: "AgentEdit",
        component: () => import("../views/catalogue/agent/AgentEdit"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/referenti/aggiungi",
        name: "AgentAdd",
        component: () => import("../views/catalogue/agent/AgentAdd"),
        meta: { authorize: [] }
      },
      {
        path: "settings/users",
        name: "UserList",
        component: () => import("../views/settings/user/UserList"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "settings/users/edit/:id",
        name: "UserEdit",
        component: () => import("../views/settings/user/UserEdit"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "settings/users/passreset/:id",
        name: "UserPassReset",
        component: () => import("../views/settings/user/UserPassReset"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "settings/passchange",
        name: "UserPassChange",
        component: () => import("../views/settings/UserPassChange"),
        meta: { authorize: [] }
      },
      {
        path: "settings/users/delete/:id",
        name: "UserDelete",
        component: () => import("../views/settings/user/UserDelete"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "settings/users/add/",
        name: "UserAdd",
        component: () => import("../views/settings/user/UserAdd"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      }
    ]
  },
  { path: "*", redirect: "/" }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

router.beforeEach((to, from, next) => {
  // redirect to unauthorized page if not logged and trying to access a restricted page
  const { authorize } = to.meta;
  const isAuthenticated = store.getters["auth/isAuthenticated"];
  const userRole = store.getters["auth/role"];

  if (authorize.length) {
    if (!isAuthenticated || !authorize.includes(userRole)) {
      store.dispatch("message/warning", "Non sei autorizzato ad accedere!");
      next({ name: "Home" });
    } else {
      next();
    }
  } else {
    next();
  }
});

export default router;
