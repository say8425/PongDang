PongDang
========
PongDang(퐁당) iOS 버전은 @WaaGrr(와그르르)님이 개발하신 안드로이드버전에서 모티브를 얻고 제작되었습니다.

현재 [AppStore](https://itunes.apple.com/kr/app/id1013599847)에서 다운 받으실 수 있습니다.

* 변경사항
 * 1.4.2
  * loading시 backImageView도 같이 활성화되게 만듬
  * 지원 버전 8.0으로 올림, 라이브러리때문. 추후 라이브러리 교체해서 내림
  * 메시지 제대로 변경(친구야 한강가자! 지금 수온 5.4℃래~)
 * 1.4.1
  * UILable과 UIImage로 쪼개진 중앙 dropWater를 UIButton으로 통합
  * UIButton 터치시 reload
  * reload animation을 위해 [M13ProgressSuite](https://github.com/Marxon13/M13ProgressSuite) 라이브러리 추가
  * 근데 괜히함. 추후 더 가벼운걸로 교체
  * 카카오톡 공유하기 메시지를 변경(친구야 한강가자! 지금 수온 5.4래~)
 * 1.1.42
  * iOS 9 버전에 대응. 
   * http 프로토콜 지원 안함. [지원하게 만듬](http://stackoverflow.com/questions/30731785/how-do-i-load-an-http-url-with-app-transport-security-enabled-in-ios-9)
   * [nil parameter가 좀 바뀜, iOS7 지원을 위해 냅둠](http://stackoverflow.com/questions/32628112/null-passed-to-a-callee-that-requires-a-non-null-argument-when-setting-up-mfma)

