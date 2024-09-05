import 'package:flutter/material.dart';

class Popupscreen extends StatefulWidget {
  const Popupscreen({Key? key}) : super(key: key);

  @override
  State<Popupscreen> createState() => _HomePageState();
}

class _HomePageState extends State<Popupscreen> {
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

class UserLoginPage extends StatelessWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // User login logic here
          },
          child: const Text('User Login'),
        ),
      ),
    );
  }
}

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Admin login logic here
          },
          child: const Text('Admin Login'),
        ),
      ),
    );
  }
}
