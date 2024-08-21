import 'package:http/http.dart' as http;
import 'package:toonflix/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Services {
  //static 키워드를 사용하면 해당 변수나 메서드는 클래스의 인스턴스가 아닌 클래스 자체에 속함
  //즉 클래스의 인스턴스를 생성안하고도 클래스 이름을 통해 직접 접근이 가능해짐
  static const String url = "https://jsonplaceholder.typicode.com/users";

  // Services클래스에서 url을 static로 선언했기때문에 getInfo메서드에서 url에 접근을 시도할려면
  // getInfo 메서드도 static이어야함
  // 이유는 static 멤버는 다른 static 멤버만 접근이 가능하기때문
  static Future<List<User>> getInfo() async {
    final response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        final List<User> user = userFromJson(response.body);
        return user;
      } else {
        Fluttertoast.showToast(msg: "Error occurred. Please try again");
        return <User>[]; //타입을 명시하므로 코드의 가독성이 좋아지고 타입 안정성이 보장됨
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return <User>[];
    }
  }
}

class Service {
  static String address = "https://jsonplaceholder.typicode.com/users";

  static Future<List<User>> infoGet() async {
    final result = await http.get(Uri.parse(address));

    try{
      if(result.statusCode == 200){
        final List<User> user2 = userFromJson(result.body);
        return user2;
      } else {
        Fluttertoast.showToast(msg: "Error");
        return <User>[];
      }
    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
      return <User>[];
    }
  }
}
