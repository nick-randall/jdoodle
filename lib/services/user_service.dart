import 'package:jdoodle/models/user.dart';

abstract class UserService {
  User getUser();
  void logIn();
}
