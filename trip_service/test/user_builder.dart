import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/models/user.dart';

final class UserBuilder {
  List<User> friends = [];
  List<Trip> trips = [];

  UserBuilder addFriends(List<User> friends) {
    this.friends = friends;
    return this;
  }

  UserBuilder addTrips(List<Trip> trips) {
    this.trips = trips;
    return this;
  }

  User build() {
    final user = User();
    addFriends(friends);
    addTrips(trips);
    return user;
  }
}
