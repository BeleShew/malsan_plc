part of 'task_cubit.dart';

class TeamTaskState extends Equatable {
  const TeamTaskState({this.response});
  final List<TeamTask>? response;
  @override
  List<Object?> get props => [response];
}

class TeamTaskInitial extends TeamTaskState {
  @override
  List<Object> get props => [];
}

class TeamTaskLoaded extends TeamTaskState {
  const TeamTaskLoaded({required data}):super(response:data);
  @override
  List<Object?> get props => [super.response];
}

class TeamTaskError extends TeamTaskState{
  final String message;
  const TeamTaskError({required this.message,});
  @override
  List<Object?> get props => [message];
}