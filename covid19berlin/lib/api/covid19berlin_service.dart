import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class TimeoutException implements Exception{
  final String message = 'Server Timeout';
  TimeoutException();
  String toString() => message;
}

class ServerException implements Exception{
  final String message = 'Server is busy';
  ServerException();
  String toString() => message;
}