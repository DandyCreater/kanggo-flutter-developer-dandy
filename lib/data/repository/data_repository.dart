import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kanggo_flutter_developer_dandy/data/datasource/remote_data_source.dart';
import 'package:kanggo_flutter_developer_dandy/data/model/list_user_response_model.dart';
import 'package:kanggo_flutter_developer_dandy/domain/entity/list_user_response_entity.dart';
import 'package:kanggo_flutter_developer_dandy/domain/repository/domain_repository.dart';

class DataRepository extends DomainRepository{
  final RemoteDataSource remoteDataSource;

   DataRepository({required this.remoteDataSource});


  @override
  Future<Either<String, ListUserResponseEntity>> listUser(int index) async{
    try {
      ListUserResponseModel result = await remoteDataSource.listUsers(index);
      if(result != null){
        return right(result.toEntity());
      }
      else{
        return left("List User Failed");
      }
    } catch (e) {
      debugPrint("Catch Error List User Repository $e");
      return const Left("Something Wrong! Please Try Again");
    }
  }
}