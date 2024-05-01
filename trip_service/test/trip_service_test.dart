import 'package:test/test.dart';
import 'package:trip_service/src/enums/trip_service_error_type.dart';
import 'package:trip_service/src/enums/unit_tests_error_type.dart';
import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/models/user.dart';

import 'test_trip_service.dart';
import 'user_builder.dart';

void main() {
  late User dummyUser;
  late User loggedInUser;

  late TestableTripService tripService;

  late Trip japanTrip;
  late Trip usaTrip;
  late Trip canadaTrip;

  group('TripService |', () {
    setUp(() {
      tripService = TestableTripService();
      japanTrip = Trip();
      usaTrip = Trip();
      canadaTrip = Trip();
      dummyUser = User();
      loggedInUser = User();

      tripService.loggedInUser = loggedInUser;
    });

    test('Test current user', () async {
      final currentUser = tripService.getCurrentUser;

      expect(currentUser, loggedInUser);
    });

    test('Test getTripsByUser returns TripServiceErrorType.userNotLoggedIn exception', () async {
      try {
        tripService.loggedInUser = null;
        await tripService.getTripsByUser(dummyUser);
      } catch (e) {
        expect(e, TripServiceErrorType.userNotLoggedIn);
      }
    });

    test('Test user with no friends', () async {
      final trips = await tripService.getTripsByUser(dummyUser);

      expect(trips, null);
    });

    test('Test friend with no trips', () async {
      try {
        final friend = UserBuilder().addFriends([loggedInUser, dummyUser]).build();
        await tripService.getTripsByUser(friend);
      } catch (e) {
        expect(e, UnitTestErrorType.dependendClassCallDuringUnitTest);
      }
    });

    test('Test friend with trips', () async {
      final friend = UserBuilder().addFriends([loggedInUser, dummyUser]).addTrips([japanTrip, usaTrip, canadaTrip]).build();

      final result = await tripService.getTripsByUser(friend);

      expect(result, [japanTrip, usaTrip, canadaTrip]);
    });

    test('Test non_friend with trips', () async {
      dummyUser.addTrip(japanTrip);
      dummyUser.addTrip(usaTrip);
      dummyUser.addTrip(canadaTrip);

      final result = await tripService.getTripsByUser(dummyUser);

      expect(result, null);
    });
  });
}
