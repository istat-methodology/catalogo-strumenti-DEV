import { axiosRegedit } from "@/http";
import AbstractService from "@/services/abstract.service";

class ToolsService extends AbstractService {
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
  filter(payload) {
    console.log(payload);
    axiosRegedit
      .get(this.endpoint, {
        params: {
          gsbpmIds: [21, 22], //JSON.stringify(payload.gsbpm ? payload.gsbpm : {}),
          type: 1 //JSON.stringify(payload.type ? payload.type : {})
        },
        paramsSerializer: params =>
          JSON.stringify(params, { arrayFormat: "repeat" })
      })
      .then(res => {
        var data = res.data ? res.data : {};
        console.log(data);
        return data;
      })
      .catch(function(error) {
        console.log(error);
      });
  }
}

export const toolsService = new ToolsService("/catalog/tools");
export const toolsOpenService = new ToolsService("/catalog/open/tools");
