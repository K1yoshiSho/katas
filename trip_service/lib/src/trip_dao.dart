import 'package:trip_service/src/enums/unit_tests_error_type.dart';
import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/models/user.dart';

class TripDAO {
  static List<Trip> findTripsBy(User user) {
    if (user.trips.isEmpty) {
      throw UnitTestErrorType.dependendClassCallDuringUnitTest;
    }
    return user.trips;
  }
}
