import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/models/user.dart';
import 'package:trip_service/trip_service.dart';

final class TestableTripService extends TripService {
  User? loggedInUser;

  @override
  User? get getCurrentUser => loggedInUser;

  @override
  List<Trip>? findTripsFor(User user) {
    return user.getTrips();
  }
}
