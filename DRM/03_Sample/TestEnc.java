import SCSL.*;

public final class TestEnc
{
	public static void main(String[] args)
	{
		String srcFile,dstFile;
		//원본 파일 경로, 암호화하고 난 뒤 파일 생성 경로 설정
		
		srcFile="c:\\test2\\file\\upload\\test2.xls";
		dstFile="c:\\test2\\file\\enc\\test2_Enc.xls";
		//해당 파일이 위치 한곳 경로 적어주기
		
		SLDsFile sFile = new SLDsFile();
		// SLDsFile 클래스에서 객체를 선언해준다.
		
		sFile.SettingPathForProperty(
		"c:\\test2\\DRM\\02_Module\\02_ServiceLinker\\softcamp.properties");
		//프로퍼티 파일이 있는 경로를 적어준다.
		
		sFile.SLDsInitDAC();
		//초기화 해준다.
		sFile.SLDsAddUserDAC("SECURITYDOMAIN", "111001100", 0, 0, 0);
		// 유저 이름, 권한 문자열,  유효 기간(0은 기한 없음), 읽기 횟수, 프린트 횟수
		// 0은 기한없음, 제한없음
		
		int ret;
		ret = sFile.SLDsEncFileDACV2("c:\\test2\\DRM\\04_KeyFile\\keyDAC_SVR0.sc", "System", srcFile, dstFile, 1);
		// 키파일이름(경로포함), 연동시스템 이름, 원본파일 이름(경로포함), 암호화한 파일 이름(경로포함),
		// 옵션 1은 복호화 후 재암호화
		
		System.out.println("SLDsEncFileDAC :" + ret);
		
	}
}