import 'package:dartz/dartz.dart';
import 'package:kanggo_flutter_developer_dandy/domain/entity/list_user_response_entity.dart';

abstract class DomainRepository {
  Future<Either<String, ListUserResponseEntity>> listUser(int index);
}
