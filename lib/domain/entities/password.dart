
import 'dart:convert';

///
/// Model used for passwords
/// 
/// [uuid] : Unique id
/// [name] : Name password
/// [pass] : password
/// [description] : Description of password
/// 
class PasswordModel {

  String? uuid;
  String? name;
  String? pass;
  String? description;

  PasswordModel({
    this.uuid,
    this.name,
    this.pass,
    this.description,
  });

  factory PasswordModel.fromJson(Map<String, dynamic> jsonData) {
    return PasswordModel(
      uuid: jsonData['uuid'],
      name: jsonData['name'],
      pass: jsonData['pass'],
      description: jsonData['description']
    );
  }

  PasswordModel copyWith({String? uuid, String? name, String? pass, String? description,}) {
    return PasswordModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      pass: pass ?? this.pass,
      description: description ?? this.description,
    );
  }

  static String encode(List<PasswordModel> list) => json.encode(
    list
      .map<Map<String, dynamic>>((password) => PasswordModel.toMap(password))
      .toList(),
  );

  static List<PasswordModel> decode(String listString) =>
    (json.decode(listString) as List<dynamic>)
      .map<PasswordModel>((item) => PasswordModel.fromJson(item))
      .toList();

  static Map<String, dynamic> toMap(PasswordModel password) => {
    'uuid': password.uuid,
    'name': password.name,
    'pass': password.pass,
    'description': password.description
  };
}