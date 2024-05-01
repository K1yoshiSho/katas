import 'package:test/test.dart';
import 'package:trip_service/src/enums/trip_service_error_type.dart';
import 'package:trip_service/src/enums/unit_tests_error_type.dart';
import 'package:trip_service/src/models/user.dart';
import 'package:trip_service/trip_service.dart';

import 'test_trip_service.dart';

final _dummyUser = User();

void main() {
  group('TripService |', () {
    test('Test getTripsByUser returns TripServiceErrorType.userNotLoggedIn exception', () async {
      final tripService = TestableTripService();

      try {
        await tripService.getTripsByUser(_dummyUser);
      } catch (e) {
        expect(e, TripServiceErrorType.userNotLoggedIn);
      }
    });

    test('Test user with no friends', () async {
      final tripService = TestableTripService();
      tripService.loggedInUser = User();

      final trips = await tripService.getTripsByUser(_dummyUser);

      expect(trips, null);
    });
  });
}
