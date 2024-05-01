import 'package:trip_service/src/enums/trip_service_error_type.dart';
import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/trip_dao.dart';
import 'package:trip_service/src/models/user.dart';
import 'package:trip_service/src/user_session.dart';

class TripService {
  Future<List<Trip>?> getTripsByUser(User user, {User? currentUser}) async {
    User? loggedInUser = currentUser ?? UserSession.instance.getLoggedUser();

    if (loggedInUser == null) {
      throw TripServiceErrorType.userNotLoggedIn;
    }
    return user.isFriendsWith(user: loggedInUser) ? findTripsFor(user) : null;
  }

  List<Trip>? findTripsFor(User user) => TripDAO.findTripsBy(user);
}
