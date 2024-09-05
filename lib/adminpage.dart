import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;

  void _toggleLogin() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _login() {
    // Add admin login logic here
    if (kDebugMode) {
      print(
          'Admin login with username: ${_usernameController.text} and password: ${_passwordController.text}');
    }
  }

  void _signup() {
    // Add admin signup logic here
    if (kDebugMode) {
      print(
          'Admin signup with username: ${_usernameController.text} and password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Admin Login' : 'Admin Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Admin Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your admin username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Admin Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your admin password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_isLogin) {
                      _login();
                    } else {
                      _signup();
                    }
                  }
                },
                child: Text(_isLogin ? 'Admin Login' : 'Admin Signup'),
              ),
              TextButton(
                onPressed: _toggleLogin,
                child: Text(_isLogin
                    ? 'Don\'t have an admin account? Signup'
                    : 'Already have an admin account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
