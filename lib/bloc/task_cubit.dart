import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../api/team_task_api.dart';
import '../model/team_task.dart';
part 'task_state.dart';

@lazySingleton
class TeamTaskCubit extends Cubit<TeamTaskState> {
  TeamTaskCubit() : super(TeamTaskInitial()){
    getTeamTasks();
  }
  Future<void> getTeamTasks() async {
    try{
      emit(TeamTaskInitial());
      final response = await TaskTeamAPI().getTeamTask();
      if(response!=null && response.isNotEmpty){
        emit(TeamTaskLoaded(data: response,));
      }else{
        emit(const TeamTaskError(message: "something_went_wrong"));
      }
    }catch(e){
      emit(const TeamTaskError(message: "something_went_wrong"));
    }
  }

  Future<void> addNewTeamTask(TaskList newTask) async {
    try {
      var updatedTasks = List<TaskList>.from(state.response?.first.tasks ?? [])
        ..add(newTask);
      var updatedTeamTask = state.response?.first.copyWith(tasks: updatedTasks);
      var updatedResponse = List<TeamTask>.from(state.response ?? []);
      if (updatedResponse.isNotEmpty && updatedTeamTask != null) {
        updatedResponse[0] = updatedTeamTask;
      }
      emit(TeamTaskLoaded(data: updatedResponse));
    } catch (e) {
      emit(const TeamTaskError(message: "something_went_wrong"));
    }
  }
}