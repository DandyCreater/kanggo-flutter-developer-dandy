part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUser extends UserEvent {
  final int? index;

  const FetchUser({required this.index});

  @override
  // TODO: implement props
  List<Object> get props => [index!];
}
