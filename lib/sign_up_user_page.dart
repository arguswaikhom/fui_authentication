import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';

class SignUpUserPage extends StatefulWidget {
  const SignUpUserPage({Key? key}) : super(key: key);

  @override
  _SignUpUserPageState createState() => _SignUpUserPageState();
}

class _SignUpUserPageState extends State<SignUpUserPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _getAvatarWidget() {
    return FSCircleAvatar(
      avatar: FSCircleAvatarData(
        radius: 72.0,
        backgroundImage: const NetworkImage(
          'https://github.com/arguswaikhom/ResourceBank/blob/master/arguswaikhom/fui_authentication/profile.jpg?raw=true',
        ),
      ),
      miniStatus: FSCircleAvatarMiniStatusData(
        radius: 18.0,
        foregroundColor: Colors.red,
        backgroundColor: Colors.white,
        child: const Icon(Icons.file_upload),
        hasBorder: true,
        borderColor: Colors.green,
      ),
    );
  }

  Widget _getSignUpForm({
    required String hint,
    required IconData prefixIcon,
    IconData? suffixIcon,
  }) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 3.0,
        color: Colors.black12,
      ),
      borderRadius: BorderRadius.circular(32.0),
    );
    final OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 3.0,
        color: Colors.red[300]!,
      ),
      borderRadius: BorderRadius.circular(32.0),
    );
    return TextFormField(
      // controller: _controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 18.0,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Icon(
            prefixIcon,
            color: Colors.black45,
            size: 26.0,
          ),
        ),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Icon(
                  suffixIcon,
                  color: Colors.black45,
                  size: 26.0,
                ),
              )
            : null,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
      ),
    );
  }

  List<Widget> _getForms() {
    return [
      _getSignUpForm(
        hint: 'Name',
        prefixIcon: Icons.subject,
      ),
      kFSSpaceHStandard,
      _getSignUpForm(
        hint: 'Email',
        prefixIcon: Icons.mail_outline,
      ),
      kFSSpaceHStandard,
      _getSignUpForm(
          hint: 'Password',
          prefixIcon: Icons.lock_outlined,
          suffixIcon: Icons.remove_red_eye),
      kFSSpaceHStandard,
      _getSignUpForm(
        hint: 'Phone No.',
        prefixIcon: Icons.local_phone_outlined,
      )
    ];
  }

  Widget _getSignUpButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('SIGN UP', style: TextStyle(fontSize: 18.0)),
      style: ButtonStyle(
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(double.infinity, 54.0),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        elevation: MaterialStateProperty.all<double>(0.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Widget _getSignInWidget() {
    return const Text.rich(
      TextSpan(
        style: TextStyle(fontSize: 16.0),
        children: [
          TextSpan(text: 'Already have an account?'),
          TextSpan(text: ' '),
          TextSpan(
            text: 'SIGN IN',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FSColoredSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 0.0),
            child: Column(
              children: [
                _getAvatarWidget(),
                const SizedBox(height: 64.0),
                ..._getForms(),
                const SizedBox(height: 64.0),
                _getSignUpButton(),
                kFSSpaceHStandard,
                _getSignInWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
