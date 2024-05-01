import 'package:trip_service/src/models/trip.dart';

class User {
  final List<Trip> _userTrips = [];
  final List<User> _friends = [];

  List<User> get friends => _friends;

  List<Trip> get trips => _userTrips;

  void addFriend(User friend) {
    _friends.add(friend);
  }

  void addTrip(Trip trip) {
    _userTrips.add(trip);
  }

  bool isFriendsWith({
    required User user,
  }) {
    bool isFriend = false;
    for (User friend in friends) {
      if (friend == user) {
        isFriend = true;
        break;
      }
    }
    return isFriend;
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is User && runtimeType == other.runtimeType;

  @override
  int get hashCode => _userTrips.hashCode ^ _friends.hashCode;
}
