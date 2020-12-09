import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  TextEditingController phoneController;

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 10.0),
              ],
            ),
            child: Column(
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 60.0,
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                _form(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: nameController,
            decoration:
                InputDecoration(labelText: 'Your Name', hintText: 'Your Name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter your Name!';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'Your Email', hintText: 'Your Email'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter your Email!';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: passwordController,
            decoration:
                InputDecoration(labelText: 'Password', hintText: 'Password'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter password!';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: confirmPasswordController,
            decoration: InputDecoration(
                labelText: 'Confirm Password', hintText: 'Confirm Password'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter confirm password!';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Phone', hintText: 'Phone'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter Your Phone Number!';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text(
                'UPDATE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                } else {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
