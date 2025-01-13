// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      taskId: json['taskId'] as String,
      taskTitle: json['taskTitle'] as String,
      taskDesc: json['taskDesc'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      projectId: json['projectId'] as String,
      isCompleted: json['isCompleted'] as bool,
      totalFocusedSessionsInSeconds:
          (json['totalFocusedSessionsInSeconds'] as num?)?.toInt() ?? 0,
      reminderDate: json['reminderDate'] == null
          ? null
          : DateTime.parse(json['reminderDate'] as String),
      reminderTime: (json['reminderTime'] as num?)?.toInt(),
      repeat: json['repeat'] as bool,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'taskTitle': instance.taskTitle,
      'taskDesc': instance.taskDesc,
      'dueDate': instance.dueDate.toIso8601String(),
      'priority': _$PriorityEnumMap[instance.priority]!,
      'projectId': instance.projectId,
      'isCompleted': instance.isCompleted,
      'totalFocusedSessionsInSeconds': instance.totalFocusedSessionsInSeconds,
      'reminderDate': instance.reminderDate?.toIso8601String(),
      'reminderTime': instance.reminderTime,
      'repeat': instance.repeat,
    };

const _$PriorityEnumMap = {
  Priority.low: 'low',
  Priority.medium: 'medium',
  Priority.high: 'high',
};
