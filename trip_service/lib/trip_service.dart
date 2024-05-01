import 'package:trip_service/src/enums/trip_service_error_type.dart';
import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/trip_dao.dart';
import 'package:trip_service/src/models/user.dart';
import 'package:trip_service/src/user_session.dart';

base class TripService {
  Future<List<Trip>?> getTripsByUser(User user) async {
    User? loggedInUser = getCurrentUser;

    if (loggedInUser == null) {
      throw TripServiceErrorType.userNotLoggedIn;
    }
    return user.isFriendsWith(user: loggedInUser) ? findTripsFor(user) : null;
  }

  User? get getCurrentUser => UserSession.instance.getLoggedUser();

  List<Trip>? findTripsFor(User user) {
    return TripDAO.findTripsByUser(user);
  }
}
