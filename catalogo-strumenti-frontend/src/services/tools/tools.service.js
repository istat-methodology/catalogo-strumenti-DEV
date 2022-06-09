import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class ToolsService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }
  save(payload) {
    //console.log(config);
    console.log(payload);
    return axiosCatalog
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
    if (payload.gsbpm) {
      payload.gsbpm.map(value => {
        params.append("gsbpmIds", value);
      });
    }
    if (payload.type) {
      payload.type.map(value => {
        params.append("type", value);
      });
    }
    var request = {
      params: params
    };
    return axiosCatalog
      .get(this.endpoint, request)
      .then(res => {
        var data = res.data ? res.data : {};
        return data;
      })
      .catch(function(error) {
        console.log(error);
      });
  }

  findToolsByBFunctions(id) {
    return axiosCatalog
      .get(this.endpoint + "/business-functions/" + id)
      .then(res => {
        var data = res.data ? res.data : {};

        return data;
      })
      .catch(err => {
        throw err;
      });
  }
  findToolsByDocumentation(id) {
    return axiosCatalog
      .get(this.endpoint + "/documentations/" + id)
      .then(res => {
        var data = res.data ? res.data : {};

        return data;
      })
      .catch(err => {
        throw err;
      });
  }
  addDocumentation(id,docID) {
    return axiosCatalog
      .put(this.endpoint + "/"+id+"/documentation-add/"+ docID)
      .then(res => {
        var data = res.data ? res.data : [];
      
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
  removeDocumentation(id,docID) {
    return axiosCatalog
      .put(this.endpoint + "/"+id+"/documentation-remove/"+ docID)
      .then(res => {
        var data = res.data ? res.data : [];
      
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
}

export const toolsService = new ToolsService("/catalog/tools");
export const toolsOpenService = new ToolsService("/catalog/open/tools");
