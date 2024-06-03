// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

class OrderModel extends ChangeNotifier {
  String cost = "";
  String lat = "";
  String long = "";
  String location = "";
  String status = "pending";
  String agreement = "yes";
  late File landCheckImage;
  late File electronicimage;
  late File nationalidimage;
  String number = const Uuid().v8();
  int user_id = 0;
  int areaspace_id = 0;
  double areaspace = 0.0;
  int type_id = 0;
  int design_id = 0;
  int sketch_id = 0;
  int preferable_id = 0;
  int receipt_id = 0;
  int build_types_price = 0;
  int build_price = 0;
  List floorDetails = [];
  List<String> orderNumbers = [];
}
