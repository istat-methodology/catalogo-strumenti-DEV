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
    //var gsbpmParam = new URLSearchParams();
    //var typeParam = new URLSearchParams();
    var params = new URLSearchParams();
    payload.gsbpm.map(value => {
      params.append("gsbpmIds", value);
    });
    payload.type.map(value => {
      params.append("type", value);
    });
    var request = {
      params: params
    };
    axiosRegedit
      .get(this.endpoint, request)
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
