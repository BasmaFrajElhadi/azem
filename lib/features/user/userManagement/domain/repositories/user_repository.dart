import 'package:dartz/dartz.dart';

import '../../../../../core/constants/strings/failure.dart';
import '../entities/user_entities.dart';

abstract class UserRepository {
  Future<Either<Failure, User?>> getUserById(int id);
  Future<Either<Failure, Unit>> addUser(User user);
  Future<Either<Failure, Unit>> updateUser(User user);
  Future<Either<Failure, Unit>> deleteUser(int id);
  Future<Either<Failure, List<User>>> getAllUsers();
}
