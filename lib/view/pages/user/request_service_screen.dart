import 'package:c_h_service_center/view/Service_Request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestServiceScreen extends StatefulWidget {
  final ServiceRequest?
      existingRequest; // Accepting existing request data for editing

  const RequestServiceScreen({super.key, this.existingRequest});

  @override
  _RequestServiceScreenState createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  final _serviceNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingRequest != null) {
      // Populate fields with existing data if editing
      _serviceNameController.text = widget.existingRequest!.serviceName;
      _descriptionController.text = widget.existingRequest!.description;
    }
  }

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
                if (widget.existingRequest == null) {
                  // Add new request
                  final ServiceRequest serviceRequest = ServiceRequest(
                    id: DateTime.now().toString(),
                    serviceName: _serviceNameController.text,
                    description: _descriptionController.text,
                    date: DateTime.now(),
                    filterByUser: true,
                  );

                  Provider.of<ServiceRequestProvider>(context, listen: false)
                      .addRequest(serviceRequest);
                  pushData();
                  Navigator.pop(context);
                } else {
                  // Edit existing request
                  editRequest();
                }
              },
              child: Text(widget.existingRequest == null
                  ? 'Submit Request'
                  : 'Edit Request'), // Change button text based on mode
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pushData() async {
    try {
      await FirebaseFirestore.instance.collection("data").add({
        "model": _serviceNameController.text,
        "complaint": _descriptionController.text,
      });
    } catch (e) {
      if (kDebugMode) {
        print("the error$e");
      }
    }
  }

  Future<void> editRequest() async {
    try {
      // Update the existing request in Firestore (assuming the request ID is used)
      await FirebaseFirestore.instance
          .collection("data")
          .doc(widget.existingRequest!.id)
          .update({
        "model": _serviceNameController.text,
        "complaint": _descriptionController.text,
      });

      Navigator.pop(context);
    } catch (e) {
      print("the error$e");
    }
  }

  @override
  void dispose() {
    _serviceNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
