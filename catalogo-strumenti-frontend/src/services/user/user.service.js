import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class UserService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }

  findByRole(role) {
    return axiosCatalog
      .get(this.endpoint, {
        params: {
          role: role
        }
      })
      .then(res => {
        var data = res.data ? res.data : [];
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
  findAllUsers() {
    return axiosCatalog
      .get(this.endpoint, {
        params: {
          role: null
        }
      })
      .then(res => {
        var data = res.data ? res.data : [];
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
  changePass(data) {
    return axiosCatalog
      .put(this.endpoint + "/password-id/" + data.id, data)
      .then(res => {
        var data = res.data ? res.data : [];
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
  resetPass(data) {
    return axiosCatalog
      .put(this.endpoint + "/password-reset/" + data.id, data)
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
export const userService = new UserService("/user/users");
export const userOpenService = new UserService("/user/open/users");
