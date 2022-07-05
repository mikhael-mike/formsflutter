import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({Key? key}) : super(key: key);

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {


  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _listStoryController = TextEditingController();
  final _passController = TextEditingController();
  final _congPassController = TextEditingController();

  

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _congPassController.dispose();

    _listStoryController.dispose();
    super.dispose();
  }

  var detailsInfo = Icon(
    Icons.delete,
    color: Colors.red,
  );
  var _hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register form Demo'),
        ),
        body: Form(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  label: Text('Full Name *'),
                  hintText: 'What do people call you?',
                  prefixIcon: Icon(Icons.person),
                  // suffixIcon: Icon(Icons.delete, color: Colors.red),
                  suffixIcon: detailsInfo,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 3.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: 'Were we can reach you?',
                    helperText: 'Phone format: (xxx)xxxx xxx',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 3.0),
                    ),
                    prefixIcon: Icon(Icons.phone),
                    // suffixIcon: Icon(Icons.delete, color: Colors.red),
                    suffixIcon: detailsInfo,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 3.0),
                    ),
                    label: Text('Phone number')),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: detailsInfo,
                  prefix: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  label: Text('Email adress *'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _listStoryController,
                decoration: InputDecoration(
                    label: Text('List story *'),
                    helperText: 'Keep it short is just a demo'),
                maxLines: 3,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passController,
                obscureText: _hidePass,
                maxLength: 8,
                decoration: InputDecoration(
                  label: Text('Password *'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        style: BorderStyle.solid, width: 3, color: Colors.grey),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                      icon: _hidePass
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                  prefixIcon: Icon(Icons.security),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _congPassController,
                obscureText: _hidePass,
                maxLength: 8,
                decoration: InputDecoration(
                  // suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
                  label: Text('Confirm password *'),
                  icon: Icon(Icons.border_color),
                  helperText: 'Please confirm your password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        style: BorderStyle.solid, width: 3, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                // textColor: Colors.white,
               style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shadowColor: Colors.black,
                
               ),
                onPressed: _submitForm,
              ),
            ],
          ),
        ));
  }

  void _submitForm() {
    print('name: ${_nameController.text}');
    print('Phone: ${_phoneController.text}');
    print('email: ${_emailController.text}');
    print('story: ${_listStoryController.text}');

  }
}
