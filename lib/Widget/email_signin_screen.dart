import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Store/email_auth_provider.dart';
import 'package:provider/src/provider.dart';

import 'component/cutom_textfield.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({Key? key}) : super(key: key);

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final _formKey = GlobalKey<FormState>();

  final   usernameController= TextEditingController();
  final  passwordController = TextEditingController();
  final  confirmPasswordController = TextEditingController();

  bool signUp = false;
  bool isPasswordNotVisible = true;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(() =>{setState(() {
    })});
  }

  void changeVisibility(){
    setState(() {
      isPasswordNotVisible = !isPasswordNotVisible;
    });
  }

  void Clear(){
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [

          const SizedBox(height: 20),

          customNameTextField(usernameController, context),

          const SizedBox(height: 20),

          customPasswordTextField(passwordController,context,isPasswordNotVisible,changeVisibility),

          const SizedBox(height: 20),

          Visibility(
              visible: signUp,
              child: customConfirmPasswordTextField(passwordController,confirmPasswordController,context,isPasswordNotVisible,changeVisibility)
          ),

          const SizedBox(height: 10),

          Text(context.watch<AuthenticationService>().errorMessage,
            style: const TextStyle(color: Colors.red,fontSize: 17),
          ),

          const SizedBox(height: 10),

          context.watch<AuthenticationService>().isLoading?

          const CircularProgressIndicator(
            valueColor:AlwaysStoppedAnimation<Color>(Colors.blue),
          ):

          MaterialButton(
            onPressed: () {
              context.read<AuthenticationService>().initialValues();
              if (_formKey.currentState!.validate()) {
                if (signUp) {
                  //Provider sign up method
                  context.read<AuthenticationService>().signUp(
                    context: context,
                    usernameController: usernameController.text,
                    passwordController: passwordController.text.trim(),
                  );

                } else {
                  //Provider sign in method
                  context.read<AuthenticationService>().signIn(
                    context: context,
                    usernameController: usernameController.text,
                    passwordController: passwordController.text.trim(),
                  );

                }
              }
            },
            height: 40,
            minWidth: double.infinity,
            color: Theme
                .of(context)
                .primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child:
            signUp ?
            Text(
                "Sign Up",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6
            ) : Text(
                "Sign In",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6
            ),

          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              // set value to default
              Clear();
              context.read<AuthenticationService>().initialValues();
              setState(() {
                signUp = !signUp;
              });
            },
            child: signUp ?
            Text(
              "Have an account? Sign In",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ) : Text(
              "Create an account",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}