import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Validation extends StatefulWidget {
  @override
  _ValidationState createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation',),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height:100,
                ),
                CustomTextField(
                    hintText: 'Enter Email ID',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    icon: Icon(Icons.email),
                    validator:
                    /*(email){
                    if (value.length == 0) {
                      return 'Enter email!';
                    } else if ( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },*/
                        (email)  => email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid Email':null
                ),
                SizedBox(
                  height:20,
                ),
                CustomTextField(
                    hintText: 'Enter Password',
                    keyboardType: TextInputType.emailAddress,
                    controller: passController,
                    icon: Icon(Icons.lock),
                    validator:
                        (password){
                      if (password.length == 0) {
                        return 'Enter password';
                      } else if (password.length < 6) {
                        return 'Enter password 6-digits';
                      }
                      return null;
                    },
                ),
                SizedBox(
                  height:20,
                ),
                CustomTextField(
                  hintText: 'Enter Password',
                  keyboardType: TextInputType.emailAddress,
                  controller: confirmPassController,
                  icon: Icon(Icons.lock),
                  validator:
                      (password){
                    if (password.length == 0) {
                      return 'Enter Confirm password';
                    } else if (password!=passController.text) {
                      return 'Enter Correct Password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height:20,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text('Login'),
                    onPressed: (){
                      if (_formKey.currentState!.validate()){
                        print('validation successful');
                        print("Email = ${emailController.text}");
                        print('Password = ${passController.text}');
                      }
                    }),
                SizedBox(
                  height:20,
                ),
                 Text("Email = ${emailController.text}"),
                 Text('Password = ${passController.text}'),

             /*SizedBox(
                  height:20,
                ),
                Text('Email = ${emailController.text}'),
                Text('Password = ${passController.text}'),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {

  var hintText;
  var keyboardType;
  var validator;
  var controller;
  var icon;
  bool ?obscureText;

  CustomTextField({this.obscureText,this.icon,this.controller,this.hintText,this.validator,this.keyboardType});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText==null ? false : true,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        labelText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
    );
  }
}

