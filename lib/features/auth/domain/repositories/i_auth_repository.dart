import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract class IAuthRepository {
  Future<({Failure? failure, UserEntity? user})> signIn({
    required String email,
    required String password,
  });

  Future<({Failure? failure, bool success})> signOut();

  Future<UserEntity?> getCurrentUser();

  Stream<UserEntity?> watchAuthState();
}
