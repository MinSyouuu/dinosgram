import 'package:dinosgram/constants/common_size.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              decoration: _textInputDecor('Email'),
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
              decoration: _textInputDecor('Password'),
              validator: (text) {
                if (text != null && text.isNotEmpty && text.length > 5) {
                  return null;
                } else {
                  return '정확한 비밀번호를 입력해주세요.';
                }
              },
            ),
            SizedBox(
              height: common_xs_gap,
            ),
            TextFormField(
              controller: _cpwController,
              cursorColor: Colors.black54,
              obscureText: true,
              decoration: _textInputDecor('Confirm Password'),
              validator: (text) {
                if (text != null &&
                    text.isNotEmpty &&
                    _pwController.text == text) {
                  return null;
                } else {
                  return '비밀번호가 일치하지 않습니다.';
                }
              },
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Validation success!!');
                  }
                },
                child: Text(
                  'Join',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  InputDecoration _textInputDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: (Colors.grey[300])!,
        ),
        borderRadius: BorderRadius.circular(common_s_gap),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: (Colors.redAccent)!,
        ),
        borderRadius: BorderRadius.circular(common_s_gap),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: (Colors.grey[300])!,
        ),
        borderRadius: BorderRadius.circular(common_s_gap),
      ),
      filled: true,
      fillColor: (Colors.grey[100])!,
    );
  }
}
