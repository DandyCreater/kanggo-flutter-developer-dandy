part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final ListUserResponseEntity? value;

  const UserSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class UserFailed extends UserState {
  final String? message;

  const UserFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
