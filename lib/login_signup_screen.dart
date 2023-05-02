import 'package:flutter/material.dart';
import 'package:pet_sense/home_page.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  LoginSignupScreenState createState() => LoginSignupScreenState();
}

class LoginSignupScreenState extends State<LoginSignupScreen> {
  bool _isLoginForm = true;

  void _toggleFormMode() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoginForm ? 'Login' : 'Sign up'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              if (!_isLoginForm)
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) => value!.isEmpty ? 'Name can\'t be empty' : null,
                ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Email can\'t be empty' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Password can\'t be empty' : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
              TextButton(
                onPressed: _toggleFormMode,
                child: Text(_isLoginForm
                    ? 'Need an account? Sign up'
                    : 'Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
