import 'package:dartz/dartz.dart';
import '../../../../../core/constants/strings/failure.dart';
import '../entities/user_entities.dart';
import '../repositories/user_repository.dart';
import '../../data/models/user_model.dart';

class GetUserById {
  final UserRepository repository;

  GetUserById(this.repository);

  Future<Either<Failure, User?>> call(int id) {
    return repository.getUserById(id);
  }
}
