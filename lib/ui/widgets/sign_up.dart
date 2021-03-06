import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:inunpad/core/result.dart';
import 'package:inunpad/core/viewmodels/all_viewmodel.dart';
import 'package:inunpad/ui/shared/global_button.dart';
import 'package:inunpad/ui/shared/global_textfield.dart';
import 'package:inunpad/ui/ui_helper.dart';
import 'package:inunpad/ui/views/base_view.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> birthDate = ['Tanggal Lahir'];
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => SimpleDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        contentPadding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Create New Account',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                UIHelper.vSpaceXSmall(),
                GlobalTextField(
                  label: 'Name',
                  onChanged: (value) => model.name = value,
                ),
                UIHelper.vSpaceXSmall(),
                GlobalTextField(
                  label: 'Faculty',
                ),
                UIHelper.vSpaceXSmall(),
                GlobalTextField(
                  label: 'Department',
                ),
                UIHelper.vSpaceXSmall(),
                GlobalTextField(
                  label: 'Student ID',
                ),
                UIHelper.vSpaceXSmall(),
                GlobalTextField(
                  label: 'Phone Number',
                  keyboardType: TextInputType.number,
                ),
                UIHelper.vSpaceXSmall(),
                GlobalTextField(
                  label: 'Email',
                  onChanged: (value) => model.email = value,
                ),
                GlobalTextField(
                  label: 'Password',
                  obscureText: true,
                  onChanged: (value) {
                    model.password = value;
                    model.confirmPassword = value;
                  } 
                ),
                UIHelper.vSpaceXSmall(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      DatePicker.showDatePicker(
                        context,
                        onChange: (dateTime, List<int> index) {
                          setState(() {
                            birthDate = dateTime.toString().split(" ");
                            print(birthDate);
                            print(birthDate[0]);
                          });
                        },
                      );
                    });
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Center(
                      child: Text(
                        birthDate[0],
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ),
                UIHelper.vSpaceXSmall(),
                UIHelper.vSpaceXSmall(),
                GlobalButton(
                  label: 'Sign Up',
                  heightSize: 47.0,
                  widthSize: 200.0,
                  color: Color(0xFF16415A),
                  onPressed: () async {
                    Result result = await model.register();
                    model.flush(result).show(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
