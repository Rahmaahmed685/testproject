import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_cubit.dart';
import '../secound_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool obscureText = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //final cubit = LoginCubit();
  late UserCubit userCubit;

  @override
  void initState() {
    super.initState();
    userCubit = BlocProvider.of<UserCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return
          BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
          if(state is SignInSuccessState)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SecoundScreen()));
          }
          else if(state is SignInFailedState)
          {
            showDialog(context: context, builder: (context)=>
                AlertDialog(
                  content: Text(state.errorMessage,
                  style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
          }
  },
  builder: (context, state) {
    return Scaffold(
              appBar:  AppBar(title: Text(""),),
              body: Form(
                key: formKey,
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child:  Text(
                        "Instagram",
                        //style: GoogleFonts.getFont('Lobster Two', fontSize: 50),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller:  context.read<UserCubit>().signInEmail,
                        decoration: InputDecoration(
                          border : OutlineInputBorder(),
                          hintText:"Phone number,Username,or email",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return ' Please Enter Your Email';
                          }if(!value.contains('@') || !value.contains('.')){
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller:  context.read<UserCubit>().signInPassword,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          border : OutlineInputBorder(),
                          label: Text("Password"),
                          suffixIcon: IconButton(
                            onPressed: () {
                              obscureText = !obscureText;
                              setState(() {});
                            },
                            icon: Icon(
                              obscureText ? Icons.visibility_off :
                              Icons.visibility,
                            ),
                          ),
                        ),
                        validator:  (value){
                          if(value!.isEmpty){
                            return 'Enter Your password';
                          }if(value.length < 6){
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      state is SignInLoadingState? CircularProgressIndicator(): ElevatedButton(
                        onPressed: () {
                          context.read<UserCubit>().signIn();
                        //  login();
                        },
                        child: Text('Log In',style: TextStyle(color: Colors.white54),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan[200],
                          onPrimary: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 1.0,
                            width: 130.0,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'OR',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 1.0,
                            width: 130.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            //action coe when button is pressed
                          },
                          icon: Icon(Icons.facebook,color: Colors.blue[900],),
                        ),
                        Text("Log in With Facebook",style: TextStyle(color: Colors.blue[900]),)

                      ],),
                    SizedBox(height: 20,),

                    Center(
                      child: GestureDetector(
                        onTap: (){
                          // Navigator.push(context,
                          //     MaterialPageRoute(
                          //         builder:
                          //             (context) => ForgetScreen()));
                        },
                        child: Text('Forgotten Password?',
                          style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: 13),),),
                    ),
                    SizedBox(height: 150),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                          side:  BorderSide(
                            width: 1.0,
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: (){},
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(fontSize: 15.0,
                                  color: Colors.black87
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(  context,
                                //   MaterialPageRoute(
                                //       builder: (context) => RegisterScreen()), );
                              },
                              child: Text(
                                ' Sign Up',
                                style: TextStyle(fontSize: 15,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),

                  ],),
              )
         // ),
       // ),
      );
  },
);
  }
  // void login() {
  //   if (!formKey.currentState!.validate()) {
  //     return;
  //   }
  //   String email = emailController.text;
  //   String password = passwordController.text;
  //
  //   cubit.login(email: email, password: password);
  // }


 // void login() {}
  void displaySnackBar(String message) {
    var snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
