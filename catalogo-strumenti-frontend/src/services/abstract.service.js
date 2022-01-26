import { axiosCatalog } from "@/http";
import { config } from "@/common";

export default class AbstractService {
  constructor(endpoint) {
    this.endpoint = endpoint;
  }

  findAll() {
    return axiosCatalog
      .get(this.endpoint + "/")
      .then(res => {
        var data = res.data ? res.data : [];
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }

  findById(id) {
    return axiosCatalog
      .get(this.endpoint + "/" + id)
      .then(res => {
        var data = res.data ? res.data : {};
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }

  save(formData) {
    return axiosCatalog
      .post(this.endpoint, formData, config)
      .then(res => {
        var data = res.data ? res.data : {};
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }

  update(formData) {
    return axiosCatalog
      .put(this.endpoint + "/" + formData.id, formData, config)
      .then(res => {
        var data = res.data ? res.data : {};
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }

  delete(id) {
    return axiosCatalog
      .delete(this.endpoint + "/" + id)
      .then(res => {
        //console.log(res.data);
        return res.data;
      })
      .catch(err => {
        throw err;
      });
  }
}
