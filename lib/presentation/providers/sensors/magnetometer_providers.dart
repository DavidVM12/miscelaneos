import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MagnetometerXYZ {
  final double x;
  final double y;
  final double z;

  MagnetometerXYZ(this.x, this.y, this.z);

  @override
  String toString() {
    return '''
      x: $x,
      y: $y,
      z: $z
    ''';
  }
}

final magnetometerProvider =
//autoDispose is used to dispose of the stream when the widget is removed from the widget tree
    StreamProvider.autoDispose<MagnetometerXYZ>((ref) async* {
  await for (final event in magnetometerEvents) {
    //I only want 2 decimals
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.y.toStringAsFixed(2));
    final z = double.parse(event.z.toStringAsFixed(2));

    yield MagnetometerXYZ(x, y, z);
  }
});
