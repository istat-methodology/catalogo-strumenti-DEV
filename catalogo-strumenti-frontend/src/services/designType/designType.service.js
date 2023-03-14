import AbstractService from "@/services/abstract.service"
import { axiosCatalog } from "@/http"
class DesignTypeService extends AbstractService {
  constructor(endpoint) {
    super(endpoint)
  }

  filter(payload) {
    console.log(payload)
    var params = new URLSearchParams()
    params.append("parent", payload)
    var request = {
      params: params
    }
    return axiosCatalog
      .get(this.endpoint, request)
      .then((res) => {
        var data = res.data ? res.data : {}
        return data
      })
      .catch(function (error) {
        console.log(error)
      })
  }
}
export const designTypeService = new DesignTypeService(
  "/catalog/open/design-types"
)
export const designTypeByParentService = new DesignTypeService(
  "/catalog/open/design-types-by-parent"
)
