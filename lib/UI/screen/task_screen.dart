import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:malsan_plc/bloc/task_cubit.dart';
import '../../utils/colors.dart';
import '../../utils/injection.dart';
import '../../utils/size.dart';
import '../../utils/thems.dart';
import '../widget/icon_text_card.dart';
import '../widget/search.dart';
import 'package:malsan_plc/model/team_task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(MySize.size10 ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Search(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MySize.size5 ?? 0,
              horizontal: MySize.size10 ?? 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomIconTextCard(
                  imagePath: "assets/calendar.png",
                  text: "Today",
                ),
                SizedBox(
                  width: MySize.size10,
                ),
                const CustomIconTextCard(
                  imagePath: "assets/calendar-stats.png",
                  text: "Scheduled",
                ),
                SizedBox(
                  width: MySize.size10,
                ),
                const CustomIconTextCard(
                  imagePath: "assets/user-circle.png",
                  text: "Assigned to me",
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<TeamTaskCubit, TeamTaskState>(
              listener: (context, state) {},
              bloc: getIt<TeamTaskCubit>(),
              buildWhen: (a, b) => a != b,
              listenWhen: (a, b) => a != b,
              builder: (context, state) {
                if (state is TeamTaskInitial) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }
                if (state is TeamTaskLoaded) {
                  return _taskList(state, themeData);
                } else {
                  return const Center(
                    child: Text("Currently the data is empty"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _taskList(TeamTaskLoaded state, ThemeData themeData) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.response?.length ?? 0,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: MySize.size12 ?? 0, horizontal: MySize.size12 ?? 0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(MySize.size12 ?? 0),
              border: Border.all(color: AppColors.containerBoarder, width: 1),
            ),
            child: _expansionList(state, index, themeData),
          ),
        );
      },
    );
  }

  Widget _expansionList(TeamTaskLoaded state, int index, ThemeData themeData) {
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: EdgeInsets.symmetric(horizontal: MySize.size8 ?? 0),
      dense: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      childrenPadding: EdgeInsets.zero,
      title: _buildTaskTitle(state, index, themeData),
      trailing: _trailing(),
      leading: _leading(),
      children: [
        _buildTaskDetails(state, index, themeData),
        SizedBox(
          height: MySize.size30,
        ),
        _buildTaskButton(state, index, themeData),
      ],
    );
  }

  Widget _leading() {
    return SizedBox(
        height: MySize.size64,
        width: MySize.size24,
        child: _imageIcon("assets/chevron-up.png"));
  }

  Widget _trailing() {
    return SizedBox(
        height: MySize.size34,
        width: MySize.size34,
        child: _imageIcon("assets/dots-vertical.png"));
  }

  Widget _buildTaskTitle(TeamTaskLoaded state, int index, ThemeData themeData) {
    return Text(
      state.response?[index].name ?? "",
      style: AppTheme.getTextStyle(
        themeData.textTheme.bodyLarge!,
        color: AppColors.primary,
        fontWeight: 700,
        fontSize: MySize.size20,
      ),
    );
  }

  Widget _buildTaskDetails(TeamTaskLoaded state, int index, ThemeData themeData) {
    return Column(
      children: state.response?[index].tasks?.map((task) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size10 ?? 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _imageIcon("assets/check.png"),
                      SizedBox(
                        width: MySize.size10,
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            task.title ?? "",
                            style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyLarge!,
                              color: AppColors.lightBlack,
                              fontWeight: 400,
                              fontSize: MySize.size16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "${task.status ?? ""}%",
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyLarge!,
                            color: task.statusColor,
                            fontWeight: 700,
                            fontSize: MySize.size12,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MySize.size12,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: task.dateColor ?? AppColors.lightRed,
                          borderRadius:
                              BorderRadius.circular(MySize.size12 ?? 0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MySize.size5 ?? 0,
                              vertical: MySize.size0 ?? 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _imageIcon("assets/clock.png"),
                              SizedBox(
                                width: MySize.size5,
                              ),
                              Flexible(
                                child: Text(
                                  task.date ?? "",
                                  style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyLarge!,
                                    color: AppColors.lightBlack,
                                    fontWeight: 500,
                                    fontSize: MySize.size14,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _assignedMember(task, themeData),
                      Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius:
                                BorderRadius.circular(MySize.size20 ?? 0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(MySize.size2 ?? 0),
                            child: const Icon(
                              Icons.more_horiz,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MySize.size14,
                  ),
                  task.isDivider ?? false ? const Divider() : Container(),
                ],
              ),
            );
          }).toList() ??
          [],
    );
  }

  Widget _assignedMember(TaskList task, ThemeData themeData) {
    return SizedBox(
      height: 50,
      width: 130,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ...task.assignedMembers
              ?.asMap()
              .entries
              .take(2) // Take only the first 2 members
              .map((entry) {
            int index = entry.key;
            String member = entry.value.name ?? "";
            String profile = entry.value.profileImage ?? "";
            return Positioned(
              left: index * 15.0,
              child: Container(
                decoration: BoxDecoration(
                  color: RandomColor.getColorObject(Options(
                    colorType: ColorType.blue,
                    luminosity: Luminosity.light,
                  ),),
                  borderRadius: BorderRadius.circular(MySize.size20 ?? 0),
                ),
                child: profile.isNotEmpty
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    profile,
                    height: 25,
                    width: 25,
                  ),
                )
                    : Padding(
                  padding: EdgeInsets.all(MySize.size5 ?? 0),
                  child: Text(
                    _getInitials(member),
                    style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyLarge!,
                      color: AppColors.lightBlack,
                      fontWeight: 400,
                      fontSize: MySize.size10,
                    ),
                  ),
                ),
              ),
            );
          }).toList() ?? [],
          // Add the remaining members count
          if ((task.assignedMembers?.length ?? 0) > 2)
            Positioned(
              left: 2 * 15.0, // Position after the 2nd member
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  "+${(task.assignedMembers?.length ?? 0) - 2}",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.bodyLarge!,
                    color: Colors.white,
                    fontWeight: 400,
                    fontSize: MySize.size10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = nameParts.length > 1 ? nameParts[0][0] + nameParts[1][0] : nameParts[0][0];
    return initials.toUpperCase();
  }


  Widget _imageIcon(String sources) => Image.asset(sources);

  Widget _buildTaskButton(TeamTaskLoaded state, int index, ThemeData themeData) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MySize.size12 ?? 0, vertical: MySize.size10 ?? 0),
      child: ElevatedButton(
        onPressed: () async {},
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.backgroundColor,
          backgroundColor: AppColors
              .backgroundColor, // Set the text color (when the button is not pressed)
          side: const BorderSide(
              color: AppColors.primary), // Set border color to purple
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                MySize.size12 ?? 0), // Set border radius to 10
          ),
          minimumSize: const Size(double.infinity,
              50), // Set button width to fill its container (full width)
          padding: EdgeInsets.symmetric(
              vertical:
                  MySize.size16 ?? 0), // Optional: adjust padding if needed
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: AppColors.primary,
            ),
            Text(
              state.response?[index].buttonText ?? "",
              style: AppTheme.getTextStyle(
                color: AppColors.primary,
                themeData.textTheme.bodyLarge!,
                fontWeight: 700,
                fontSize: MySize.size18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
