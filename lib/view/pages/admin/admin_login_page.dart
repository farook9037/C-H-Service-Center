// import 'package:c_h_service_center/view/pages/admin/admin_home_screen';
import 'package:c_h_service_center/view/pages/admin/admin_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool _isLoading = false;

  // Initialize Firebase when the widget is first created
  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  // Toggle between login and signup
  void _toggleLogin() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  // Show error dialogs
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Login with Firebase
  Future<void> _login() async {
    try {
      setState(() => _isLoading = true);
      // await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(
      //       email: _usernameController.text,
      //       password: _passwordController.text,
      //     )
      //     .then(
      //       (value) => Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const AdminHomeScreen(),
      //         ),
      //       ),
      //     );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminHomeScreen(),
        ),
      );

      setState(() => _isLoading = false);
    } on FirebaseAuthException catch (e) {
      setState(() => _isLoading = false);
      _showErrorDialog(e.message ?? 'Login failed');
    }
  }

  // Signup with Firebase
  Future<void> _signup() async {
    try {
      setState(() => _isLoading = true);
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );
      if (kDebugMode) {
        print('Signed up as ${userCredential.user?.email}');
      }
      setState(() => _isLoading = false);
    } on FirebaseAuthException catch (e) {
      setState(() => _isLoading = false);
      _showErrorDialog(e.message ?? 'Signup failed');
    }
  }

  // Validate form and trigger login/signup
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_isLogin) {
        _login();
      } else {
        _signup();
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Admin Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your admin email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
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
              const SizedBox(height: 24.0),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(_isLogin ? 'Login' : 'Signup'),
                    ),
              const SizedBox(height: 12.0),
              TextButton(
                onPressed: _toggleLogin,
                child: Text(
                  _isLogin
                      ? 'Don\'t have an admin account? Signup'
                      : 'Already have an admin account? Login',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
