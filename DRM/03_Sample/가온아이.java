public class GaonTechFileCustom implements ClassName{
	
	public static String drm_key_path = "d:\\softcamp\\04_KeyFile\\keyDAC_SVR0.sc";	
	public static String drm_properties_path = "d:\\softcamp\\02_Module\\02_ServiceLinker\\softcamp.properties";
	public static String drm_file_dir = "d:\\prosearchnew1\\dbcrawler\\drmfile\\";
	//키 파일 경로 , 프로퍼티 파일이 있는 경로, 복호화 할 대상 경로
	
	public GaonTechFileCustom () {
			// 내용 존재
	}
				
	@Override
	public Object customDataObject(String columnData) throws Exception {
		
		
		if(file.exists()) { 
				
			SLDsFile sFile = new SLDsFile();
			
			sFile.SettingPathForProperty(GaonTechFileCustom.drm_properties_path); 
			
			int retVal = sFile.CreateDecryptFileDAC (
				GaonTechFileCustom.drm_key_path,
				"SECURITYDOMAIN",
				GaonTechContentCustom.addFilePath+columnData,
				GaonTechFileCustom.drm_file_dir+file.getName());
				
				
			File fileDec = new File(GaonTechFileCustom.drm_file_dir+file.getName());
			
			if (retVal == 0) {
				attach = fileContent.getFilterData(GaonTechFileCustom.drm_file_dir+file.getName());
			} else if (retVal == -36) {
				attach = fileContent.getFilterData(GaonTechContentCustom.addFilePath+columnData);
			}
			
			if(fileDec.exists()) {
				fileDec.delete();
			}

			
		}
		
	}
				
				
				
}