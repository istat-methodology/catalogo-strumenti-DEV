import { axiosCatalog } from "@/http"
import AbstractService from "@/services/abstract.service"

class LinkedAgentService extends AbstractService {
  constructor(endpoint) {
    super(endpoint)
  }
  save(payload) {
    //console.log(config);
    console.log(payload)
    return axiosCatalog
      .post(this.endpoint, payload)
      .then((res) => {
        var data = res.data ? res.data : {}
        console.log(data)
        return data
      })
      .catch((err) => {
        throw err
      })
  }
  findByCatalogTool(id) {
    return axiosCatalog
      .get(this.endpoint + "/tool/" + id)
      .then((res) => {
        var data = res.data ? res.data : {}

        return data
      })
      .catch((err) => {
        throw err
      })
  }
}

export const linkedAgentService = new LinkedAgentService(
  "/catalog/linkagenttools"
)
export const linkedAgentOpenService = new LinkedAgentService(
  "/catalog/open/linkagenttools"
)
