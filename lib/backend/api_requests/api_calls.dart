import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class InvitationSendGridCall {
  static Future<ApiCallResponse> call({
    String? invitationId = '',
    String? invitedEmail = '',
    String? restaurantName = '',
    String? restaurantEmail = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'InvitationSendGridCall',
        'variables': {
          'invitationId': invitationId,
          'invitedEmail': invitedEmail,
          'restaurantName': restaurantName,
          'restaurantEmail': restaurantEmail,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic? error(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class PrintTablesEmailCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? name = '',
    String? adress = '',
    String? locality = '',
    String? from = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PrintTablesEmailCall',
        'variables': {
          'userId': userId,
          'name': name,
          'adress': adress,
          'locality': locality,
          'from': from,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FactureRestaurantCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    String? date = '',
    double? total,
    double? netTotal,
    String? emailTo = '',
    String? iban = '',
    String? beneficiaryName = '',
    String? beneficiaryAdress = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FactureRestaurantCall',
        'variables': {
          'orderId': orderId,
          'date': date,
          'total': total,
          'netTotal': netTotal,
          'emailTo': emailTo,
          'iban': iban,
          'beneficiaryName': beneficiaryName,
          'beneficiaryAdress': beneficiaryAdress,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class WelcomeEmailFRACall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? restaurantName = '',
    String? adresse = '',
    String? codePostal = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'WelcomeEmailFRACall',
        'variables': {
          'name': name,
          'restaurantName': restaurantName,
          'adresse': adresse,
          'codePostal': codePostal,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class WelcomeEmailDEUCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? restaurantName = '',
    String? adresse = '',
    String? codePostal = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'WelcomeEmailDEUCall',
        'variables': {
          'name': name,
          'restaurantName': restaurantName,
          'adresse': adresse,
          'codePostal': codePostal,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class WelcomeEmailENGCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? restaurantName = '',
    String? adresse = '',
    String? codePostal = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'WelcomeEmailENGCall',
        'variables': {
          'name': name,
          'restaurantName': restaurantName,
          'adresse': adresse,
          'codePostal': codePostal,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class WelcomeEmailENGFreeUsersCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'WelcomeEmailENGFreeUsersCall',
        'variables': {
          'name': name,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class WelcomeEmailFRAFreeUsersCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'WelcomeEmailFRAFreeUsersCall',
        'variables': {
          'name': name,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class WelcomeEmailDEUFreeUsersCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'WelcomeEmailDEUFreeUsersCall',
        'variables': {
          'name': name,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FactureStaffTipsCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    String? date = '',
    String? storeName = '',
    double? tips,
    double? netTotal,
    String? beneficiaryName = '',
    String? beneficiaryAdress = '',
    String? beneficiaryIBAN = '',
    String? emailTo = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FactureStaffTipsCall',
        'variables': {
          'orderId': orderId,
          'date': date,
          'storeName': storeName,
          'tips': tips,
          'netTotal': netTotal,
          'beneficiaryName': beneficiaryName,
          'beneficiaryAdress': beneficiaryAdress,
          'beneficiaryIBAN': beneficiaryIBAN,
          'emailTo': emailTo,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetContactSendgridFreeUserCall {
  static Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetContactSendgridFreeUserCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
