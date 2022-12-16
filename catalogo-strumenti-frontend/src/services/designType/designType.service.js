import AbstractService from "@/services/abstract.service";

class DesignTypeService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  } 
}
export const designTypeService = new DesignTypeService("/catalog/open/design-types");

