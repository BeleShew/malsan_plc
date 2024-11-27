import 'package:malsan_plc/model/team_task.dart';
import 'package:malsan_plc/utils/colors.dart';

class TaskTeamAPI {
  TaskTeamAPI() : super();

  Future<List<TeamTask>?> getTeamTask({Map<String, dynamic>? queryParameters}) async {
    try {
      return await Future.delayed(const Duration(milliseconds: 500), () {
        return [
          TeamTask(
            name: 'Development Team',
            buttonText: "Add Task",
            tasks: [
              TaskList(
                title: 'Survey review and analysis',
                date: 'Oct 12 1:00 PM',
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
                  ),
                  AssignedMember(
                    name: "Kebede Abebe",
                    title: "Flutter Developer",
                  ),
                  AssignedMember(
                    name: "Olika Abebe",
                    title: "Flutter Developer",
                  ),
                ],
              ),
              TaskList(
                title: 'Calendar integration',
                date: 'Oct 12 5:00 PM',
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
              ),
              TaskList(
                title: 'Cloud-based backend for task data and messages',
                date: 'Oct 12 5:00 PM',
                status: 0,
                isDivider: false,
                dateColor: AppColors.lightRed,
                statusColor: AppColors.brightRed,
                assignedMembers: [
                  AssignedMember(
                    name: "Belachew Shewankiden",
                    title: "Flutter Developer",
                  ),
                ],
              ),
            ],
          ),
          TeamTask(
            name: 'AIG Study Team',
            buttonText: "Add Task",
            tasks: [
              TaskList(
                title: 'Survey review and analysis',
                date: 'Oct 12 1:00 PM',
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
                  ),
                  AssignedMember(
                    name: "Kebede Abebe",
                    title: "Flutter Developer",
                  ),
                  AssignedMember(
                    name: "Olika Abebe",
                    title: "Flutter Developer",
                  ),
                  AssignedMember(
                    name: "Solkiyas Abebe",
                    title: "Flutter Developer",
                  ),
                ],
              ),
              TaskList(
                title: 'Calendar integration',
                date: 'Oct 12 5:00 PM',
                status: 0,
                isDivider: true,
                dateColor: AppColors.lightYellow,
                statusColor: AppColors.black,
                assignedMembers: [
                  AssignedMember(
                    name: "Belachew Shewankiden",
                    title: "Flutter Developer",
                  ),
                ],
              ),
              TaskList(
                title: 'Cloud-based backend for task data and messages',
                date: 'Oct 12 5:00 PM',
                status: 0,
                isDivider: false,
                dateColor: AppColors.lightRed,
                statusColor: AppColors.brightRed,
                assignedMembers: [
                  AssignedMember(
                    name: "Belachew Shewankiden",
                    title: "Flutter Developer",
                  ),
                ],
              ),
            ],
          )
        ];
      });
    } catch (e) {
      return [];
    }
  }
}
