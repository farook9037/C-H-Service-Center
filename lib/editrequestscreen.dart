import 'package:c_h_service_center/Service_Request.dart';
import 'package:flutter/material.dart';

class EditRequestScreen extends StatelessWidget {
  final ServiceRequest request;

  const EditRequestScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final TextEditingController serviceNameController =
        TextEditingController(text: request.serviceName);
    final TextEditingController descriptionController =
        TextEditingController(text: request.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Request"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: serviceNameController,
              decoration: const InputDecoration(labelText: "Service Name"),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the request data with the new values
                // and save the changes through the provider.
                // You will need to implement the logic for saving.

                // After saving, pop the screen to return to the request list
                Navigator.of(context).pop();
              },
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
