// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get taskId => throw _privateConstructorUsedError;
  String get taskTitle => throw _privateConstructorUsedError;
  String get taskDesc => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  Priority get priority => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String taskId,
      String taskTitle,
      String taskDesc,
      DateTime dueDate,
      Priority priority,
      String projectId,
      bool isCompleted});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? taskTitle = null,
    Object? taskDesc = null,
    Object? dueDate = null,
    Object? priority = null,
    Object? projectId = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      taskTitle: null == taskTitle
          ? _value.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String,
      taskDesc: null == taskDesc
          ? _value.taskDesc
          : taskDesc // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String taskId,
      String taskTitle,
      String taskDesc,
      DateTime dueDate,
      Priority priority,
      String projectId,
      bool isCompleted});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? taskTitle = null,
    Object? taskDesc = null,
    Object? dueDate = null,
    Object? priority = null,
    Object? projectId = null,
    Object? isCompleted = null,
  }) {
    return _then(_$TaskImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      taskTitle: null == taskTitle
          ? _value.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String,
      taskDesc: null == taskDesc
          ? _value.taskDesc
          : taskDesc // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  _$TaskImpl(
      {required this.taskId,
      required this.taskTitle,
      required this.taskDesc,
      required this.dueDate,
      required this.priority,
      required this.projectId,
      required this.isCompleted});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String taskId;
  @override
  final String taskTitle;
  @override
  final String taskDesc;
  @override
  final DateTime dueDate;
  @override
  final Priority priority;
  @override
  final String projectId;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'Task(taskId: $taskId, taskTitle: $taskTitle, taskDesc: $taskDesc, dueDate: $dueDate, priority: $priority, projectId: $projectId, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.taskTitle, taskTitle) ||
                other.taskTitle == taskTitle) &&
            (identical(other.taskDesc, taskDesc) ||
                other.taskDesc == taskDesc) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, taskTitle, taskDesc,
      dueDate, priority, projectId, isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  factory _Task(
      {required final String taskId,
      required final String taskTitle,
      required final String taskDesc,
      required final DateTime dueDate,
      required final Priority priority,
      required final String projectId,
      required final bool isCompleted}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get taskId;
  @override
  String get taskTitle;
  @override
  String get taskDesc;
  @override
  DateTime get dueDate;
  @override
  Priority get priority;
  @override
  String get projectId;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
