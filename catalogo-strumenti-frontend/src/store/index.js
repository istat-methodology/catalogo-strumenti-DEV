import Vue from "vue";
import Vuex from "vuex";

import { auth } from "./modules/auth";
import { error } from "./modules/error";
import { coreui } from "./modules/coreui";
import { filter } from "./modules/filters";
import { message } from "./modules/message";
/* import { address } from "./modules/address/address";
import { dug } from "./modules/address/dug"; */
import { user } from "./modules/user/user";
import { role } from "./modules/user/role";
import { tools } from "./modules/tools/toolscatalog";
import { methods } from "./modules/methods/statisticalMethods";
import { version } from "./modules/versioning/appversion";
/* import { applications } from "./modules/applications/applications";
import { methods } from "./modules/methods/methods";
import { procedures } from "./modules/procedures/procedures";
import { services } from "./modules/services/services"; */
import { gsbpm } from "./modules/gsbpm/gsbpm";
import { tooltype } from "./modules/tooltype/tooltype";
import { documentation } from "./modules/documentation/documentation";
import { documentationType } from "./modules/documentationType/documentationType";
import { bFunction } from "./modules/businessFunctions/businessFunctions";
import { agent } from "./modules/agent/agentTools";
import { appservice } from "./modules/appservice/appservice";
import { stepinstance } from "./modules/stepinstance/stepInstanceService";
import { linkedagent } from "./modules/linkedAgent/linkedAgentTools";
import { businessService } from "./modules/service/businessService";
import { procStep } from "./modules/processSteps/processSteps";
import { bProcess } from "./modules/businessProcesses/businessProcesses";
import { designtypes } from "./modules/designType/designType";

/* import { progress } from "./modules/report/progress";
import { daily } from "./modules/report/daily";
import { pivot } from "./modules/report/pivot";
import { version } from "./modules/versioning/appversion";
import { elencoComuni } from "./modules/comuni/comuni";
import { massive } from "./modules/massive/massive"; */

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    tools,
    methods,
    documentation,
    agent,
    linkedagent,
    appservice,
    stepinstance,
    bFunction,
    businessService,
    documentationType,
    procStep,
    bProcess,
    designtypes,

    /* 
    applications,
    methods,
    procedures,
    services, 
    */
    auth,
    error,
    gsbpm,
    coreui,
    message,
    version,
    tooltype,
    /*
    address,
    dug, 
    */
    user,
    filter,
    /*
    progress,
    daily,
    pivot,
    version,
    elencoComuni,
    massive, 
    */
    role
  }
});
