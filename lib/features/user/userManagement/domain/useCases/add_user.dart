import 'package:dartz/dartz.dart';
import '../../../../../core/constants/strings/failure.dart';
import '../entities/user_entities.dart';
import '../repositories/user_repository.dart';
import '../../data/models/user_model.dart';

class AddUser {
  final UserRepository repository;

  AddUser(this.repository);

  Future<Either<Failure, Unit>> call(User user) {
    return repository.addUser(user);
  }
}
