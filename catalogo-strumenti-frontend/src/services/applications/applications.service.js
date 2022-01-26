import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class ApplicationsService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }
  findApplications(payload) {
    return axiosCatalog
      .get(this.endpoint + "/tools/" + payload)
      .then(res => {
        var data = res.data ? res.data : [];
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
}
export const applicationsService = new ApplicationsService(
  "/catalog/desktopapplications"
);
