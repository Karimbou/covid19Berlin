import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class TimeoutExceptions implements Exception{
  final String message = 'Server timeout';
  TimeoutException();
  String toString() => message;
}
