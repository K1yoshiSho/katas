import 'package:trip_service/src/models/user.dart';
import 'package:trip_service/trip_service.dart';

final class TestableTripService extends TripService {
  @override
  Future<User?> getCurrentUser() async {
    return loggedInUser;
  }
}
