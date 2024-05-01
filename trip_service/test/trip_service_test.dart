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
  late User friend;

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
      friend = User();
      tripService.loggedInUser = loggedInUser;
      friend.addFriend(loggedInUser);
      friend.addFriend(dummyUser);
    });

    test('Test current user', () async {
      final currentUser = await tripService.getCurrentUser();

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
        await tripService.getTripsByUser(friend);
      } catch (e) {
        expect(e, UnitTestErrorType.dependendClassCallDuringUnitTest);
      }
    });

    test('Test friend with trips', () async {
      friend.addTrip(japanTrip);
      friend.addTrip(usaTrip);
      friend.addTrip(canadaTrip);

      final result = await tripService.getTripsByUser(friend);

      expect(result, [japanTrip, usaTrip, canadaTrip]);
    });

    test('Test non_friend with trips', () async {
      friend = UserBuilder().addFriends([loggedInUser, dummyUser]).addTrips([japanTrip, usaTrip, canadaTrip]).build();
      dummyUser.addTrip(japanTrip);
      dummyUser.addTrip(usaTrip);
      dummyUser.addTrip(canadaTrip);

      final result = await tripService.getTripsByUser(dummyUser);

      expect(result, null);
    });
  });
}
