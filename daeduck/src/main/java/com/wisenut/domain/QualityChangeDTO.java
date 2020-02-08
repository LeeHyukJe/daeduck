package com.wisenut.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Setter
@Getter
@ToString
@Log

public class QualityChangeDTO {
	private String fault_name 	    ;	
	private String[] grade 			;
	private String submit 			;
	private String quality_id 		;
	private String subject 			;
	private String req_return_date 	;
	private String szprogress 		;
	private String rec_quality_id	;
	private String initiator_id 	;	
	private String initiator_name	;
	private String cs_quality_name	;
	private String rec_quality_name	;
	private String manager_id 		;
	private String manager_name 	;	
	private String parent_process_id ;
	private String drop_reason     	;
	private String rec_step1_name  	;
	private String[] main_route_name   ;
	private String[] simsa_gubun 		;
	private String self_gubun   	;	
	private String re_occur 		;	
	private String comname  		;	
	private String[] biz_place;
	private String[] status;	
	
	private String step2_startDate;
	private String step2_endDate;
	private String step4_startDate;
	private String step4_endDate;
	
	public QualityChangeDTO() {
		this.fault_name 	    = "";	
		this.grade				= null;
		this.submit 			= "";
		this.quality_id 		= "";
		this.subject 			= "";
		this.req_return_date 	= "";
		this.szprogress 		= "";
		this.rec_quality_id		= "";
		this.initiator_id 		= "";	
		this.initiator_name		= "";
		this.cs_quality_name	= "";
		this.rec_quality_name	= "";
		this.manager_id 		= "";
		this.manager_name 		= "";	
		this.parent_process_id 	= "";
		this.drop_reason     	= "";
		this.rec_step1_name  	= "";
		this.main_route_name   	= null;
		this.simsa_gubun 		= null;
		this.self_gubun   		= "";	
		this.re_occur 			= "";	
		this.comname  			= "";	
		this.biz_place			= null;
		this.status				= null;	
		
		
		this.step2_startDate = "";
		this.step2_endDate = "";
		this.step4_startDate = "";
		this.step4_endDate = "";
	}

}
