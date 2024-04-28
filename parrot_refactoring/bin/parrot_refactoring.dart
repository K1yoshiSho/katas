import 'package:parrot_speed/parrot_refactoring.dart' as parrot_speed;

void main(List<String> arguments) {
  final parrot = parrot_speed.EuropeanParrot(voltage: 0.0, isNailed: false);
  print('Speed of European Parrot: ${parrot.speed}');
}
