/**
 * Copyright 2019 ISTAT
 * <p>
 * Licensed under the EUPL, Version 1.1 or – as soon they will be approved by
 * the European Commission - subsequent versions of the EUPL (the "Licence");
 * You may not use this work except in compliance with the Licence. You may
 * obtain a copy of the Licence at:
 * <p>
 * http://ec.europa.eu/idabc/eupl5
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the Licence is distributed on an "AS IS" basis, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * Licence for the specific language governing permissions and limitations under
 * the Licence.
 *
 * @author Francesco Amato <framato @ istat.it>
 * @author Mauro Bruno <mbruno @ istat.it>
 * @author Paolo Francescangeli  <pafrance @ istat.it>
 * @author Renzo Iannacone <iannacone @ istat.it>
 * @author Stefano Macone <macone @ istat.it>
 * @version 1.0
 */
package it.istat.mec.catalog.domain;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "CSM_GSBPM_PROCESS")
public class GsbpmProcess  implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "CODE")
    private String code;
    @Column(name = "NAME")
    private String name;
    @Column(name = "PHASE")
    private Integer phase;

    @Column(name = "SUBPROCESS")
    private Short subProcess;
    @Column(name = "ACTIVE")
    private Boolean active;
    
    @JsonManagedReference
    @ManyToOne(cascade = {CascadeType.ALL},fetch = FetchType.LAZY )
    @JoinColumn(name = "PHASE",referencedColumnName = "id", insertable=false, updatable=false,nullable = true)
    private GsbpmProcess gsbpmProcessParent;

    @OneToMany(mappedBy = "gsbpmProcessParent",fetch = FetchType.LAZY)
    private List<GsbpmProcess> gsbpmSubProcesses = new ArrayList<>();
  /*  
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "csm_link_gsbpm_business_function", joinColumns = {
            @JoinColumn(name = "GSBPM_ID", referencedColumnName = "ID", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "BUSINESS_FUNCTION_ID", referencedColumnName = "ID", nullable = false)})
	private List<BusinessFunction> businessFunctions;
   */
    public GsbpmProcess() {
    }

    public GsbpmProcess(Integer id) {
        super();
        this.id = id;
    }

}



