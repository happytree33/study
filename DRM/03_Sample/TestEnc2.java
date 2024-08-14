import SCSL.*;

public final class TestEnc
{
	public static void main(String[] args) 
	{
		String srcFile,dstFile;

		srcFile="c:\\test2\\DRM\\03_Sample\\test2.xls";
		dstFile="c:\\test2\\DRM\\03_Sample\\test2_Enc.xls";
	
		SLDsFile sFile = new SLDsFile();

		sFile.SettingPathForProperty("c:\\test2\\DRM\\02_Module\\02_ServiceLinker\\softcamp.properties"); 
		
		sFile.SLDsInitDAC();                                                 
		sFile.SLDsAddUserDAC("SECURITYDOMAIN", "111001100", 0, 0, 0); 
    
		int ret;
		ret = sFile.SLDsEncFileDACV2("c:\\test2\\DRM\\04_KeyFile\\keyDAC_SVR0.sc", "System", srcFile, dstFile, 1);                             
		System.out.println("SLDsEncFileDAC :" + ret);
	
	}
}

