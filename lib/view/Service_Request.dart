import 'package:flutter/material.dart';

class ServiceRequest {
  final String id;
  final String serviceName;
  final String description;
  final DateTime date;

  ServiceRequest({
    required this.id,
    required this.serviceName,
    required this.description,
    required this.date,
    required bool filterByUser,
  });

  copyWith({required String serviceName, required String description}) {}
}

class ServiceRequestProvider with ChangeNotifier {
  final List<ServiceRequest> _request = [];

  List<ServiceRequest> get request => _request;

  void addRequest(ServiceRequest request) async {
    _request.add(request);

    notifyListeners();
  }

  void updateRequest(copyWith) {}
}
