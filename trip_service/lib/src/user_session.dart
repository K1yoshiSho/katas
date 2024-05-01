import 'package:trip_service/src/enums/unit_tests_error_type.dart';
import 'package:trip_service/src/models/user.dart';

class UserSession {
  UserSession._privateConstructor();

  static final UserSession instance = UserSession._privateConstructor();

  bool isUserLoggedIn(User user) {
    throw UnitTestErrorType.dependendClassCallDuringUnitTest;
  }

  User? getLoggedUser() {
    throw UnitTestErrorType.dependendClassCallDuringUnitTest;
  }
}
