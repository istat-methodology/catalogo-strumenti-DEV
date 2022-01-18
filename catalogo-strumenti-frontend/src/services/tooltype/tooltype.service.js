import { axiosRegedit } from "@/http";
import AbstractService from "@/services/abstract.service";

class ToolTypeService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }
  save(payload) {
    //console.log(config);
    console.log(payload);
    return axiosRegedit
      .post(this.endpoint, payload)
      .then(res => {
        var data = res.data ? res.data : {};
        console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
}

export const tooltypeService = new ToolTypeService("/catalog/open/tool-types");
