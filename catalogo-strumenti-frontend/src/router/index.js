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
        path: "catalogue/tools/modifica/:id",
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
        path: "catalogue/metodi/edit/:id",
        name: "MethodEdit",
        component: () =>
          import("../views/catalogue/statisticalMethods/StatisticalMethodEdit"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/metodi/add",
        name: "MethodAdd",
        component: () =>
          import("../views/catalogue/statisticalMethods/StatisticalMethodAdd"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/metodi/details/:id",
        name: "MethodDetails",
        component: () =>
          import(
            "../views/catalogue/statisticalMethods/StatisticalMethodDetails"
          ),
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
        path: "catalogue/documentazione/edit/:id",
        name: "DocumentationEdit",
        component: () =>
          import("../views/catalogue/documentation/DocumentationEdit"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/documentazione/add",
        name: "DocumentationAdd",
        component: () =>
          import("../views/catalogue/documentation/DocumentationAdd"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/documentazione/details/:id",
        name: "DocumentationDetails",
        component: () =>
          import("../views/catalogue/documentation/DocumentationDetails"),
        meta: { authorize: [] }
      },

      /*****************************************************************************/
      {
        path: "catalogue/businessfunctions",
        name: "BusinessFunctionsList",
        component: () =>
          import("../views/catalogue/businessFunctions/BusinessFunctionsList"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/businessfunctions/edit/:id",
        name: "BusinessFunctionsEdit",
        component: () =>
          import("../views/catalogue/businessFunctions/BusinessFunctionsEdit"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/businessfunctions/add",
        name: "BusinessFunctionsAdd",
        component: () =>
          import("../views/catalogue/businessFunctions/BusinessFunctionsAdd"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/businessfunctions/details/:id",
        name: "BusinessFunctionsDetails",
        component: () =>
          import(
            "../views/catalogue/businessFunctions/BusinessFunctionsDetails"
          ),
        meta: { authorize: [] }
      },
      /*****************************************************************************/
      {
        path: "catalogue/businessprocess",
        name: "BusinessProcessList",
        component: () =>
          import("../views/catalogue/businessprocess/BusinessProcessList"),
        meta: { authorize: [] }
      },
      /*
      {
        path: "catalogue/businessprocess/details/:id",
        name: "BusinessProcessDetails",
        component: () =>
          import("../views/catalogue/businessprocess/BusinessProcessDetails"),
        meta: { authorize: [] }
      },
      */
      
      /*****************************************************************************/
      {
        path: "catalogue/processsteps/",
        name: "ProcessStepsList",
        component: () =>
          import("../views/catalogue/processsteps/ProcessStepsList"),
        meta: { authorize: [] }
      }, 
      /*
      {
        path: "catalogue/processsteps/Add/",
        name: "ProcessStepsAdd",
        component: () =>
          import("../views/catalogue/processsteps/ProcessStepsAdd"),
        meta: { authorize: [] }
      },
      {
        path: "catalogue/processsteps/edit/",
        name: "ProcessStepsEdit",
        component: () =>
          import("../views/catalogue/processsteps/ProcessStepsEdit"),
        meta: { authorize: [] }
      },      
      {
        path: "catalogue/processsteps/details/",
        name: "ProcessStepsDetails",
        component: () =>
          import("../views/catalogue/processsteps/ProcessStepsDetails"),
        meta: { authorize: [] }
      },
      /*****************************************************************************/
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
        path: "catalogue/referenti/dettaglio/:id",
        name: "AgentDetails",
        component: () => import("../views/catalogue/agent/AgentDetails"),
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
