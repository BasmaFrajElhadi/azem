import 'package:dartz/dartz.dart';
import '../../../../../core/constants/strings/failure.dart';
import '../entities/user_entities.dart';
import '../repositories/user_repository.dart';
import '../../data/models/user_model.dart';

class GetAllUsers {
  final UserRepository repository;

  GetAllUsers(this.repository);

  Future<Either<Failure, List<User>>> call() {
    return repository.getAllUsers();
  }
}
