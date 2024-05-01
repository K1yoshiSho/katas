import 'package:trip_service/src/enums/trip_service_error_type.dart';
import 'package:trip_service/src/models/trip.dart';
import 'package:trip_service/src/trip_dao.dart';
import 'package:trip_service/src/models/user.dart';
import 'package:trip_service/src/user_session.dart';

class TripService {
  Future<List<Trip>?> getTripsByUser(User user) async {
    List<Trip>? tripList;
    User? loggedUser = await UserSession.instance.getLoggedUser();

    bool isFriend = false;

    if (loggedUser != null) {
      for (User friend in user.getFriends()) {
        if (friend == loggedUser) {
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
}
