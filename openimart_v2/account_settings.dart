import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Form controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  String _selectedGender = 'Male';
  DateTime _selectedDate = DateTime.now();

  void _showEditDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Save changes
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ListTile(
              title: Text('Email'),
              subtitle: Text('user@example.com'),
              trailing: Icon(Icons.edit),
              onTap: () => _showEditDialog(
                'Edit Email',
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ListTile(
              title: Text('Password'),
              subtitle: Text('********'),
              trailing: Icon(Icons.edit),
              onTap: () => _showEditDialog(
                'Edit Password',
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'New Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ListTile(
              title: Text('Name'),
              subtitle: Text('John Doe'),
              trailing: Icon(Icons.edit),
              onTap: () => _showEditDialog(
                'Edit Name',
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ListTile(
              title: Text('Mobile Number'),
              subtitle: Text('+1234567890'),
              trailing: Icon(Icons.edit),
              onTap: () => _showEditDialog(
                'Edit Mobile Number',
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a mobile number';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ListTile(
              title: Text('Gender'),
              subtitle: Text(_selectedGender),
              trailing: Icon(Icons.edit),
              onTap: () => _showEditDialog(
                'Edit Gender',
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text('Birthday'),
              subtitle: Text(_selectedDate.toString().split(' ')[0]),
              trailing: Icon(Icons.edit),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null && picked != _selectedDate) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }
}