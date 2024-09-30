import 'package:c_h_service_center/view/pages/admin/admin_login_page.dart';
import 'package:c_h_service_center/view/pages/user/user_login_page.dart';
import 'package:flutter/material.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  State<SpashScreen> createState() => _HomePageState();
}

class _HomePageState extends State<SpashScreen> {
  @override
  void initState() {
    super.initState();
    _showUserAdminDialog();
  }

  void _showUserAdminDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select User Type'),
            content: const Text('Are you a User or an Admin?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserLoginPage(),
                    ),
                  );
                },
                child: const Text('User'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminLoginPage(),
                    ),
                  );
                },
                child: const Text('Admin'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome to the App',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
