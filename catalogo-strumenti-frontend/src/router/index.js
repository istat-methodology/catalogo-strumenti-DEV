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
      /* {
        path: "catalogue/dailyreport",
        name: "DailyReport",
        component: () => import("../views/catalogue/report/DailyReport"),
        meta: { authorize: [Role.Admin, Role.Supervisor, Role.Reviewer] }
      },
      {
        path: "catalogue/totalreport",
        name: "TotalReport",
        component: () => import("../views/catalogue/report/TotalReport"),
        meta: { authorize: [Role.Admin, Role.Supervisor, Role.Reviewer] }
      }, */
      /* {
        path: "catalogue/address/view/:state",
        name: "AddressList",
        component: () => import("../views/catalogue/address/AddressList"),
        meta: { authorize: [Role.Admin, Role.Supervisor, Role.Reviewer] }
      },
      {
        path: "catalogue/address/edit/:state",
        name: "AddressEdit",
        component: () => import("../views/catalogue/address/AddressEdit"),
        meta: { authorize: [Role.Admin, Role.Supervisor, Role.Reviewer] }
      },
      {
        path: "catalogue/address/block/:state",
        name: "AddressBlock",
        component: () => import("../views/catalogue/address/AddressBlock"),
        meta: { authorize: [Role.Admin, Role.Supervisor, Role.Reviewer] }
      }, */
      /*  {
        path: "catalogue/dug",
        name: "DugList",
        component: () => import("../views/catalogue/dug/DugList"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/dug/add",
        name: "DugAdd",
        component: () => import("../views/catalogue/dug/DugAdd"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },*/
      {
        path: "catalogue/applicazioni",
        name: "DeskAppList",
        component: () => import("../views/catalogue/deskapp/DeskAppList"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/applicazioni/modifica/:id",
        name: "DeskAppEdit",
        component: () => import("../views/catalogue/deskapp/DeskAppEdit"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/applicazioni/aggiungi",
        name: "DeskAppAdd",
        component: () => import("../views/catalogue/deskapp/DeskAppAdd"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/procedure",
        name: "SoftProcList",
        component: () =>
          import("../views/catalogue/softwareproc/SoftwareProcList"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/procedure/modifica/:id",
        name: "SoftProcEdit",
        component: () =>
          import("../views/catalogue/softwareproc/SoftwareProcEdit"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/procedure/aggiungi",
        name: "SoftProcAdd",
        component: () =>
          import("../views/catalogue/softwareproc/SoftwareProcAdd"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/servizi",
        name: "StatServiceList",
        component: () =>
          import("../views/catalogue/statservice/StatServiceList"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/servizi/modifica/:id",
        name: "StatServiceEdit",
        component: () =>
          import("../views/catalogue/statservice/StatServiceEdit"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/servizi/aggiungi",
        name: "StatServiceAdd",
        component: () =>
          import("../views/catalogue/statservice/StatServiceAdd"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/metodi",
        name: "StatMethodList",
        component: () => import("../views/catalogue/statmethod/StatMethodList"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/metodi/modifica/:id",
        name: "StatMethodEdit",
        component: () => import("../views/catalogue/statmethod/StatMethodEdit"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue/metodi/aggiungi",
        name: "StatMethodAdd",
        component: () => import("../views/catalogue/statmethod/StatMethodAdd"),
        meta: { authorize: [Role.Admin, Role.Supervisor] }
      },
      {
        path: "catalogue",
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
        path: "catalogue/dettaglio/:id",
        name: "ToolDetails",
        component: () => import("../views/catalogue/tools/ToolDetails"),
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
