package com.wisenut.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Setter
@Getter
@ToString
@Log
public class QualityAnalysisDTO {
	private String subject;
	private String initiator_name;
	private String manager_name;
	
	private String recompl_startDate;
	private String recompl_endDate;
	private String step1_startDate;
	private String step1_endDate;

	public QualityAnalysisDTO() {
		this.subject = "";
		this.initiator_name = "";
		this.manager_name = "";
		
		this.recompl_startDate = "";
		this.recompl_endDate = "";
		this.step1_startDate = "";
		this.step1_endDate = "";
	}

}
