import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formsflutter/model/user.dart';
import 'package:formsflutter/screens/user_info_page.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({Key? key}) : super(key: key);

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {

  final _formKey = GlobalKey<FormState>();
  final _scaaflodKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _listStoryController = TextEditingController();
  final _passController = TextEditingController();
  final _congPassController = TextEditingController();

  List<String> _countries = ['Israel', 'France', 'Germany', 'Britany'];
    String? _selectedCountry;

    final _nameFocus = FocusNode();
    final _phoneFocus = FocusNode();
    final _passFocus = FocusNode();

  User newUser = User();
  

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _congPassController.dispose();
    _listStoryController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  var detailsInfo = Icon(
    Icons.delete,
    color: Colors.red,
  );
  var _hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaaflodKey,
        appBar: AppBar(
          title: Text('Register form Demo'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              TextFormField(
                focusNode: _nameFocus,
                autofocus: true,
                onFieldSubmitted: (_) {
                  fieldFocusChange(context, _nameFocus, _phoneFocus);
                },
                controller: _nameController,
                decoration: InputDecoration(
                  label: Text('Full Name *'),
                  hintText: 'What do people call you?',
                  prefixIcon: Icon(Icons.person),
                  // suffixIcon: Icon(Icons.delete, color: Colors.red),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _nameController.clear();
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 3.0),
                  ),
                ),
                validator: _validateName,
                onSaved: (value) => newUser.name = value as String,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: _phoneFocus,
                onFieldSubmitted: (_) {
                  fieldFocusChange(context, _phoneFocus, _passFocus);
                },
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
                    suffixIcon: GestureDetector(
                      onLongPress: () {
                        _phoneController.clear();
                      },
                      child: Icon(
                        Icons.delete,
                         color: Colors.red
                         ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 3.0),
                    ),
                    label: Text('Phone number')),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  // FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'), allow: true),
                ],
                validator: (value) => _validPhoneNumber(value as String) ? null : 'Phone number must be entered as (###)###-####',
                onSaved: (value) => newUser.phone = value as String,
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
                validator: _validateEmail,
                onSaved: (value) => newUser.email = value as String,
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Colors.grey, width: 3.0)),
                  icon: Icon(Icons.map),
                  labelText: 'Country *',
                ),
                items: _countries.map((country) {
                  return DropdownMenuItem(
                    child: Text(country),
                    value: country,
                  );
                }).toList(), 
                onChanged: (country) {
                  print(country);
                  setState(() {
                    _selectedCountry = country as String;
                    newUser.country = country;
                  });
                },
                value: _selectedCountry,
                // validator: (value) {
                //   return value == null ? 'Country must be selected' : null;
                // },
                onSaved: (value) => newUser.country = value as String,
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
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                  
                ],
                onSaved: (value) => newUser.story = value as String,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: _passFocus,
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
                validator: _validatePassword,
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
                validator: _validatePassword,
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
    // 
    // if checing
    // _formKey.currentState.validate() is checking for state of _formKey*
    //
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print('form is valid');
      _showAlertmessage(name: _nameController.text);
      print('name: ${_nameController.text}');
    print('Phone: ${_phoneController.text}');
    print('email: ${_emailController.text}');
    print('country: ${_selectedCountry}');
    print('story: ${_listStoryController.text}');
    } else {
      _showMessage(message: 'Form is not saved becouse in app have wrong');
    }
  }

    String? _validateName(String? value) {
      final _nameExp = RegExp(r'^[a-zA-Z ]+$');
      if(value!.isEmpty) {
        return 'Please enter your name';
      } else if(!_nameExp.hasMatch(value)) {
        return 'Please enter aplphavite characters';
      } else {
        return null;
      }
    }

    bool _validPhoneNumber(String value) {
      final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
      return _phoneExp.hasMatch(value);
    }

    String? _validateEmail(String? email) {
      if(email!.isEmpty) {
        return 'Please set your email adress';
      } else if(!_emailController.text.contains('@')) {
        return 'Please set correct email adress';
      } else {
        return null;
      }
    }

    String? _validatePassword(String? password) {
      if(_passController.text.length != 8) {
        return 'Please set your password';
      } else if(_passController.text != _congPassController.text) {
        return 'Please set your confirm pass correct';
      } else {
        return null;
      }
    }

    void _showMessage({String? message}) {
      // new method
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message as String, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          ),
          duration: Duration(seconds: 3),
        ),
      );
      // _scaaflodKey.currentState!.showSnackBar(
      //   SnackBar(
      //     content: Text(message as String, style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 18,
      //     ),),
      //     backgroundColor: Colors.red,
      //     duration: Duration(seconds: 2),
      //   ),
      // );
     
    }

    void _showAlertmessage({String? name}) {
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text('Registration Successefull'),
            content: Text('$name is now registered verify form', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
            actions: [
              FlatButton(
                child: Text('Verifed!', style: TextStyle(fontSize: 18, color: Colors.green)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoPage(userInfo: newUser,)));
                },
              )
            ],
          );
        }
        );
    }
}
