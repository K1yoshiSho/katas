import 'package:trip_service/src/models/user.dart';
import 'package:trip_service/trip_service.dart';

final class TestableTripService extends TripService {
  User? loggedInUser;
  @override
  Future<User?> getCurrentUser() async {
    return loggedInUser;
  }
}
