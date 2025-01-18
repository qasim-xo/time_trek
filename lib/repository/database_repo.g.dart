// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_repo.dart';

// ignore_for_file: type=lint
class $ProjectDatabaseTableTable extends ProjectDatabaseTable
    with TableInfo<$ProjectDatabaseTableTable, ProjectDatabaseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectDatabaseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _projectTitleMeta =
      const VerificationMeta('projectTitle');
  @override
  late final GeneratedColumn<String> projectTitle = GeneratedColumn<String>(
      'project_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, projectId, projectTitle];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_database_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProjectDatabaseTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('project_title')) {
      context.handle(
          _projectTitleMeta,
          projectTitle.isAcceptableOrUnknown(
              data['project_title']!, _projectTitleMeta));
    } else if (isInserting) {
      context.missing(_projectTitleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectDatabaseTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectDatabaseTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      projectTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_title'])!,
    );
  }

  @override
  $ProjectDatabaseTableTable createAlias(String alias) {
    return $ProjectDatabaseTableTable(attachedDatabase, alias);
  }
}

class ProjectDatabaseTableData extends DataClass
    implements Insertable<ProjectDatabaseTableData> {
  final int id;
  final String projectId;
  final String projectTitle;
  const ProjectDatabaseTableData(
      {required this.id, required this.projectId, required this.projectTitle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<String>(projectId);
    map['project_title'] = Variable<String>(projectTitle);
    return map;
  }

  ProjectDatabaseTableCompanion toCompanion(bool nullToAbsent) {
    return ProjectDatabaseTableCompanion(
      id: Value(id),
      projectId: Value(projectId),
      projectTitle: Value(projectTitle),
    );
  }

  factory ProjectDatabaseTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectDatabaseTableData(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      projectTitle: serializer.fromJson<String>(json['projectTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<String>(projectId),
      'projectTitle': serializer.toJson<String>(projectTitle),
    };
  }

  ProjectDatabaseTableData copyWith(
          {int? id, String? projectId, String? projectTitle}) =>
      ProjectDatabaseTableData(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        projectTitle: projectTitle ?? this.projectTitle,
      );
  ProjectDatabaseTableData copyWithCompanion(
      ProjectDatabaseTableCompanion data) {
    return ProjectDatabaseTableData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      projectTitle: data.projectTitle.present
          ? data.projectTitle.value
          : this.projectTitle,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectDatabaseTableData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('projectTitle: $projectTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, projectTitle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectDatabaseTableData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.projectTitle == this.projectTitle);
}

class ProjectDatabaseTableCompanion
    extends UpdateCompanion<ProjectDatabaseTableData> {
  final Value<int> id;
  final Value<String> projectId;
  final Value<String> projectTitle;
  const ProjectDatabaseTableCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.projectTitle = const Value.absent(),
  });
  ProjectDatabaseTableCompanion.insert({
    this.id = const Value.absent(),
    required String projectId,
    required String projectTitle,
  })  : projectId = Value(projectId),
        projectTitle = Value(projectTitle);
  static Insertable<ProjectDatabaseTableData> custom({
    Expression<int>? id,
    Expression<String>? projectId,
    Expression<String>? projectTitle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (projectTitle != null) 'project_title': projectTitle,
    });
  }

  ProjectDatabaseTableCompanion copyWith(
      {Value<int>? id, Value<String>? projectId, Value<String>? projectTitle}) {
    return ProjectDatabaseTableCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      projectTitle: projectTitle ?? this.projectTitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (projectTitle.present) {
      map['project_title'] = Variable<String>(projectTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectDatabaseTableCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('projectTitle: $projectTitle')
          ..write(')'))
        .toString();
  }
}

class $TaskDatabaseTableTable extends TaskDatabaseTable
    with TableInfo<$TaskDatabaseTableTable, TaskDatabaseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskDatabaseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
      'task_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notificationIDMeta =
      const VerificationMeta('notificationID');
  @override
  late final GeneratedColumn<int> notificationID = GeneratedColumn<int>(
      'notification_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _taskTitleMeta =
      const VerificationMeta('taskTitle');
  @override
  late final GeneratedColumn<String> taskTitle = GeneratedColumn<String>(
      'task_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _taskDescMeta =
      const VerificationMeta('taskDesc');
  @override
  late final GeneratedColumn<String> taskDesc = GeneratedColumn<String>(
      'task_desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<Priority, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Priority>($TaskDatabaseTableTable.$converterstatus);
  static const VerificationMeta _totalFocusedSessionsInSecondsMeta =
      const VerificationMeta('totalFocusedSessionsInSeconds');
  @override
  late final GeneratedColumn<int> totalFocusedSessionsInSeconds =
      GeneratedColumn<int>(
          'total_focused_sessions_in_seconds', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: Constant(0));
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES project_database_table (project_id)'));
  static const VerificationMeta _reminderDateTimeMeta =
      const VerificationMeta('reminderDateTime');
  @override
  late final GeneratedColumn<DateTime> reminderDateTime =
      GeneratedColumn<DateTime>('reminder_date_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _repeatMeta = const VerificationMeta('repeat');
  @override
  late final GeneratedColumn<bool> repeat = GeneratedColumn<bool>(
      'repeat', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("repeat" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        taskId,
        notificationID,
        taskTitle,
        taskDesc,
        dueDate,
        isCompleted,
        status,
        totalFocusedSessionsInSeconds,
        projectId,
        reminderDateTime,
        repeat
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_database_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<TaskDatabaseTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('notification_i_d')) {
      context.handle(
          _notificationIDMeta,
          notificationID.isAcceptableOrUnknown(
              data['notification_i_d']!, _notificationIDMeta));
    } else if (isInserting) {
      context.missing(_notificationIDMeta);
    }
    if (data.containsKey('task_title')) {
      context.handle(_taskTitleMeta,
          taskTitle.isAcceptableOrUnknown(data['task_title']!, _taskTitleMeta));
    } else if (isInserting) {
      context.missing(_taskTitleMeta);
    }
    if (data.containsKey('task_desc')) {
      context.handle(_taskDescMeta,
          taskDesc.isAcceptableOrUnknown(data['task_desc']!, _taskDescMeta));
    } else if (isInserting) {
      context.missing(_taskDescMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('total_focused_sessions_in_seconds')) {
      context.handle(
          _totalFocusedSessionsInSecondsMeta,
          totalFocusedSessionsInSeconds.isAcceptableOrUnknown(
              data['total_focused_sessions_in_seconds']!,
              _totalFocusedSessionsInSecondsMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('reminder_date_time')) {
      context.handle(
          _reminderDateTimeMeta,
          reminderDateTime.isAcceptableOrUnknown(
              data['reminder_date_time']!, _reminderDateTimeMeta));
    }
    if (data.containsKey('repeat')) {
      context.handle(_repeatMeta,
          repeat.isAcceptableOrUnknown(data['repeat']!, _repeatMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskDatabaseTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskDatabaseTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_id'])!,
      notificationID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}notification_i_d'])!,
      taskTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_title'])!,
      taskDesc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_desc'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      status: $TaskDatabaseTableTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      totalFocusedSessionsInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}total_focused_sessions_in_seconds'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      reminderDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}reminder_date_time']),
      repeat: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}repeat'])!,
    );
  }

  @override
  $TaskDatabaseTableTable createAlias(String alias) {
    return $TaskDatabaseTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Priority, int, int> $converterstatus =
      const EnumIndexConverter<Priority>(Priority.values);
}

class TaskDatabaseTableData extends DataClass
    implements Insertable<TaskDatabaseTableData> {
  final int id;
  final String taskId;
  final int notificationID;
  final String taskTitle;
  final String taskDesc;
  final DateTime dueDate;
  final bool isCompleted;
  final Priority status;
  final int totalFocusedSessionsInSeconds;
  final String projectId;
  final DateTime? reminderDateTime;
  final bool repeat;
  const TaskDatabaseTableData(
      {required this.id,
      required this.taskId,
      required this.notificationID,
      required this.taskTitle,
      required this.taskDesc,
      required this.dueDate,
      required this.isCompleted,
      required this.status,
      required this.totalFocusedSessionsInSeconds,
      required this.projectId,
      this.reminderDateTime,
      required this.repeat});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<String>(taskId);
    map['notification_i_d'] = Variable<int>(notificationID);
    map['task_title'] = Variable<String>(taskTitle);
    map['task_desc'] = Variable<String>(taskDesc);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['is_completed'] = Variable<bool>(isCompleted);
    {
      map['status'] =
          Variable<int>($TaskDatabaseTableTable.$converterstatus.toSql(status));
    }
    map['total_focused_sessions_in_seconds'] =
        Variable<int>(totalFocusedSessionsInSeconds);
    map['project_id'] = Variable<String>(projectId);
    if (!nullToAbsent || reminderDateTime != null) {
      map['reminder_date_time'] = Variable<DateTime>(reminderDateTime);
    }
    map['repeat'] = Variable<bool>(repeat);
    return map;
  }

  TaskDatabaseTableCompanion toCompanion(bool nullToAbsent) {
    return TaskDatabaseTableCompanion(
      id: Value(id),
      taskId: Value(taskId),
      notificationID: Value(notificationID),
      taskTitle: Value(taskTitle),
      taskDesc: Value(taskDesc),
      dueDate: Value(dueDate),
      isCompleted: Value(isCompleted),
      status: Value(status),
      totalFocusedSessionsInSeconds: Value(totalFocusedSessionsInSeconds),
      projectId: Value(projectId),
      reminderDateTime: reminderDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderDateTime),
      repeat: Value(repeat),
    );
  }

  factory TaskDatabaseTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskDatabaseTableData(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<String>(json['taskId']),
      notificationID: serializer.fromJson<int>(json['notificationID']),
      taskTitle: serializer.fromJson<String>(json['taskTitle']),
      taskDesc: serializer.fromJson<String>(json['taskDesc']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      status: $TaskDatabaseTableTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      totalFocusedSessionsInSeconds:
          serializer.fromJson<int>(json['totalFocusedSessionsInSeconds']),
      projectId: serializer.fromJson<String>(json['projectId']),
      reminderDateTime:
          serializer.fromJson<DateTime?>(json['reminderDateTime']),
      repeat: serializer.fromJson<bool>(json['repeat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<String>(taskId),
      'notificationID': serializer.toJson<int>(notificationID),
      'taskTitle': serializer.toJson<String>(taskTitle),
      'taskDesc': serializer.toJson<String>(taskDesc),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'status': serializer
          .toJson<int>($TaskDatabaseTableTable.$converterstatus.toJson(status)),
      'totalFocusedSessionsInSeconds':
          serializer.toJson<int>(totalFocusedSessionsInSeconds),
      'projectId': serializer.toJson<String>(projectId),
      'reminderDateTime': serializer.toJson<DateTime?>(reminderDateTime),
      'repeat': serializer.toJson<bool>(repeat),
    };
  }

  TaskDatabaseTableData copyWith(
          {int? id,
          String? taskId,
          int? notificationID,
          String? taskTitle,
          String? taskDesc,
          DateTime? dueDate,
          bool? isCompleted,
          Priority? status,
          int? totalFocusedSessionsInSeconds,
          String? projectId,
          Value<DateTime?> reminderDateTime = const Value.absent(),
          bool? repeat}) =>
      TaskDatabaseTableData(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        notificationID: notificationID ?? this.notificationID,
        taskTitle: taskTitle ?? this.taskTitle,
        taskDesc: taskDesc ?? this.taskDesc,
        dueDate: dueDate ?? this.dueDate,
        isCompleted: isCompleted ?? this.isCompleted,
        status: status ?? this.status,
        totalFocusedSessionsInSeconds:
            totalFocusedSessionsInSeconds ?? this.totalFocusedSessionsInSeconds,
        projectId: projectId ?? this.projectId,
        reminderDateTime: reminderDateTime.present
            ? reminderDateTime.value
            : this.reminderDateTime,
        repeat: repeat ?? this.repeat,
      );
  TaskDatabaseTableData copyWithCompanion(TaskDatabaseTableCompanion data) {
    return TaskDatabaseTableData(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      notificationID: data.notificationID.present
          ? data.notificationID.value
          : this.notificationID,
      taskTitle: data.taskTitle.present ? data.taskTitle.value : this.taskTitle,
      taskDesc: data.taskDesc.present ? data.taskDesc.value : this.taskDesc,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      status: data.status.present ? data.status.value : this.status,
      totalFocusedSessionsInSeconds: data.totalFocusedSessionsInSeconds.present
          ? data.totalFocusedSessionsInSeconds.value
          : this.totalFocusedSessionsInSeconds,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      reminderDateTime: data.reminderDateTime.present
          ? data.reminderDateTime.value
          : this.reminderDateTime,
      repeat: data.repeat.present ? data.repeat.value : this.repeat,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskDatabaseTableData(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('notificationID: $notificationID, ')
          ..write('taskTitle: $taskTitle, ')
          ..write('taskDesc: $taskDesc, ')
          ..write('dueDate: $dueDate, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('status: $status, ')
          ..write(
              'totalFocusedSessionsInSeconds: $totalFocusedSessionsInSeconds, ')
          ..write('projectId: $projectId, ')
          ..write('reminderDateTime: $reminderDateTime, ')
          ..write('repeat: $repeat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      taskId,
      notificationID,
      taskTitle,
      taskDesc,
      dueDate,
      isCompleted,
      status,
      totalFocusedSessionsInSeconds,
      projectId,
      reminderDateTime,
      repeat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskDatabaseTableData &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.notificationID == this.notificationID &&
          other.taskTitle == this.taskTitle &&
          other.taskDesc == this.taskDesc &&
          other.dueDate == this.dueDate &&
          other.isCompleted == this.isCompleted &&
          other.status == this.status &&
          other.totalFocusedSessionsInSeconds ==
              this.totalFocusedSessionsInSeconds &&
          other.projectId == this.projectId &&
          other.reminderDateTime == this.reminderDateTime &&
          other.repeat == this.repeat);
}

class TaskDatabaseTableCompanion
    extends UpdateCompanion<TaskDatabaseTableData> {
  final Value<int> id;
  final Value<String> taskId;
  final Value<int> notificationID;
  final Value<String> taskTitle;
  final Value<String> taskDesc;
  final Value<DateTime> dueDate;
  final Value<bool> isCompleted;
  final Value<Priority> status;
  final Value<int> totalFocusedSessionsInSeconds;
  final Value<String> projectId;
  final Value<DateTime?> reminderDateTime;
  final Value<bool> repeat;
  const TaskDatabaseTableCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.notificationID = const Value.absent(),
    this.taskTitle = const Value.absent(),
    this.taskDesc = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.status = const Value.absent(),
    this.totalFocusedSessionsInSeconds = const Value.absent(),
    this.projectId = const Value.absent(),
    this.reminderDateTime = const Value.absent(),
    this.repeat = const Value.absent(),
  });
  TaskDatabaseTableCompanion.insert({
    this.id = const Value.absent(),
    required String taskId,
    required int notificationID,
    required String taskTitle,
    required String taskDesc,
    required DateTime dueDate,
    required bool isCompleted,
    required Priority status,
    this.totalFocusedSessionsInSeconds = const Value.absent(),
    required String projectId,
    this.reminderDateTime = const Value.absent(),
    this.repeat = const Value.absent(),
  })  : taskId = Value(taskId),
        notificationID = Value(notificationID),
        taskTitle = Value(taskTitle),
        taskDesc = Value(taskDesc),
        dueDate = Value(dueDate),
        isCompleted = Value(isCompleted),
        status = Value(status),
        projectId = Value(projectId);
  static Insertable<TaskDatabaseTableData> custom({
    Expression<int>? id,
    Expression<String>? taskId,
    Expression<int>? notificationID,
    Expression<String>? taskTitle,
    Expression<String>? taskDesc,
    Expression<DateTime>? dueDate,
    Expression<bool>? isCompleted,
    Expression<int>? status,
    Expression<int>? totalFocusedSessionsInSeconds,
    Expression<String>? projectId,
    Expression<DateTime>? reminderDateTime,
    Expression<bool>? repeat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (notificationID != null) 'notification_i_d': notificationID,
      if (taskTitle != null) 'task_title': taskTitle,
      if (taskDesc != null) 'task_desc': taskDesc,
      if (dueDate != null) 'due_date': dueDate,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (status != null) 'status': status,
      if (totalFocusedSessionsInSeconds != null)
        'total_focused_sessions_in_seconds': totalFocusedSessionsInSeconds,
      if (projectId != null) 'project_id': projectId,
      if (reminderDateTime != null) 'reminder_date_time': reminderDateTime,
      if (repeat != null) 'repeat': repeat,
    });
  }

  TaskDatabaseTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? taskId,
      Value<int>? notificationID,
      Value<String>? taskTitle,
      Value<String>? taskDesc,
      Value<DateTime>? dueDate,
      Value<bool>? isCompleted,
      Value<Priority>? status,
      Value<int>? totalFocusedSessionsInSeconds,
      Value<String>? projectId,
      Value<DateTime?>? reminderDateTime,
      Value<bool>? repeat}) {
    return TaskDatabaseTableCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      notificationID: notificationID ?? this.notificationID,
      taskTitle: taskTitle ?? this.taskTitle,
      taskDesc: taskDesc ?? this.taskDesc,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
      status: status ?? this.status,
      totalFocusedSessionsInSeconds:
          totalFocusedSessionsInSeconds ?? this.totalFocusedSessionsInSeconds,
      projectId: projectId ?? this.projectId,
      reminderDateTime: reminderDateTime ?? this.reminderDateTime,
      repeat: repeat ?? this.repeat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (notificationID.present) {
      map['notification_i_d'] = Variable<int>(notificationID.value);
    }
    if (taskTitle.present) {
      map['task_title'] = Variable<String>(taskTitle.value);
    }
    if (taskDesc.present) {
      map['task_desc'] = Variable<String>(taskDesc.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(
          $TaskDatabaseTableTable.$converterstatus.toSql(status.value));
    }
    if (totalFocusedSessionsInSeconds.present) {
      map['total_focused_sessions_in_seconds'] =
          Variable<int>(totalFocusedSessionsInSeconds.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (reminderDateTime.present) {
      map['reminder_date_time'] = Variable<DateTime>(reminderDateTime.value);
    }
    if (repeat.present) {
      map['repeat'] = Variable<bool>(repeat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskDatabaseTableCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('notificationID: $notificationID, ')
          ..write('taskTitle: $taskTitle, ')
          ..write('taskDesc: $taskDesc, ')
          ..write('dueDate: $dueDate, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('status: $status, ')
          ..write(
              'totalFocusedSessionsInSeconds: $totalFocusedSessionsInSeconds, ')
          ..write('projectId: $projectId, ')
          ..write('reminderDateTime: $reminderDateTime, ')
          ..write('repeat: $repeat')
          ..write(')'))
        .toString();
  }
}

class $ProjectWiseStatsTableTable extends ProjectWiseStatsTable
    with TableInfo<$ProjectWiseStatsTableTable, ProjectWiseStatsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectWiseStatsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES task_database_table (project_id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _totalFocusedSessionsOnDateInSecondsMeta =
      const VerificationMeta('totalFocusedSessionsOnDateInSeconds');
  @override
  late final GeneratedColumn<int> totalFocusedSessionsOnDateInSeconds =
      GeneratedColumn<int>(
          'total_focused_sessions_on_date_in_seconds', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, projectId, date, totalFocusedSessionsOnDateInSeconds];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_wise_stats_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProjectWiseStatsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('total_focused_sessions_on_date_in_seconds')) {
      context.handle(
          _totalFocusedSessionsOnDateInSecondsMeta,
          totalFocusedSessionsOnDateInSeconds.isAcceptableOrUnknown(
              data['total_focused_sessions_on_date_in_seconds']!,
              _totalFocusedSessionsOnDateInSecondsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectWiseStatsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectWiseStatsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      totalFocusedSessionsOnDateInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}total_focused_sessions_on_date_in_seconds'])!,
    );
  }

  @override
  $ProjectWiseStatsTableTable createAlias(String alias) {
    return $ProjectWiseStatsTableTable(attachedDatabase, alias);
  }
}

class ProjectWiseStatsTableData extends DataClass
    implements Insertable<ProjectWiseStatsTableData> {
  final int id;
  final String projectId;
  final DateTime date;
  final int totalFocusedSessionsOnDateInSeconds;
  const ProjectWiseStatsTableData(
      {required this.id,
      required this.projectId,
      required this.date,
      required this.totalFocusedSessionsOnDateInSeconds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<String>(projectId);
    map['date'] = Variable<DateTime>(date);
    map['total_focused_sessions_on_date_in_seconds'] =
        Variable<int>(totalFocusedSessionsOnDateInSeconds);
    return map;
  }

  ProjectWiseStatsTableCompanion toCompanion(bool nullToAbsent) {
    return ProjectWiseStatsTableCompanion(
      id: Value(id),
      projectId: Value(projectId),
      date: Value(date),
      totalFocusedSessionsOnDateInSeconds:
          Value(totalFocusedSessionsOnDateInSeconds),
    );
  }

  factory ProjectWiseStatsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectWiseStatsTableData(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      date: serializer.fromJson<DateTime>(json['date']),
      totalFocusedSessionsOnDateInSeconds:
          serializer.fromJson<int>(json['totalFocusedSessionsOnDateInSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<String>(projectId),
      'date': serializer.toJson<DateTime>(date),
      'totalFocusedSessionsOnDateInSeconds':
          serializer.toJson<int>(totalFocusedSessionsOnDateInSeconds),
    };
  }

  ProjectWiseStatsTableData copyWith(
          {int? id,
          String? projectId,
          DateTime? date,
          int? totalFocusedSessionsOnDateInSeconds}) =>
      ProjectWiseStatsTableData(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        date: date ?? this.date,
        totalFocusedSessionsOnDateInSeconds:
            totalFocusedSessionsOnDateInSeconds ??
                this.totalFocusedSessionsOnDateInSeconds,
      );
  ProjectWiseStatsTableData copyWithCompanion(
      ProjectWiseStatsTableCompanion data) {
    return ProjectWiseStatsTableData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      date: data.date.present ? data.date.value : this.date,
      totalFocusedSessionsOnDateInSeconds:
          data.totalFocusedSessionsOnDateInSeconds.present
              ? data.totalFocusedSessionsOnDateInSeconds.value
              : this.totalFocusedSessionsOnDateInSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectWiseStatsTableData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('date: $date, ')
          ..write(
              'totalFocusedSessionsOnDateInSeconds: $totalFocusedSessionsOnDateInSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, projectId, date, totalFocusedSessionsOnDateInSeconds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectWiseStatsTableData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.date == this.date &&
          other.totalFocusedSessionsOnDateInSeconds ==
              this.totalFocusedSessionsOnDateInSeconds);
}

class ProjectWiseStatsTableCompanion
    extends UpdateCompanion<ProjectWiseStatsTableData> {
  final Value<int> id;
  final Value<String> projectId;
  final Value<DateTime> date;
  final Value<int> totalFocusedSessionsOnDateInSeconds;
  const ProjectWiseStatsTableCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.date = const Value.absent(),
    this.totalFocusedSessionsOnDateInSeconds = const Value.absent(),
  });
  ProjectWiseStatsTableCompanion.insert({
    this.id = const Value.absent(),
    required String projectId,
    required DateTime date,
    this.totalFocusedSessionsOnDateInSeconds = const Value.absent(),
  })  : projectId = Value(projectId),
        date = Value(date);
  static Insertable<ProjectWiseStatsTableData> custom({
    Expression<int>? id,
    Expression<String>? projectId,
    Expression<DateTime>? date,
    Expression<int>? totalFocusedSessionsOnDateInSeconds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (date != null) 'date': date,
      if (totalFocusedSessionsOnDateInSeconds != null)
        'total_focused_sessions_on_date_in_seconds':
            totalFocusedSessionsOnDateInSeconds,
    });
  }

  ProjectWiseStatsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? projectId,
      Value<DateTime>? date,
      Value<int>? totalFocusedSessionsOnDateInSeconds}) {
    return ProjectWiseStatsTableCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      date: date ?? this.date,
      totalFocusedSessionsOnDateInSeconds:
          totalFocusedSessionsOnDateInSeconds ??
              this.totalFocusedSessionsOnDateInSeconds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (totalFocusedSessionsOnDateInSeconds.present) {
      map['total_focused_sessions_on_date_in_seconds'] =
          Variable<int>(totalFocusedSessionsOnDateInSeconds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectWiseStatsTableCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('date: $date, ')
          ..write(
              'totalFocusedSessionsOnDateInSeconds: $totalFocusedSessionsOnDateInSeconds')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProjectDatabaseTableTable projectDatabaseTable =
      $ProjectDatabaseTableTable(this);
  late final $TaskDatabaseTableTable taskDatabaseTable =
      $TaskDatabaseTableTable(this);
  late final $ProjectWiseStatsTableTable projectWiseStatsTable =
      $ProjectWiseStatsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [projectDatabaseTable, taskDatabaseTable, projectWiseStatsTable];
}

typedef $$ProjectDatabaseTableTableCreateCompanionBuilder
    = ProjectDatabaseTableCompanion Function({
  Value<int> id,
  required String projectId,
  required String projectTitle,
});
typedef $$ProjectDatabaseTableTableUpdateCompanionBuilder
    = ProjectDatabaseTableCompanion Function({
  Value<int> id,
  Value<String> projectId,
  Value<String> projectTitle,
});

final class $$ProjectDatabaseTableTableReferences extends BaseReferences<
    _$AppDatabase, $ProjectDatabaseTableTable, ProjectDatabaseTableData> {
  $$ProjectDatabaseTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TaskDatabaseTableTable,
      List<TaskDatabaseTableData>> _taskDatabaseTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.taskDatabaseTable,
          aliasName: $_aliasNameGenerator(db.projectDatabaseTable.projectId,
              db.taskDatabaseTable.projectId));

  $$TaskDatabaseTableTableProcessedTableManager get taskDatabaseTableRefs {
    final manager =
        $$TaskDatabaseTableTableTableManager($_db, $_db.taskDatabaseTable)
            .filter((f) => f.projectId.projectId($_item.projectId));

    final cache =
        $_typedResult.readTableOrNull(_taskDatabaseTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProjectDatabaseTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectDatabaseTableTable> {
  $$ProjectDatabaseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectTitle => $composableBuilder(
      column: $table.projectTitle, builder: (column) => ColumnFilters(column));

  Expression<bool> taskDatabaseTableRefs(
      Expression<bool> Function($$TaskDatabaseTableTableFilterComposer f) f) {
    final $$TaskDatabaseTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.taskDatabaseTable,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskDatabaseTableTableFilterComposer(
              $db: $db,
              $table: $db.taskDatabaseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProjectDatabaseTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectDatabaseTableTable> {
  $$ProjectDatabaseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectTitle => $composableBuilder(
      column: $table.projectTitle,
      builder: (column) => ColumnOrderings(column));
}

class $$ProjectDatabaseTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectDatabaseTableTable> {
  $$ProjectDatabaseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get projectTitle => $composableBuilder(
      column: $table.projectTitle, builder: (column) => column);

  Expression<T> taskDatabaseTableRefs<T extends Object>(
      Expression<T> Function($$TaskDatabaseTableTableAnnotationComposer a) f) {
    final $$TaskDatabaseTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.projectId,
            referencedTable: $db.taskDatabaseTable,
            getReferencedColumn: (t) => t.projectId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TaskDatabaseTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.taskDatabaseTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProjectDatabaseTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProjectDatabaseTableTable,
    ProjectDatabaseTableData,
    $$ProjectDatabaseTableTableFilterComposer,
    $$ProjectDatabaseTableTableOrderingComposer,
    $$ProjectDatabaseTableTableAnnotationComposer,
    $$ProjectDatabaseTableTableCreateCompanionBuilder,
    $$ProjectDatabaseTableTableUpdateCompanionBuilder,
    (ProjectDatabaseTableData, $$ProjectDatabaseTableTableReferences),
    ProjectDatabaseTableData,
    PrefetchHooks Function({bool taskDatabaseTableRefs})> {
  $$ProjectDatabaseTableTableTableManager(
      _$AppDatabase db, $ProjectDatabaseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectDatabaseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectDatabaseTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectDatabaseTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> projectId = const Value.absent(),
            Value<String> projectTitle = const Value.absent(),
          }) =>
              ProjectDatabaseTableCompanion(
            id: id,
            projectId: projectId,
            projectTitle: projectTitle,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String projectId,
            required String projectTitle,
          }) =>
              ProjectDatabaseTableCompanion.insert(
            id: id,
            projectId: projectId,
            projectTitle: projectTitle,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProjectDatabaseTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({taskDatabaseTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (taskDatabaseTableRefs) db.taskDatabaseTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taskDatabaseTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProjectDatabaseTableTableReferences
                            ._taskDatabaseTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProjectDatabaseTableTableReferences(db, table, p0)
                                .taskDatabaseTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.projectId == item.projectId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProjectDatabaseTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ProjectDatabaseTableTable,
        ProjectDatabaseTableData,
        $$ProjectDatabaseTableTableFilterComposer,
        $$ProjectDatabaseTableTableOrderingComposer,
        $$ProjectDatabaseTableTableAnnotationComposer,
        $$ProjectDatabaseTableTableCreateCompanionBuilder,
        $$ProjectDatabaseTableTableUpdateCompanionBuilder,
        (ProjectDatabaseTableData, $$ProjectDatabaseTableTableReferences),
        ProjectDatabaseTableData,
        PrefetchHooks Function({bool taskDatabaseTableRefs})>;
typedef $$TaskDatabaseTableTableCreateCompanionBuilder
    = TaskDatabaseTableCompanion Function({
  Value<int> id,
  required String taskId,
  required int notificationID,
  required String taskTitle,
  required String taskDesc,
  required DateTime dueDate,
  required bool isCompleted,
  required Priority status,
  Value<int> totalFocusedSessionsInSeconds,
  required String projectId,
  Value<DateTime?> reminderDateTime,
  Value<bool> repeat,
});
typedef $$TaskDatabaseTableTableUpdateCompanionBuilder
    = TaskDatabaseTableCompanion Function({
  Value<int> id,
  Value<String> taskId,
  Value<int> notificationID,
  Value<String> taskTitle,
  Value<String> taskDesc,
  Value<DateTime> dueDate,
  Value<bool> isCompleted,
  Value<Priority> status,
  Value<int> totalFocusedSessionsInSeconds,
  Value<String> projectId,
  Value<DateTime?> reminderDateTime,
  Value<bool> repeat,
});

final class $$TaskDatabaseTableTableReferences extends BaseReferences<
    _$AppDatabase, $TaskDatabaseTableTable, TaskDatabaseTableData> {
  $$TaskDatabaseTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProjectDatabaseTableTable _projectIdTable(_$AppDatabase db) =>
      db.projectDatabaseTable.createAlias($_aliasNameGenerator(
          db.taskDatabaseTable.projectId, db.projectDatabaseTable.projectId));

  $$ProjectDatabaseTableTableProcessedTableManager get projectId {
    final manager =
        $$ProjectDatabaseTableTableTableManager($_db, $_db.projectDatabaseTable)
            .filter((f) => f.projectId($_item.projectId!));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TaskDatabaseTableTableFilterComposer
    extends Composer<_$AppDatabase, $TaskDatabaseTableTable> {
  $$TaskDatabaseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get notificationID => $composableBuilder(
      column: $table.notificationID,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskTitle => $composableBuilder(
      column: $table.taskTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskDesc => $composableBuilder(
      column: $table.taskDesc, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Priority, Priority, int> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get totalFocusedSessionsInSeconds => $composableBuilder(
      column: $table.totalFocusedSessionsInSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get reminderDateTime => $composableBuilder(
      column: $table.reminderDateTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get repeat => $composableBuilder(
      column: $table.repeat, builder: (column) => ColumnFilters(column));

  $$ProjectDatabaseTableTableFilterComposer get projectId {
    final $$ProjectDatabaseTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.projectId,
        referencedTable: $db.projectDatabaseTable,
        getReferencedColumn: (t) => t.projectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProjectDatabaseTableTableFilterComposer(
              $db: $db,
              $table: $db.projectDatabaseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TaskDatabaseTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskDatabaseTableTable> {
  $$TaskDatabaseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get notificationID => $composableBuilder(
      column: $table.notificationID,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskTitle => $composableBuilder(
      column: $table.taskTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskDesc => $composableBuilder(
      column: $table.taskDesc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalFocusedSessionsInSeconds => $composableBuilder(
      column: $table.totalFocusedSessionsInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get reminderDateTime => $composableBuilder(
      column: $table.reminderDateTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get repeat => $composableBuilder(
      column: $table.repeat, builder: (column) => ColumnOrderings(column));

  $$ProjectDatabaseTableTableOrderingComposer get projectId {
    final $$ProjectDatabaseTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.projectId,
            referencedTable: $db.projectDatabaseTable,
            getReferencedColumn: (t) => t.projectId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProjectDatabaseTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.projectDatabaseTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$TaskDatabaseTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskDatabaseTableTable> {
  $$TaskDatabaseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<int> get notificationID => $composableBuilder(
      column: $table.notificationID, builder: (column) => column);

  GeneratedColumn<String> get taskTitle =>
      $composableBuilder(column: $table.taskTitle, builder: (column) => column);

  GeneratedColumn<String> get taskDesc =>
      $composableBuilder(column: $table.taskDesc, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Priority, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get totalFocusedSessionsInSeconds => $composableBuilder(
      column: $table.totalFocusedSessionsInSeconds,
      builder: (column) => column);

  GeneratedColumn<DateTime> get reminderDateTime => $composableBuilder(
      column: $table.reminderDateTime, builder: (column) => column);

  GeneratedColumn<bool> get repeat =>
      $composableBuilder(column: $table.repeat, builder: (column) => column);

  $$ProjectDatabaseTableTableAnnotationComposer get projectId {
    final $$ProjectDatabaseTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.projectId,
            referencedTable: $db.projectDatabaseTable,
            getReferencedColumn: (t) => t.projectId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProjectDatabaseTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.projectDatabaseTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$TaskDatabaseTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskDatabaseTableTable,
    TaskDatabaseTableData,
    $$TaskDatabaseTableTableFilterComposer,
    $$TaskDatabaseTableTableOrderingComposer,
    $$TaskDatabaseTableTableAnnotationComposer,
    $$TaskDatabaseTableTableCreateCompanionBuilder,
    $$TaskDatabaseTableTableUpdateCompanionBuilder,
    (TaskDatabaseTableData, $$TaskDatabaseTableTableReferences),
    TaskDatabaseTableData,
    PrefetchHooks Function({bool projectId})> {
  $$TaskDatabaseTableTableTableManager(
      _$AppDatabase db, $TaskDatabaseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskDatabaseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskDatabaseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskDatabaseTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> taskId = const Value.absent(),
            Value<int> notificationID = const Value.absent(),
            Value<String> taskTitle = const Value.absent(),
            Value<String> taskDesc = const Value.absent(),
            Value<DateTime> dueDate = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<Priority> status = const Value.absent(),
            Value<int> totalFocusedSessionsInSeconds = const Value.absent(),
            Value<String> projectId = const Value.absent(),
            Value<DateTime?> reminderDateTime = const Value.absent(),
            Value<bool> repeat = const Value.absent(),
          }) =>
              TaskDatabaseTableCompanion(
            id: id,
            taskId: taskId,
            notificationID: notificationID,
            taskTitle: taskTitle,
            taskDesc: taskDesc,
            dueDate: dueDate,
            isCompleted: isCompleted,
            status: status,
            totalFocusedSessionsInSeconds: totalFocusedSessionsInSeconds,
            projectId: projectId,
            reminderDateTime: reminderDateTime,
            repeat: repeat,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String taskId,
            required int notificationID,
            required String taskTitle,
            required String taskDesc,
            required DateTime dueDate,
            required bool isCompleted,
            required Priority status,
            Value<int> totalFocusedSessionsInSeconds = const Value.absent(),
            required String projectId,
            Value<DateTime?> reminderDateTime = const Value.absent(),
            Value<bool> repeat = const Value.absent(),
          }) =>
              TaskDatabaseTableCompanion.insert(
            id: id,
            taskId: taskId,
            notificationID: notificationID,
            taskTitle: taskTitle,
            taskDesc: taskDesc,
            dueDate: dueDate,
            isCompleted: isCompleted,
            status: status,
            totalFocusedSessionsInSeconds: totalFocusedSessionsInSeconds,
            projectId: projectId,
            reminderDateTime: reminderDateTime,
            repeat: repeat,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TaskDatabaseTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (projectId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.projectId,
                    referencedTable:
                        $$TaskDatabaseTableTableReferences._projectIdTable(db),
                    referencedColumn: $$TaskDatabaseTableTableReferences
                        ._projectIdTable(db)
                        .projectId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TaskDatabaseTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskDatabaseTableTable,
    TaskDatabaseTableData,
    $$TaskDatabaseTableTableFilterComposer,
    $$TaskDatabaseTableTableOrderingComposer,
    $$TaskDatabaseTableTableAnnotationComposer,
    $$TaskDatabaseTableTableCreateCompanionBuilder,
    $$TaskDatabaseTableTableUpdateCompanionBuilder,
    (TaskDatabaseTableData, $$TaskDatabaseTableTableReferences),
    TaskDatabaseTableData,
    PrefetchHooks Function({bool projectId})>;
typedef $$ProjectWiseStatsTableTableCreateCompanionBuilder
    = ProjectWiseStatsTableCompanion Function({
  Value<int> id,
  required String projectId,
  required DateTime date,
  Value<int> totalFocusedSessionsOnDateInSeconds,
});
typedef $$ProjectWiseStatsTableTableUpdateCompanionBuilder
    = ProjectWiseStatsTableCompanion Function({
  Value<int> id,
  Value<String> projectId,
  Value<DateTime> date,
  Value<int> totalFocusedSessionsOnDateInSeconds,
});

class $$ProjectWiseStatsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectWiseStatsTableTable> {
  $$ProjectWiseStatsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalFocusedSessionsOnDateInSeconds =>
      $composableBuilder(
          column: $table.totalFocusedSessionsOnDateInSeconds,
          builder: (column) => ColumnFilters(column));
}

class $$ProjectWiseStatsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectWiseStatsTableTable> {
  $$ProjectWiseStatsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalFocusedSessionsOnDateInSeconds =>
      $composableBuilder(
          column: $table.totalFocusedSessionsOnDateInSeconds,
          builder: (column) => ColumnOrderings(column));
}

class $$ProjectWiseStatsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectWiseStatsTableTable> {
  $$ProjectWiseStatsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get totalFocusedSessionsOnDateInSeconds =>
      $composableBuilder(
          column: $table.totalFocusedSessionsOnDateInSeconds,
          builder: (column) => column);
}

class $$ProjectWiseStatsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProjectWiseStatsTableTable,
    ProjectWiseStatsTableData,
    $$ProjectWiseStatsTableTableFilterComposer,
    $$ProjectWiseStatsTableTableOrderingComposer,
    $$ProjectWiseStatsTableTableAnnotationComposer,
    $$ProjectWiseStatsTableTableCreateCompanionBuilder,
    $$ProjectWiseStatsTableTableUpdateCompanionBuilder,
    (
      ProjectWiseStatsTableData,
      BaseReferences<_$AppDatabase, $ProjectWiseStatsTableTable,
          ProjectWiseStatsTableData>
    ),
    ProjectWiseStatsTableData,
    PrefetchHooks Function()> {
  $$ProjectWiseStatsTableTableTableManager(
      _$AppDatabase db, $ProjectWiseStatsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectWiseStatsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectWiseStatsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectWiseStatsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> projectId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> totalFocusedSessionsOnDateInSeconds =
                const Value.absent(),
          }) =>
              ProjectWiseStatsTableCompanion(
            id: id,
            projectId: projectId,
            date: date,
            totalFocusedSessionsOnDateInSeconds:
                totalFocusedSessionsOnDateInSeconds,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String projectId,
            required DateTime date,
            Value<int> totalFocusedSessionsOnDateInSeconds =
                const Value.absent(),
          }) =>
              ProjectWiseStatsTableCompanion.insert(
            id: id,
            projectId: projectId,
            date: date,
            totalFocusedSessionsOnDateInSeconds:
                totalFocusedSessionsOnDateInSeconds,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProjectWiseStatsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ProjectWiseStatsTableTable,
        ProjectWiseStatsTableData,
        $$ProjectWiseStatsTableTableFilterComposer,
        $$ProjectWiseStatsTableTableOrderingComposer,
        $$ProjectWiseStatsTableTableAnnotationComposer,
        $$ProjectWiseStatsTableTableCreateCompanionBuilder,
        $$ProjectWiseStatsTableTableUpdateCompanionBuilder,
        (
          ProjectWiseStatsTableData,
          BaseReferences<_$AppDatabase, $ProjectWiseStatsTableTable,
              ProjectWiseStatsTableData>
        ),
        ProjectWiseStatsTableData,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProjectDatabaseTableTableTableManager get projectDatabaseTable =>
      $$ProjectDatabaseTableTableTableManager(_db, _db.projectDatabaseTable);
  $$TaskDatabaseTableTableTableManager get taskDatabaseTable =>
      $$TaskDatabaseTableTableTableManager(_db, _db.taskDatabaseTable);
  $$ProjectWiseStatsTableTableTableManager get projectWiseStatsTable =>
      $$ProjectWiseStatsTableTableTableManager(_db, _db.projectWiseStatsTable);
}
