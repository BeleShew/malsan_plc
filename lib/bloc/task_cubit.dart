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
}
