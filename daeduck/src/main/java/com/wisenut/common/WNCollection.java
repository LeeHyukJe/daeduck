package com.wisenut.common;

public class WNCollection {

    public static String SEARCH_IP = "192.168.8.36";
//	public static String SEARCH_IP = "192.168.7.144";
//    public static String SEARCH_IP = "127.0.0.1";
    public static int SEARCH_PORT = 7000;

    public static String MANAGER_IP = "192.168.8.36";
//    public static String MANAGER_IP = "192.168.7.144";
//    public static String MANAGER_IP = "127.0.0.1";
    public static int MANAGER_PORT = 7800;

    public static String[] COLLECTIONS = new String[]{"app","bbs","standard","technology","mrb","ppap","ecn","change","ocap","analysis","library1","library2","raw"};
	public static String[] COLLECTIONS_NAME = new String[]{"app","bbs","standard","technology","mrb","ppap","ecn","change","ocap","analysis","library1","library2","raw"};

    public static String[] MERGE_COLLECTIONS = new String[]{""};

    public String[][] COLLECTION_INFO = null;

    public String[][] MERGE_COLLECTION_INFO = null;

    public WNCollection() {

        // (virtual) merge collection
        /*
         * MERGE_COLLECTION_INFO = new String[][] { { "merge_sample_bbs", // set merge
         * collection name "sample_bbs/sample_edu", // set collection name, delimiter: /
         * "0,3", // set merge collection pageinfo (start,count)
         * "DOCID,TITLE,WRITER,CONTENT",// set merge document field
         * "DOCID,TITLE,WRITER,CONTENT/DOCID,TITLE,WRITER,CONTENT", // set document
         * field, delimiter: / "", // set merge collection multi-group-by field "", //
         * set merge collection multi-group-by field, delimiter: / "", // set merge
         * collection category-group-by field "" // set collection multi-group-by field,
         * delimiter: / } };
         */

        COLLECTION_INFO = new String[][]{
                
        	{
    			"app", // set index name
    			"app", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"BODY,SUBJECT,ATTACHNAME,ATTACH,CreatorName,FORM_NAME,DOC_NO,FOLDER_NAME,INITIATOR_NAME",// set search field
    			"DOCID,FORM_INST_ID,FORM_PREFIX,FORM_NAME,BODY/200,SUBJECT,DOC_NO,INITIATOR_ID,INITIATOR_NAME,INITIATOR_OU_ID,CreatorName,INITIATED_DATE,DATE,APPROVAL_CCINFO,TechnologyDOC,ATTACH,ATTACHNAME,AUTHORITY,TYPE,FOLDER_NAME,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS,AUTHORITY,TechnologyDOC", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"app" // collection display name
    			}
             ,
    			{
    			"bbs", // set index name
    			"bbs", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"SUBJECT,BODY,CreatorName,FolderName,CreatorDept",// set search field
    			"DOCID,FD_ID,FolderName,FolderPath,SUBJECT,BODY,ExpiredDate,DATE,CreatorName,CreatorDept,ATTACHNAME,ATTACH,Authority1,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS,Authority1,Authoritytype,Postauth1,Postauth2", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"bbs" // collection display name
    			}
             ,
    			{
    			"standard", // set index name
    			"standard", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"SUBJECT,BODY,FolderName,CreatorName,CreatorDept",// set search field
    			"DOCID,FD_ID,FolderName,FolderPath,SUBJECT,BODY/200,ExpiredDate,DATE,CreatorName,CreatorDept,AttachName,AttachName2,AttachName3,AttachName4,ATTACH,ATTACH2,ATTACH3,ATTACH4,Authority1,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS,Authority1,Authority2", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"standard" // collection display name
    			},
    			{
        			"technology", // set index name
        			"app", // set collection name
        			"0,3",  // set pageinfo (start,count)
        			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
        			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
        			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
        			"BODY,SUBJECT,ATTACHNAME,ATTACH,CreatorName",// set search field
        			"DOCID,FORM_INST_ID,FORM_PREFIX,FORM_NAME,BODY/200,SUBJECT,DOC_NO,INITIATOR_ID,INITIATOR_NAME,INITIATOR_OU_ID,CreatorName,INITIATED_DATE,DATE,APPROVAL_CCINFO,TechnologyDOC,ATTACH,ATTACHNAME,AUTHORITY,TYPE,ALIAS",// set document field
        			"", // set date range
        			"", // set rank range
        			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
        			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
        			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
        			"", // set filter operation (<fieldname:operator:value>)
        			"", // set groupby field(field, count)
        			"", // set sort field group(field/order,field/order,...)
        			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
        			"", // set categoryGroupBy (fieldname:value)
        			"", // set categoryQuery (fieldname:value)
        			"", // set property group (fieldname,min,max, groupcount)
        			"ALIAS,AUTHORITY,TechnologyDOC", // use check prefix query filed
        			"DATE", // set use check fast access field
        			"", // set multigroupby field
        			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
        			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
        			"technology" // collection display name
        			}
             ,
    			{
    			"mrb", // set index name
    			"mrb", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"FACTORY_ID,SUBJECT,DOC_TYPE,ROUTE_CODE,ROUTE_NAME,TYPE_4M,FACTORY_GUBUN,FACTORY_CODE,FACTORY_NAME,LOT_ID,RULE_OUT,INITIATOR_NAME",// set search field
    			"DOCID,FACTORY_ID,SUBJECT,DOC_TYPE,ROUTE_CODE,ROUTE_NAME,TYPE_4M,FACTORY_GUBUN,FACTORY_CODE,FACTORY_NAME,LOT_ID,RULE_OUT,INITIATOR_NAME,STEP1_ENDDATE,STEP1_PIID,STATUS,STEP2_ENDDATE,STEP2_PIID,DATE,COL_TIME,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"mrb" // collection display name
    			}
             ,
    			{
    			"ppap", // set index name
    			"ppap", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"DOCID,BIZ_PLACE,PPAP_NO,SUBJECT,STEP_LEVEL,INITIATOR_NAME,STATUS",// set search field
    			"DOCID,BIZ_PLACE,PPAP_NO,SUBJECT,STEP_LEVEL,INITIATOR_NAME,STEP1_ENDDATE,STEP1_PIID,STEP2_ENDDATE,STEP2_PIID,STEP3_ENDDATE,STEP3_PIID,STEP4_ENDDATE,STEP4_PIID,STEP5_ENDDATE,STEP5_PIID,STEP6_ENDDATE,STEP6_PIID,STATUS,DATE,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS", // use check prefix query filed
    			"", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"ppap" // collection display name
    			}
             ,
    			{
    			"ecn", // set index name
    			"ecn", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"DOCID,FACTORY_ID,OWN_OUTSOURCED,ROUTE_CODE,ROUTE_NAME,DOC_NO,SUBJECT,GRADE_CLASS,GRADE,INITIATOR_ID,INITIATOR_NAME,STATUS,REG_ID,MODI_ID,MANAGER_ID,MANAGER_NAME,STEP_NUMBER,PARENT_PROCESS_ID",// set search field
    			"DOCID,FACTORY_ID,OWN_OUTSOURCED,ROUTE_CODE,ROUTE_NAME,DOC_NO,SUBJECT,GRADE_CLASS,GRADE,INITIATOR_ID,INITIATOR_NAME,STEP1_ENDDATE,STEP1_PIID,STEP2_ENDDATE,STEP2_PIID,STEP3_ENDDATE,STEP3_PIID,STEP4_ENDDATE,STEP4_PIID,STEP5_ENDDATE,STEP5_PIID,STEP6_ENDDATE,STEP6_PIID,STEP7_ENDDATE,STEP7_PIID,STEP8_ENDDATE,STEP8_PIID,STATUS,REG_ID,DATE,MODI_ID,MODI_DATE,MANAGER_ID,MANAGER_NAME,STEP_NUMBER,PARENT_PROCESS_ID,ISDISPLAY,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"ecn" // collection display name
    			}
             ,
    			{
    			"change", // set index name
    			"change", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"BIZ_PLACE,FAULT_NAME,GRADE,SUBMIT,Quality_ID,SUBJECT,REQ_RETURN_DATE,SZPROGRESS,REC_QUALITY_ID,INITIATOR_ID,INITIATOR_NAME,CS_QUALITY_NAME,REC_QUALITY_NAME,MANAGER_ID,MANAGER_NAME,PARENT_PROCESS_ID,DROP_REASON,REC_STEP1_NAME,MAIN_ROUTE_NAME,SIMSA_GUBUN,SELF_GUBUN,RE_OCCUR,COMNAME",// set search field
    			"DOCID,BIZ_PLACE,FAULT_NAME,GRADE,SUBMIT,DATE,Quality_ID,SUBJECT,REQ_RETURN_DATE,SZPROGRESS,REC_QUALITY_ID,INITIATOR_ID,INITIATOR_NAME,CS_QUALITY_NAME,REC_QUALITY_NAME,STEP1_STARTDATE,STEP1_ENDDATE,STEP1_PIID,STEP2_STARTDATE,STEP2_ENDDATE,STEP2_PIID,STEP3_ENDDATE,STEP3_PIID,STEP4_ENDDATE,STEP4_PIID,STEP5_ENDDATE,STEP5_PIID,STEP6_ENDDATE,STEP6_PIID,MANAGER_ID,MANAGER_NAME,PARENT_PROCESS_ID,STATUS,ISOVER,OVERDAY,OVERDAY1,OVERDAY2,OVERDAY3,IsDisplay,DROP_REASON,REC_STEP1_NAME,MAIN_ROUTE_NAME,SIMSA_GUBUN,SELF_GUBUN,RE_OCCUR,COMNAME,ORDER_GUBUN,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"change" // collection display name
    			}
             ,
    			{
    			"ocap", // set index name
    			"ocap", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"FACTORY_ID,SUBJECT,DOC_TYPE,ROUTE_NAME,TYPE_4M,FACTOR_GUBUN,FACTOR_NAME,LOT_ID,RULE_OUT,INITIATOR_NAME",// set search field
    			"DOCID,FACTORY_ID,SUBJECT,DOC_TYPE,ROUTE_NAME,TYPE_4M,FACTOR_GUBUN,FACTOR_NAME,LOT_ID,RULE_OUT,INITIATOR_NAME,STEP1_ENDDATE,STEP1_PIID,STATUS,STEP2_ENDDATE,STEP2_PIID,DATE,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"ocap" // collection display name
    			}
             ,
    			{
    			"analysis", // set index name
    			"analysis", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"SUBJECT,INITIATOR_ID,INITIATOR_NAME,MANAGER_ID,MANAGER_NAME,PARENT_PROCESS_ID,STATUS,deveplop,COMCODE,SUPPROGRESS,BUMUN,PROGRESSCODE,PROGRESS,SEVERITY,MODEL,LOTNO,Environmental_Test,Mechanical_Analysis,Micro-Analysis,Measurement,Electrical_Test,Other,Result1,Result2,Result3,PSTATUS,PROGRESS1",// set search field
    			"DOCID,SUBJECT,INITIATOR_ID,INITIATOR_NAME,STEP1_STARTDATE,STEP1_ENDDATE,STEP1_PIID,STEP2_STARTDATE,STEP2_ENDDATE,STEP2_PIID,STEP3_ENDDATE,STEP3_PIID,MANAGER_ID,MANAGER_NAME,PARENT_PROCESS_ID,STATUS,IsDisplay,DATE,deveplop,COMCODE,SUPPROGRESS,BUMUN,PROGRESSCODE,PROGRESS,SEVERITY,MODEL,LOTNO,Environmental_Test,Mechanical_Analysis,Micro-Analysis,Measurement,Electrical_Test,Other,Result1,Result2,Result3,PSTATUS,PROGRESS1,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"analysis" // collection display name
    			}
             ,
    			{
    			"library1", // set index name
    			"library1", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"Gubun,Plant,ProcessName,FacilitiesName,Only,ToWhere,SomethingElse,ByWhatMeans,HowMuch,ForeignForm,ForeignSize,ForeignColor,Requester,Creator,EntryNo,FTIR_Result,EDS,BODY",// set search field
    			"DOCID,Gubun,Plant,ProcessName,FacilitiesName,Only,ToWhere,SomethingElse,ByWhatMeans,HowMuch,DATE,ForeignForm,ForeignSize,ForeignColor,Requester,Creator,EntryNo,FTIR_Result,EDS,BODY,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"library1" // collection display name
    			}
             ,
    			{
    			"library2", // set index name
    			"library2", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"Gubun,Product,Color,Plant,ProcessName,Line,Maker,Model,ETC,EntryNo,FTIR_Result,BODY,EDS,Creator,INSERTED",// set search field
    			"DOCID,Gubun,Product,Color,Plant,ProcessName,Line,Maker,Model,DATE,ETC,EntryNo,FTIR_Result,BODY,EDS,Creator,INSERTED,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"library2" // collection display name
    			}
             ,
    			{
    			"raw", // set index name
    			"raw", // set collection name
    			"0,3",  // set pageinfo (start,count)
    			"1,1,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
    			"DOCID,keyProcess,Manufacturer,MaterialsName,SUBJECT,MaterialsType,INITIATOR_ID,INITIATOR_UNIT_ID,DisplayName",// set search field
    			"DOCID,keyProcess,Manufacturer,MaterialsName,SUBJECT,MaterialsType,INITIATOR_ID,INITIATOR_UNIT_ID,STEP_1,STEP_1_PIID,STEP_2,STEP_2_PIID,STEP_3,STEP_3_PIID,STEP_4,STEP_4_PIID,STEP_5,STEP_5_PIID,STEP_STATUS,DATE,DisplayName,ALIAS",// set document field
    			"", // set date range
    			"", // set rank range
    			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    			"", // set filter operation (<fieldname:operator:value>)
    			"", // set groupby field(field, count)
    			"", // set sort field group(field/order,field/order,...)
    			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    			"", // set categoryGroupBy (fieldname:value)
    			"", // set categoryQuery (fieldname:value)
    			"", // set property group (fieldname,min,max, groupcount)
    			"ALIAS", // use check prefix query filed
    			"DATE", // set use check fast access field
    			"", // set multigroupby field
    			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    			"raw" // collection display name
    			}
        };
    }
}

   

