import 'package:dinosgram/constants/auth_input_decor.dart';
import 'package:dinosgram/constants/common_size.dart';
import 'package:dinosgram/home_page.dart';
import 'package:dinosgram/widgets/or_divider.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: common_l_gap,
              ),
              Image.asset('assets/images/insta_text_logo.png'),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black54,
                decoration: textInputDecor('Email'),
                validator: (text) {
                  if (text != null && text.isNotEmpty && text.contains('@')) {
                    return null;
                  } else {
                    return '정확한 이메일 주소를 입력해주세요.';
                  }
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                controller: _pwController,
                cursorColor: Colors.black54,
                obscureText: true,
                decoration: textInputDecor('Password'),
                validator: (text) {
                  if (text != null && text.isNotEmpty && text.length > 5) {
                    return null;
                  } else {
                    return '정확한 비밀번호를 입력해주세요.';
                  }
                },
              ),
              SizedBox(
                height: common_s_gap,
              ),
              _submitButton(context),
              SizedBox(
                height: common_s_gap,
              ),
              OrDivider(),
              TextButton.icon(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage('assets/images/facebook.png'),
                  color: Colors.blue,
                ),
                label: Text(
                  'Login with Facebook',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _submitButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          )),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      },
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
