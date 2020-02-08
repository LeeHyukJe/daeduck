package com.wisenut.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Setter
@Getter
@ToString
@Log
public class QualityLibrary2DTO {

	private String plant			;
	private String processname	;
	private String[] eds			;
	private String entry_no		;
	private String color	;
	private String ftir_result	;

	public QualityLibrary2DTO() {
		this.plant			= "";
		this.processname	= "";
		this.eds			= null;
		this.entry_no		= "";
		this.color			= "";
		this.ftir_result	= "";
	}


}
