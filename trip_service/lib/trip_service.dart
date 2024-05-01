import 'package:trip_service/src/enums/trip_service_error_type.dart';
import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/trip_dao.dart';
import 'package:trip_service/src/models/user.dart';
import 'package:trip_service/src/user_session.dart';

class TripService {
  User? loggedInUser;

  Future<List<Trip>?> getTripsByUser(User user) async {
    List<Trip> tripList = [];

    loggedInUser = await getCurrentUser();

    bool isFriend = false;

    if (loggedInUser != null) {
      for (User friend in user.getFriends()) {
        if (friend == loggedInUser) {
          isFriend = true;
          break;
        }
      }
      if (isFriend) {
        tripList = await TripDAO.findTripsByUser(user);
      }
      return tripList;
    } else {
      throw TripServiceErrorType.userNotLoggedIn;
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      return await UserSession.instance.getLoggedUser();
    } catch (e) {
      rethrow;
    }
  }
}
