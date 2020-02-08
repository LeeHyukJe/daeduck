package com.wisenut.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Setter
@Getter
@ToString
@Log
public class QualityPpapDTO {
	private String biz_place;
	private String ppap_no;
	private String initiator_name;
	private String step_level_pre;
	private String title_pre;
	private String step1_startDate;
	private String step1_endDate;
	private String step6_startDate;
	private String step6_endDate;
	
	public QualityPpapDTO() {
		this.biz_place       = "";
		this.ppap_no         = "";
		this.initiator_name  = "";
		this.step_level_pre  = "";
		this.title_pre       = "";
		this.step1_startDate = "";
		this.step1_endDate= "";
		this.step6_startDate= "";
		this.step6_endDate= "";
	}
}
