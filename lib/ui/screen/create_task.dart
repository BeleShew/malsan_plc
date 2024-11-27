import 'package:flutter/material.dart';
import 'package:malsan_plc/bloc/task_cubit.dart';
import 'package:malsan_plc/utils/colors.dart';
import 'package:malsan_plc/utils/injection.dart';
import '../../model/team_task.dart';
import '../../utils/size.dart';
import '../widget/input_form_fields.dart';
class CreateTask extends StatelessWidget {
  const CreateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Column(
          children: [

          ],
        )
    );
  }
}

class AddTaskSheet extends StatelessWidget {
  const AddTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(width: 36,height: 5,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(MySize.size12 ?? 0),
            ),
            ),
          ),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Input Fields
          const InputFormFields(
            label: "Task Name",
            placeholder: "Insert Task Name",
          ),
          const SizedBox(height: 12),
          const InputFormFields(
            label: "Assign Member (Optional)",
            placeholder: "Select Member",
            isDropdown: true,
          ),
          const SizedBox(height: 12),
          const InputFormFields(
            label: "Due Date (Optional)",
            placeholder: "Insert Due Date",
            isDatePicker: true,
          ),
          const SizedBox(height: 12),
          const InputFormFields(
            label: "Due Time (Optional)",
            placeholder: "Insert Due Time",
            isTimePicker: true,
          ),
          const SizedBox(height: 16),
          // Create Task Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async{
             await  getIt<TeamTaskCubit>().addNewTeamTask(TaskList(
                  title: "Operational tasks",
                  date: "Oct 12 5:00 PM",
                  status: 0,
                  isDivider: true,
                  dateColor: AppColors.lightYellow,
                  statusColor: AppColors.black,
                  assignedMembers: [
                    AssignedMember(
                      name: "Belachew Shewankiden",
                      title: "Flutter Developer",
                    ),
                    AssignedMember(
                        name: "Abebe Kebede",
                        title: "Flutter Developer",
                        profileImage: "assets/profile.png"
                    ),
                  ],
                ));
             Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MySize.size12??0),
                ),
              ),
              child: const Text("Create Task"),
            ),
          ),
        ],
      ),
    );
  }
}