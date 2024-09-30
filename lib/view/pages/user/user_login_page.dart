import 'package:c_h_service_center/view/pages/user/user_home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<UserLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;

  void _toggleLogin() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _login(dynamic page) {
    // Add your login logic here
    if (kDebugMode) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserHomeScreen(),
          ));
    }
  }

  void _signup(dynamic page) {
    // Add your signup logic here
    if (kDebugMode) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserHomeScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'User Login' : 'User Signup'),
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
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
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
                      _login(const UserHomeScreen());
                    } else {
                      _signup(const UserHomeScreen());
                    }
                  }
                },
                child: Text(_isLogin ? 'Login' : 'Signup'),
              ),
              TextButton(
                onPressed: _toggleLogin,
                child: Text(_isLogin
                    ? 'Don\'t have an account? Signup'
                    : 'Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
