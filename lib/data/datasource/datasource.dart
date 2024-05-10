import 'package:phase_one_app/data/datasource/interface_datasource.dart';
import 'package:phase_one_app/domain/entities/password.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 
/// Data source implementation
/// 
/// [savePasswords] : method used to save a list of passwords
/// [readPasswords] : method used to read a list of passwords
/// 
class DataSource extends IDataSource {
  final SharedPreferences? sharedPreferences;
  final String _key = "password_key";

  DataSource(this.sharedPreferences);

  @override
  void savePasswords(List<PasswordModel> list) {
    final String encodedData = PasswordModel.encode(list);
    sharedPreferences?.setString(_key, encodedData);
  }

  @override
  List<PasswordModel> readPasswords() {
    final String listString = sharedPreferences?.getString(_key) ?? "";
    return listString.isEmpty ? [] : PasswordModel.decode(listString);
  }
}
