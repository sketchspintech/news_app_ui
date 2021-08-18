import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class UploadPostScreen extends StatefulWidget {
  @override
  _UploadPostScreenState createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController messageController;

  final _formKey = GlobalKey<FormState>();
  String result = '';

  bool isLoading = false;
  String _category;
  String _postType;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload News'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: (isLoading) ? _loading() : _contactForm(),
        ),
      ),
    );
  }

  Widget _contactForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DropDownFormField(
            titleText: '',
            hintText: 'Select Category',
            value: _category,
            onChanged: (value) {
              setState(() {
                _category = value;
              });
            },
            dataSource: [
              {'a': 'A', 'b': 'A'},
              {'a': 'B', 'b': 'B'},
              {'a': 'C', 'b': 'C'},
              {'a': 'D', 'b': 'D'}
            ],
            textField: 'a',
            valueField: 'b',
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'News Title'),
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
          DateTimePicker(
            type: DateTimePickerType.date,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            decoration: InputDecoration(hintText: 'Date'),
          ),
          SizedBox(
            height: 24,
          ),
          DropDownFormField(
            titleText: '',
            hintText: 'Select Category',
            value: _postType,
            onChanged: (value) {
              setState(() {
                _postType = value;
              });
            },
            dataSource: [
              {'a': 'A', 'b': 'A'},
              {'a': 'B', 'b': 'B'},
              {'a': 'C', 'b': 'C'},
              {'a': 'D', 'b': 'D'}
            ],
            textField: 'a',
            valueField: 'b',
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            height: 300,
            child: TextFormField(
              // controller: nameController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: null,
              minLines: null,
              expands: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter your Name!';
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(8)),
            child: GestureDetector(
                onTap: () {
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
                child: Text(
                  'UPLOAD NEWS',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                )),
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
