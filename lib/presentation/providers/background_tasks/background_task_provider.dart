import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundFetchNotifier extends StateNotifier<bool?> {
  final String processKeyName;

  BackgroundFetchNotifier({required this.processKeyName}) : super(false) {
    checkCurrentStatus();
  }

  checkCurrentStatus() async {
    state = await SharePreferencesPlugin.getBool(processKeyName) ?? false;
  }

  toogleProcess() {
    if (state == true) {
      deactivateProcess();
    } else {
      activateProcess();
    }
  }

  activateProcess() async {
    //firts time is inmediatly
    await Workmanager().registerPeriodicTask(
      processKeyName,
      processKeyName,
      frequency: const Duration(seconds: 10), //will be to change to 15 minutes,
      constraints: Constraints(networkType: NetworkType.connected),
      tag: processKeyName,
    );

    await SharePreferencesPlugin.setBool(processKeyName, true);
    state = true;
  }

  deactivateProcess() async {
    await Workmanager().cancelByTag(processKeyName);
    await SharePreferencesPlugin.setBool(processKeyName, false);
    state = false;
  }
}

final backgroundFetchProvider =
    StateNotifierProvider<BackgroundFetchNotifier, bool?>((ref) {
  return BackgroundFetchNotifier(
      processKeyName: fetchPeriodicBackgroundTaskKey);
});
