// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class ErorrMessegeModel extends Equatable {

  final int statusCode;
  final String statusMessege;
  final bool success;




  const ErorrMessegeModel(this.statusCode, this.statusMessege, this.success);
  
  @override
  
  List<Object?> get props => [statusCode,statusMessege,success];

  
  factory ErorrMessegeModel.fromMap(Map<String, dynamic> map) {
    return ErorrMessegeModel(
      map['status_code'] as int,
      map['status_message'] as String,
      map['success'] as bool,
    );
  }

  

  factory ErorrMessegeModel.fromJson(String source) => ErorrMessegeModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
