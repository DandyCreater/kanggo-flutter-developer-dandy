import 'package:dartz/dartz.dart';
import 'package:kanggo_flutter_developer_dandy/domain/entity/list_user_response_entity.dart';
import 'package:kanggo_flutter_developer_dandy/domain/repository/domain_repository.dart';

class UserUseCase {
  final DomainRepository repository;

  const UserUseCase(this.repository);
  Future<Either<String, ListUserResponseEntity>> execute(int index) async {
    return repository.listUser(index);
  }
}
