package com.wisenut.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Setter
@Getter
@ToString
@Log
public class QualityMrbDTO {
	private String factory_id;
	private String factory_gubun;
	private String role_out;
}
