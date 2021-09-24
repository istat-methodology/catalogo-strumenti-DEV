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
      .post(this.endpoint, {
        id: 0,
        data: payload.data,
        descrizione: payload.descrizione,
        homepage: payload.homepage,
        download: payload.download,
        metodoStatistico: payload.metodoStatistico,
        nome: payload.nome,
        note: payload.note,
        standard: payload.standard,
        tags: payload.tags,
        versione: payload.versione,
        tipologia: payload.tipologia,
        riferimenti: payload.riferimenti,
        license: payload.license
      })
      .then(res => {
        var data = res.data ? res.data : {};
        console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
  upeate(payload) {
    //console.log(config);
    console.log(payload);
    return axiosRegedit
      .put(this.endpoint, {
        id: 0,
        data: payload.data,
        descrizione: payload.descrizione,
        homepage: payload.homepage,
        download: payload.download,
        metodoStatistico: payload.metodoStatistico,
        nome: payload.nome,
        note: payload.note,
        standard: payload.standard,
        tags: payload.tags,
        versione: payload.versione,
        tipologia: payload.tipologia,
        riferimenti: payload.riferimenti,
        license: payload.license
      })
      .then(res => {
        var data = res.data ? res.data : {};
        console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
  /* findAll() {
    return axiosRegedit
      .get(this.endpoint)
      .then(res => {
        var data = res.data ? res.data : [];
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  } */
}
export const toolsService = new ToolsService("/catalogue/tools");
