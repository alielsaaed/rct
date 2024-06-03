import 'dart:io';

import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  String email = "";
  String password = "";
  String name = "";
  File? image;
}
