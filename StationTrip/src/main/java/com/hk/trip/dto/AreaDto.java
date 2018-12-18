package com.hk.trip.dto;

public class AreaDto {

	private String ServiceKey;
	private int numOfRows;
	private int pageNo;
	private String MobileOS;
	private String MobileApp;
	private int areaCode;
	/*areaCode?
	 * ServiceKey=WcZIXW%2FEjTD1n08i5CAZmsyW0pohd0p2MfMdI81qBIGQWLkSwe5Ijw4TRbbt%2FeIW5HBgOBf08uz074%2BfPFBDYQ%3D%3D
	 * &numOfRows=10
	 * &pageNo=1
	 * &MobileOS=ETC
	 * &MobileApp=TestApp
	 * &_type=json
	 */
	
	public AreaDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AreaDto(String serviceKey, int numOfRows, int pageNo, String mobileOS, String mobileApp, int areaCode) {
		super();
		ServiceKey = serviceKey;
		this.numOfRows = numOfRows;
		this.pageNo = pageNo;
		MobileOS = mobileOS;
		MobileApp = mobileApp;
		this.areaCode = areaCode;
	}
	public String getServiceKey() {
		return ServiceKey;
	}
	public void setServiceKey(String serviceKey) {
		ServiceKey = serviceKey;
	}
	public int getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getMobileOS() {
		return MobileOS;
	}
	public void setMobileOS(String mobileOS) {
		MobileOS = mobileOS;
	}
	public String getMobileApp() {
		return MobileApp;
	}
	public void setMobileApp(String mobileApp) {
		MobileApp = mobileApp;
	}
	public int getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}
	
	@Override
	public String toString() {
		return "AreaDto [ServiceKey=" + ServiceKey + ", numOfRows=" + numOfRows + ", pageNo=" + pageNo + ", MobileOS="
				+ MobileOS + ", MobileApp=" + MobileApp + ", areaCode=" + areaCode + "]";
	}
}