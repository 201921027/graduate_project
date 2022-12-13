# 프론트엔드
### 개발환경 : Flutter
### 사용언어 : dart

#### 패키지
>pubspec.yaml파일에 dependencies: 아래 코드를 입력하고 pub get하여 패키지 설치 후 사용

* 로딩화면을 위한 spinkit
>```dart
>dependencies:
>  flutter_spinkit: ^5.1.0
>```
>splash_screen.dart 파일에 import
>```dart
>import 'package:flutter_spinkit/flutter_spinkit.dart';
>```
>
<img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/screen.gif"  width="400" height="400"/>


소스코드에 사용된 FadingCricle 이외의 여러 패턴의 로딩위젯이 구현가능하다.
</br></br>
* 홈화면 calendar
>```dart
>dependencies:
>  flutter_advanced_calendar: ^1.2.0
>```
>main_home.dart 파일에 import
>```dart
>import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
>```
>
<img src="https://github.com/alex-melnyk/flutter_advanced_calendar/raw/master/PREVIEW_LIGHT_EXPANDED.png"  width="200" height="400"/>

  example calendar image
</br></br>

* report 화면 원형 그래프
>```dart
>dependencies:
>  syncfusion_flutter_gauges: ^18.2.44
>```
>report.dart 파일에 import
>```dart
>import 'package:syncfusion_flutter_gauges/gauges.dart';
>```
>
<img src="https://www.syncfusion.com/blogs/wp-content/uploads/2020/08/Circular-Progress-Bar-Styles.gif"  width="200" height="400"/>
해당 패키지로 다양한 gauge위젯이 사용가능 프로젝트 소스코드에서는 [Blog](https://www.syncfusion.com/blogs/post/create-stunning-circular-progress-bars-with-flutter-radial-gauge-part-1.aspx) 참고하여 Circular Progress Bar위젯을 사용하였다

</br></br>

* report 화면 막대 그래프
>```dart
>dependencies:
>  percent_indicator: ^4.2.2
>```
>report.dart 파일에 import
>```dart
>import 'package:percent_indicator/percent_indicator.dart';
>```
>
<img src="https://image.ibb.co/doViid/screen1.png"  width="200" height="400"/>
<img src="https://image.ibb.co/bszyGy/screen2.png"  width="200" height="400"/>
해당 패키지로 Circular 와 Linear percent indicators 사용가능
</br></br>
