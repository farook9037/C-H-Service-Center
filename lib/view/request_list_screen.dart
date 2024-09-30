// import 'package:c_h_service_center/view/editrequestscreen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'Service_Request.dart';

// class RequestListScreen extends StatelessWidget {
//   const RequestListScreen({
//     super.key,
//     required bool filterByUser,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final requests = Provider.of<ServiceRequestProvider>(context).request;

//     return requests.isEmpty
//         ? const Center(
//             child: Text("No data"),
//           )

//         : ListView.builder(
//             itemCount: requests.length,
//             itemBuilder: (ctx, index) {
//               final request = requests[index];
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             EditRequestScreen(request: request),
//                       ));
//                 },
//                 child: ListTile(
//                   title: Text(request.serviceName),
//                   subtitle: Text(request.description),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         '${request.date.day}/${request.date.month}/${request.date.year}',
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.edit),
//                         onPressed: () {
//                           // Navigate to edit screen or show edit dialog
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (ctx) =>
//                                   EditRequestScreen(request: request),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty('Firebase', Firebase));
//   }
// }
import 'package:c_h_service_center/view/editrequestscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Service_Request.dart';

class RequestListScreen extends StatelessWidget {
  const RequestListScreen({
    super.key,
    required this.filterByUser,
  });

  final bool filterByUser;

  @override
  Widget build(BuildContext context) {
    // Fetch the list of service requests from the provider
    final requests = Provider.of<ServiceRequestProvider>(context).request;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Requests'),
      ),
      body: requests.isEmpty
          ? const Center(
              child: Text("No data available"),
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
                      // Displaying the date in dd/mm/yyyy format
                      Text(
                        '${request.date.day}/${request.date.month}/${request.date.year}',
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Navigate to edit request screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => EditRequestScreen(
                                request: request,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to edit request screen when tapping the tile
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditRequestScreen(
                          request: request,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('Firebase', Firebase));
  }
}
