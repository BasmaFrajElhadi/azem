import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import '../../../../user/userManagement/domain/entities/user_entities.dart';
import '../../../../user/userManagement/domain/repositories/user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository;
  List<User>? _users;
  String? _errorMessage;

  UserProvider(this._userRepository);

  List<User>? get users => _users;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAllUsers() async {
    final result = await _userRepository.getAllUsers();
    result.fold(
          (failure) {
        _errorMessage = failure.message; // Assuming Failure has a message property
        notifyListeners();
      },
          (users) {
        _users = users;
        notifyListeners();
      },
    );
  }
}
