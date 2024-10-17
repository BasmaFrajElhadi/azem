import 'package:dartz/dartz.dart';
import '../../../../../core/constants/strings/failure.dart';
import '../entities/user_entities.dart';
import '../repositories/user_repository.dart';
import '../../data/models/user_model.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<Either<Failure, Unit>> call(User user) {
    return repository.updateUser(user);
  }
}
