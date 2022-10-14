import 'package:android_intent_plus/android_intent.dart';
import 'package:jadu_ride_driver/core/helpers/google_map_direction_view.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMapDirectionImpl implements GoogleMapDirectionView {
  final String mapKey;

  GoogleMapDirectionImpl(this.mapKey);

  @override
  Future<bool> openDirectionView(double lat, double lng) async {
    var uri = Uri.encodeFull("google.navigation:q=$lat, $lng&key=$mapKey");

    final intent = AndroidIntent(
        action: 'action_view',
        data: uri,
        package: 'com.google.android.apps.maps');

    var isResolved = await intent.canResolveActivity();
    if (isResolved != null && isResolved) {
      intent.launch();
      return true;
    }

    return false;
  }
}
