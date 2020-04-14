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

class ServerErrorException implements Exception{
  String message;
  ServerErrorException(this.message);
  String toString() => message;
}

const kTimeoutDuration = Duration(seconds: 25);

class Covid19Service{

    Covid19Service._privateConstructor();
    static final Covid19Service instance = Covid19Service._privateConstructor();

    static var baseUrl = 
        'https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query';

    static String get caseUrl {
      return '$baseUrl?f=json&where=BL+%3D+%27Berlin%27&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=county%2C+cases%2C+deaths&returnGeometry=false&returnCentroid=false&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=true&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=true&returnDistinctValues=true&cacheHint=false&orderByFields=cases+desc&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=false&quantizationParameters=&sqlFormat=standard&f=html&token=';
    }

    Future<List<Covid19BerlinCount>> fetchAllBerlinCount() async {
      try{
        final url = caseUrl;
        final json = await _fetchJson(url);
        final response = ;
      }
    }
}