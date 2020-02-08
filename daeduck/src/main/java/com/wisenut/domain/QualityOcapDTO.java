package com.wisenut.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Setter
@Getter
@ToString
@Log
public class QualityOcapDTO {
	private String ocap_detail;
	private String ocap_search;
	
	public QualityOcapDTO() {
		this.ocap_detail = "";
		this.ocap_search="";
	}


}
