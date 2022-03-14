package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import it.istat.mec.catalog.bean.AbstractDomainObject;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@EqualsAndHashCode(callSuper = false, exclude = "stepInstances")
@Table(name = "CSM_PROCESS_STEP")
public class ProcessStep extends AbstractDomainObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column(name = "LABEL")
    private String label;
    @JsonManagedReference
    @ManyToOne
    @JoinColumn(name = "BUSINESS_SERVICE_ID")
    private BusinessService businessService;
    @JsonBackReference
    @ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    @JoinTable(name = "csm_link_step_instance", joinColumns = {
            @JoinColumn(name = "PROCESS_STEP_ID")}, inverseJoinColumns = {
            @JoinColumn(name = "PROCESS_STEP_INSTANCE_ID")})

    private List<StepInstance> stepInstances;


    @ManyToMany(mappedBy = "businessSteps")
    private List<BusinessProcess> businessProcesses;

    public ProcessStep() {
    }

    public ProcessStep(Long id) {
        super();
        this.id = id;
    }
}
