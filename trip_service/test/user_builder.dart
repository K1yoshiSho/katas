import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/models/user.dart';

/// Builder pattern for [User] class. It allows to create a [User] object with friends and trips.
final class UserBuilder {
  List<User> _friends = [];
  List<Trip> _trips = [];

  UserBuilder addFriends(List<User> friends) {
    _friends = friends;
    return this;
  }

  UserBuilder addTrips(List<Trip> trips) {
    _trips = trips;
    return this;
  }

  User build() {
    final user = User();
    for (final friend in _friends) {
      user.addFriend(friend);
    }
    for (final trip in _trips) {
      user.addTrip(trip);
    }
    return user;
  }
}
