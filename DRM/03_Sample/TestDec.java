import SCSL.*;

public final class TestDec
{
	public static void main(String[] args) 
	{
		String srcFile,dstFile;
		//암호화 된 원본 파일 경로, 복호화하고 난 뒤 파일 생성 경로 설정		

		srcFile="c:\\study\\file\\upload\\enc.xls";
		// 암호화된 파일의 위치.
		dstFile="c:\\study\\file\\drmFilter\\test_Dec.xls";
		// 복호화 하고 난 뒤 파일 생성 경로.
	
		SLDsFile sFile = new SLDsFile();
		// SLDsFile 클래스에서 객체를 선언해준다.

		sFile.SettingPathForProperty("c:\\study\\DRM\\02_Module\\02_ServiceLinker\\softcamp.properties"); 
		//프로퍼티 파일이 있는 경로를 적어준다.	
	
		int retVal = sFile.CreateDecryptFileDAC (
		"c:\\study\\DRM\\04_KeyFile\\keyDAC_SVR0.sc",
		"SECURITYDOMAIN",
		srcFile,
		dstFile);
		// 키 파일 경로, 아이디, 복호화 할 소스 경로, 복호화 할 대상 경로
		
		System.out.println( " CreateDecryptFileDAC [" + retVal + "]");
	}
}