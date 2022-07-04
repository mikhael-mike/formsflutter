import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({Key? key}) : super(key: key);

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
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
                decoration: InputDecoration(
                    label: Text('List story *'),
                    helperText: 'Keep it short is just a demo'),
                maxLines: 3,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
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
                onPressed: () {
                  print('clicked');
                },
              ),
            ],
          ),
        ));
  }
}
