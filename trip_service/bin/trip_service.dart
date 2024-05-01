import 'package:trip_service/trip_service.dart';
import 'package:trip_service/src/models/user.dart';

void main(List<String> arguments) {
  final tripService = TripService();
  final user = User();

  tripService.getTripsByUser(user).then((trips) {
    if (trips != null) {
      print('Trips found: $trips');
    } else {
      print('No trips found for the user');
    }
  }).catchError((error) {
    print('Error: $error');
  });
}
