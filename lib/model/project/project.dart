import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:drift/drift.dart' as drift;
part 'project.freezed.dart';
part 'project.g.dart';


@freezed
abstract class Project with _$Project {
   factory Project(
    {
      required String projectId, 
      required String projectTitle,  
    }
   ) = _Project;
   factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}




class ProjectDatabaseTable extends drift.Table{
  drift.IntColumn get id => integer().autoIncrement()(); 
  drift.TextColumn get projectId => text()(); 
  drift.TextColumn get projectTitle => text()(); 
}