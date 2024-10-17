import 'package:dartz/dartz.dart';

import '../../../../../core/constants/strings/failure.dart';
import '../../domain/entities/user_entities.dart';
import '../dataSources/user_remote_dataSource.dart';
import '../models/user_model.dart'; // Ensure this imports UserModel
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User?>> getUserById(int id) async {
    // Await the result from the remote data source
    final result = await remoteDataSource.getUserById(id);
    return result.fold(
          (failure) => Left(failure),
          (userModel) => Right(userModel as User?), // Cast UserModel to User
    );
  }

  @override
  Future<Either<Failure, Unit>> addUser(User user) {
    return remoteDataSource.addUser(user as UserModel); // Cast to UserModel
  }

  @override
  Future<Either<Failure, Unit>> updateUser(User user) {
    return remoteDataSource.updateUser(user as UserModel); // Cast to UserModel
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(int id) {
    return remoteDataSource.deleteUser(id);
  }

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    final either = await remoteDataSource.getAllUsers();
    return either.fold(
          (failure) => Left(failure),
          (userModels) => Right(userModels.cast<User>()), // Assuming userModels are of type UserModel
    );
  }
}
