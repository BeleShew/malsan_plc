import 'package:flutter/material.dart';

class TeamTask {
  final String? name;
  final List<TaskList>? tasks;
  final String? buttonText;
  TeamTask({this.name, this.tasks,this.buttonText});

  TeamTask copyWith({
    String? name,
    List<TaskList>? tasks,
    String? buttonText,
  }) {
    return TeamTask(
      name: name ?? this.name,
      tasks: tasks ?? this.tasks,
      buttonText: buttonText ?? this.buttonText,
    );
  }

  factory TeamTask.fromJson(Map<String, dynamic> json) {
    return TeamTask(
      name: json['name'] as String?,
      buttonText: json['buttonText'] as String?,
      tasks: (json['tasks'] as List<dynamic>?)?.map((e) => TaskList.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'buttonText': buttonText,
      'tasks': tasks?.map((e) => e.toJson()).toList(),
    };
  }
}

class TaskList {
  final String? title;
  final String? date;
  final int? status; // Status 0: Not Started, 1: In Progress, 2: Completed
  final List<AssignedMember>? assignedMembers;
  final bool? isDivider;
  final Color? dateColor;
  final Color? statusColor;

  TaskList({
    this.title,
    this.date,
    this.status,
    this.assignedMembers,
    this.isDivider,
    this.statusColor,
    this.dateColor,
  });

  TaskList copyWith({
    String? title,
    String? date,
    int? status,
    bool? isDivider,
    Color? dateColor,
    Color? statusColor,
    List<AssignedMember>? assignedMembers,
  }) {
    return TaskList(
      title: title ?? this.title,
      date: date ?? this.date,
      status: status ?? this.status,
      isDivider: isDivider ?? this.isDivider,
      dateColor: dateColor ?? this.dateColor,
      statusColor: statusColor ?? this.statusColor,
      assignedMembers: assignedMembers ?? this.assignedMembers,
    );
  }

  factory TaskList.fromJson(Map<String, dynamic> json) {
    return TaskList(
      title: json['title'] as String?,
      date: json['date'] as String?,
      status: json['status'] as int?,
      isDivider: json['isDivider'] as bool?,
      dateColor: json['dateColor'] as Color?,
      statusColor: json['statusColor'] as Color?,
      // assignedMembers: (json['assignedMembers'] as List<AssignedMember>?)?.map((e) => e).toList(),
      assignedMembers: (json['assignedMembers'] as List<dynamic>?)?.map((e) => AssignedMember.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'status': status,
      'isDivider': isDivider,
      // 'assignedMembers': assignedMembers,
      'assignedMembers': assignedMembers?.map((e) => e.toJson()).toList(),
      'statusColor': statusColor,
      'dateColor': dateColor,
    };
  }
}

class AssignedMember {
  final String? title;
  final String? name;
  final String? profileImage;

  AssignedMember({
    this.title,
    this.name,
    this.profileImage,
  });

  factory AssignedMember.fromJson(Map<String, dynamic> json) {
    return AssignedMember(
      title: json['title'] as String?,
      name: json['name'] as String?,
      profileImage: json['profileImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'profileImage': profileImage,
      'name': name,
    };
  }
}
