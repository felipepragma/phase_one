import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Provider used for riverpod
/// 
/// [sharedPreferencesProvider] : Provider sharedPreferences
/// 
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});
