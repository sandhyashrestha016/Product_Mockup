import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._()
      : _remoteConfig = FirebaseRemoteConfig.instance;

  static FirebaseRemoteConfigService? _instance;
  factory FirebaseRemoteConfigService() =>
      _instance ??= FirebaseRemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig;

  String getVersionInfoJson() =>
      _remoteConfig.getString(FirebaseRemoteConfigKeys.providerVersion);

  bool getBreakingChangesStatus() =>
      _remoteConfig.getBool(FirebaseRemoteConfigKeys.breakingChanges);

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: Duration.zero,
        ),
      );

  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();

    if (updated) {
      debugPrint('The config has been updated.');
    } else {
      debugPrint('The config is not updated..');
    }
  }

  Future<void> initialize() async {
    await _setConfigSettings();
    
    await fetchAndActivate();
  }

  
  
  
  
  
  
  
  

  
  
  
  
  
  
}

class FirebaseRemoteConfigKeys {
  static const providerVersion = 'provider_version';
  static const breakingChanges = 'breaking_changes';
}
