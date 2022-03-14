package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

@Data
@Entity
@Table(name = "CSM_STEP_INSTANCE")
@NamedQuery(name = "StepInstance.findAll", query = "SELECT s FROM StepInstance s")
public class StepInstance implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;
    @Column(name = "METHOD")
    private String method;
    @Column(name = "DESCR")
    private String descr;
    @Column(name = "LABEL")
    private String label;

    @ManyToMany(mappedBy = "stepInstances", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonBackReference
    private List<ProcessStep> processSteps;


    public StepInstance() {
    }

    public StepInstance(Long id) {
        this.id = id;
    }

}
