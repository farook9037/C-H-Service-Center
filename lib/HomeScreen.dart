import 'package:c_h_service_center/request_list_screen.dart';
import 'package:c_h_service_center/request_service_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicing App'),
      ),
      body: const RequestListScreen(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RequestServiceScreen()),
          );
        },
      ),
    );
  }
}
