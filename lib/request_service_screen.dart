import 'package:c_h_service_center/Service_Request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RequestServiceScreenState createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  final _serviceNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _serviceNameController,
              decoration: const InputDecoration(labelText: 'Model'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Complaints'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final ServiceRequest serviceRequest = ServiceRequest(
                  id: DateTime.now().toString(),
                  serviceName: _serviceNameController.text,
                  description: _descriptionController.text,
                  date: DateTime.now(),
                );

                Provider.of<ServiceRequestProvider>(context, listen: false)
                    .addRequest(serviceRequest);
                pushData();
                Navigator.pop(context);
              },
              child: const Text('Submit Request'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _serviceNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> pushData() async {
    try {
      await FirebaseFirestore.instance
          .collection("data")
          .add({"model": "complaint"});
    } catch (e) {
      print("the error$e");
    }
  }
}
