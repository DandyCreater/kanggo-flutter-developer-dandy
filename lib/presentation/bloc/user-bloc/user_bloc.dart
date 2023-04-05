import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kanggo_flutter_developer_dandy/domain/entity/list_user_response_entity.dart';
import 'package:kanggo_flutter_developer_dandy/domain/usecase/user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;
  UserBloc(this.userUseCase) : super(UserInitial()) {
    on<FetchUser>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await userUseCase.execute(event.index!);
        result.fold((failure) {
          emit(UserFailed(message: failure));
        }, (response) {
          emit(UserSuccess(value: response));
        });
      } catch (e) {
        debugPrint("Bloc User Error $e");
        emit(const UserFailed(message: "Something Wrong! Please Try Again"));
      }
    });
  }
}
