package com.wisenut.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Setter
@Getter
@ToString
@Log
public class QualityRawDTO {
	
	private String manufacturer		;
	private String materialsname	;	
	private String materialstype	;	
	private String displayName		;
	private String subject;
	
	public QualityRawDTO() {
		this.manufacturer="";
		this.materialsname="";
		this.materialstype="";
		this.displayName ="";
		this.subject = "";
	}

}
