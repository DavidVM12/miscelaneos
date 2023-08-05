import 'package:miscelaneos/config/config.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsPlugin {
  static registerActions() {
    const QuickActions quickActions = QuickActions();

    quickActions.initialize((shortcutType) {
      print(shortcutType);

      switch (shortcutType) {
        case 'biometric':
          router.push('/biometric');
        case 'compass':
          router.push('/compass');
        case 'pokemons':
          router.push('/pokemons');
        case 'charmander  ':
          router.push('/pokemons/4');
        default:
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'biometric', localizedTitle: 'Biometric', icon: 'finger'),
      const ShortcutItem(
          type: 'compass', localizedTitle: 'Compass', icon: 'compass'),
      const ShortcutItem(
          type: 'pokemons', localizedTitle: 'Pokemons', icon: 'pokemons'),
      const ShortcutItem(
          type: 'charmander', localizedTitle: 'Charmander', icon: 'charmander'),
    ]);
  }
}
