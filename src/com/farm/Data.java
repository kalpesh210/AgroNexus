package com.farm;

public class Data {
	
	
	public static int aid;
	public static int cid;
	public static int sid;
	public static int fid;
	public static int fvid;
	public static int oid;
	public static int type;
	public static String crname;
	
	public static String getCrname() {
		return crname;
	}
	
	public static void setCrname(String crname) {
		Data.crname = crname;
	}
	public static int getFvid() {
		return fvid;
	}
	public static void setFvid(int fvid) {
		Data.fvid = fvid;
	}
	
	public static int getOid() {
		return oid;
	}
	public static void setOid(int oid) {
		Data.oid = oid;
	}
	public static int getCid() {
		return cid;
	}
	public static void setCid(int cid) {
		Data.cid = cid;
	}
	public static int getSid() {
		return sid;
	}
	public static void setSid(int sid) {
		Data.sid = sid;
	}
	public static int getFid() {
		return fid;
	}
	public static void setFid(int fid) {
		Data.fid = fid;
	}
	public static int getAid() {
		return aid;
	}
	public static void setAid(int aid) {
		Data.aid = aid;
	}
	public static int getType() {
		return type;
	}
	public static void setType(int type) {
		Data.type = type;
	}

}
