import 'package:phase_one_app/domain/entities/password.dart';

/// 
/// Data source interface
/// 
/// [savePasswords] : method used to save a list of passwords
/// [readPasswords] : method used to read a list of passwords
/// 
abstract class IDataSource {
  void savePasswords(List<PasswordModel> list);
  List<PasswordModel> readPasswords();
}