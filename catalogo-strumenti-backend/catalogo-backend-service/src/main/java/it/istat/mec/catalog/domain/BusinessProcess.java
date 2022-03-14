package it.istat.mec.catalog.domain;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import it.istat.mec.catalog.bean.AbstractDomainObject;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "CSM_BUSINESS_PROCESS")
@JsonIgnoreProperties(ignoreUnknown = true)
public class BusinessProcess extends AbstractDomainObject implements Serializable {

    private static final long serialVersionUID = 1L;


    @Column(name = "LABEL")
    private String label;
    @Column(name = "ORDER_CODE")
    private Short order;

    //@ManyToMany(mappedBy = "businessProcesses")
    //private List<BusinessFunction> businessFunctions;

    @JsonManagedReference
    @ManyToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name = "PARENT")
    private BusinessProcess businessProcessParent;

    @JsonBackReference
    @ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    @JoinTable(name = "csm_link_process_step", joinColumns = @JoinColumn(name = "BUSINESS_PROCESS_ID"), inverseJoinColumns = @JoinColumn(name = "PROCESS_STEP_ID"))
    @OrderBy(value = "id")
    private List<ProcessStep> businessSteps;
    @JsonBackReference
    @OneToMany(mappedBy = "businessProcessParent")
    @OrderBy("order")
    private List<BusinessProcess> businessSubProcesses = new ArrayList<>();


    public BusinessProcess() {
    }

    public BusinessProcess(Long idFunction) {
        super();
        this.id = idFunction;
    }

}
