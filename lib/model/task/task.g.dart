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
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'taskTitle': instance.taskTitle,
      'taskDesc': instance.taskDesc,
      'dueDate': instance.dueDate.toIso8601String(),
      'priority': _$PriorityEnumMap[instance.priority]!,
      'projectId': instance.projectId,
    };

const _$PriorityEnumMap = {
  Priority.low: 'low',
  Priority.medium: 'medium',
  Priority.high: 'high',
};
