package com.wisenut.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Setter
@Getter
@ToString
@Log
public class QualityEcnDTO {
	private String[] own_outsourced;  	 
	private String route_code		;
	private String route_name		;
	private String doc_no  			;
	private String subject			;
	private String[] grade_class		;
	private String[] grade  			;
	private String initiator_id		;
	private String initiator_name	;
	private String status			;
	private String reg_id			;
	private String modi_id			;
	private String manager_id  		;
	private String manager_name		;
	private String step_number		;
	private String parent_process_id;
	private String[] factory_id;
	
	private String step1_startDate;
	private String step1_endDate;
	private String step6_startDate;
	private String step6_endDate;
	private String step7_startDate;
	private String step7_endDate;
	
	public QualityEcnDTO() {
		this.own_outsourced =null;  	 
		this.route_code			="";
		this.route_name			="";
		this.doc_no  			="";
		this.subject			="";
		this.grade_class		= null;
		this.grade  			= null;
		this.initiator_id		="";
		this.initiator_name		="";
		this.status				="";
		this.reg_id				="";
		this.modi_id			="";
		this.manager_id  		="";
		this.manager_name		="";
		this.step_number		="";
		this.parent_process_id	="";
		this.factory_id = null;
		
		this.step1_startDate = "";
		this.step1_endDate = "";
		this.step6_startDate = "";
		this.step6_endDate = "";
		this.step7_startDate = "";
		this.step7_endDate = "";
		
	}

}
