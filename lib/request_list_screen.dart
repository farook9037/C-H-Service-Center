import 'package:c_h_service_center/editrequestscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Service_Request.dart';

class RequestListScreen extends StatelessWidget {
  const RequestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requests = Provider.of<ServiceRequestProvider>(context).request;

    return requests.isEmpty
        ? const Center(
            child: Text("No data"),
          )
        : ListView.builder(
            itemCount: requests.length,
            itemBuilder: (ctx, index) {
              final request = requests[index];
              return ListTile(
                title: Text(request.serviceName),
                subtitle: Text(request.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${request.date.day}/${request.date.month}/${request.date.year}',
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Navigate to edit screen or show edit dialog
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) =>
                                EditRequestScreen(request: request),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
  }
}
