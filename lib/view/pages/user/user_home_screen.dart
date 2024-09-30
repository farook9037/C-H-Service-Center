import 'package:c_h_service_center/view/pages/user/request_service_screen.dart';
import 'package:c_h_service_center/view/request_list_screen.dart';
// import 'package:c_h_service_center/view/request_service_screen.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Service Requests'),
      ),
      body: const RequestListScreen(
        filterByUser: true, // Assuming the RequestListScreen has this option
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RequestServiceScreen(),
            ),
          );
        },
      ),
    );
  }
}
