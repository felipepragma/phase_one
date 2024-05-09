import 'package:phase_one_app/core/data/datasource/datasource.dart';
import 'package:phase_one_app/core/domain/entities/password.dart';
import 'package:phase_one_app/core/domain/repository/password_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 
/// Repository implementation
/// 
/// extends interface [PasswordRepository]
/// 
/// [getAllPassword] : method used to save a list of passwords
/// [savePassword] : method used to read a list of passwords
/// 
class PasswordRepositoryImpl extends PasswordRepository {

  IDataSource? dataSource;

  PasswordRepositoryImpl(SharedPreferences? sharedPreferences) {
    this.dataSource = DataSource(sharedPreferences);
  }

  @override
  List<PasswordModel> getAllPassword() {
    return dataSource?.readPasswords() ?? [];
  }

  @override
  void savePassword(PasswordModel passwordModel) {
    final list = getAllPassword();
    list.add(passwordModel);
    dataSource?.savePasswords(list);
  }
}