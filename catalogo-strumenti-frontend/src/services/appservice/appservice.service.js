import { axiosCatalog } from "@/http"
import AbstractService from "@/services/abstract.service"

class AppsService extends AbstractService {
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
}
export const appsService = new AppsService("/catalog/app-services")

export const appsOpenService = new AppsService("/catalog/open/app-services")
