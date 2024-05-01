import 'package:test/test.dart';
import 'package:trip_service/src/enums/trip_service_error_type.dart';
import 'package:trip_service/src/enums/unit_tests_error_type.dart';
import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/models/user.dart';

import 'package:trip_service/trip_service.dart';

import 'user_builder.dart';

void main() {
  late final User anotherUser;
  late final User loggedInUser;

  late final TripService tripService;

  late final Trip japanTrip;
  late final Trip usaTrip;
  late final Trip canadaTrip;

  group('TripService |', () {
    setUpAll(() {
      tripService = TripService();

      japanTrip = Trip();
      usaTrip = Trip();
      canadaTrip = Trip();

      loggedInUser = User();
      anotherUser = UserBuilder().addTrips([japanTrip, usaTrip, canadaTrip]).build();
    });

    tearDownAll(() {
      anotherUser.friends.clear();
      loggedInUser.friends.clear();
      anotherUser.trips.clear();
      loggedInUser.trips.clear();
    });

    test('Test getTripsByUser returns TripServiceErrorType.userNotLoggedIn exception', () async {
      try {
        await tripService.getTripsByUser(anotherUser, currentUser: loggedInUser);
      } catch (e) {
        throwsA(equals(TripServiceErrorType.userNotLoggedIn));
      }
    });

    test('Test user with no friends', () async {
      final trips = await tripService.getTripsByUser(anotherUser, currentUser: loggedInUser);

      expect(trips, null);
    });

    test('Test friend with no trips', () async {
      try {
        final friend = UserBuilder().addFriends([loggedInUser, anotherUser]).build();
        await tripService.getTripsByUser(friend);
      } catch (e) {
        throwsA(equals(UnitTestErrorType.dependendClassCallDuringUnitTest));
      }
    });

    test('Test friend with trips', () async {
      final friend = UserBuilder().addFriends([loggedInUser, anotherUser]).addTrips([japanTrip, usaTrip, canadaTrip]).build();

      final result = await tripService.getTripsByUser(friend, currentUser: loggedInUser);

      expect(result, [japanTrip, usaTrip, canadaTrip]);
    });

    test('Test non_friend with trips', () async {
      final result = await tripService.getTripsByUser(anotherUser, currentUser: loggedInUser);

      expect(result, null);
    });
  });
}
