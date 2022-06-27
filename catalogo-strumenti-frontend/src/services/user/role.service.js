import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class RoleService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }

  findAll() {
    return axiosCatalog
      .get(this.endpoint)
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
export const roleService = new RoleService("/user/roles");
export const roleOpenService = new RoleService("/user/open/roles");
