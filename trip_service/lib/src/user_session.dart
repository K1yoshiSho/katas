import 'package:trip_service/src/enums/unit_tests_error_type.dart';
import 'package:trip_service/src/models/user.dart';

class UserSession {
  UserSession._privateConstructor();

  static final UserSession instance = UserSession._privateConstructor();

  Future<bool> isUserLoggedIn(User user) async {
    throw UnitTestErrorType.dependendClassCallDuringUnitTest;
  }

  Future<User?> getLoggedUser() async {
    throw UnitTestErrorType.dependendClassCallDuringUnitTest;
  }
}
