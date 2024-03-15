import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/secound_screen.dart';

import 'cubit/user_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    //return  BlocProvider(
      // create: (context) => AuthCubit(),
      // child: BlocConsumer<AuthCubit,AuthState>(
      //     listener: (context,state){
      //       if(state is RegisterSuccessState)
      //       {
      //         Navigator.push(context, MaterialPageRoute(builder: (context)=> SecoundScreen()));
      //       }
      //       else if(state is FailedRegisterState)
      //       {
      //         showDialog(context: context, builder: (context)=>
      //             AlertDialog(
      //               content: Text(state.message,
      //               style: TextStyle(color: Colors.white),
      //               ),
      //               backgroundColor: Colors.red,
      //             ));
      //       }
      //     },
      //     builder: (context,state){
            return Scaffold(
                body: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
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

                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: TextFormField(
                        //     controller: phoneController,
                        //     decoration: InputDecoration(
                        //       border : OutlineInputBorder(),
                        //       hintText:"phone",
                        //     ),
                        //     validator: (value){
                        //       if(value!.isEmpty){
                        //         return ' Please Enter Your phone';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
                        // SizedBox(height: 10,),

                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: TextFormField(
                        //     controller: nameController,
                        //     decoration: InputDecoration(
                        //       border : OutlineInputBorder(),
                        //       hintText:"name",
                        //     ),
                        //     validator: (value){
                        //       if(value!.isEmpty){
                        //         return ' Please Enter Your name';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
                        // SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: context.read<UserCubit>().signInEmail,
                            decoration: InputDecoration(
                              border : OutlineInputBorder(),
                              hintText:"email",
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
                          child: TextFormField(
                            controller: countryController,
                            decoration: InputDecoration(
                              border : OutlineInputBorder(),
                              hintText:"country",
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return ' Please Enter Your country';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: cityController,
                            decoration: InputDecoration(
                              border : OutlineInputBorder(),
                              hintText:"city",
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return ' Please Enter Your city';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          ElevatedButton(
                            onPressed: () {
                             //Todo
                              //check with api
                              if(formKey.currentState!.validate())
                              {
                                // BlocProvider.of<AuthCubit>(context).signUp(
                                //     name: nameController.text,
                                //     email: emailController.text,
                                //     password: passwordController.text,
                                //     //phone: phoneController.text
                                //      country: countryController.text,
                                //      city: cityController.text
                                //);
                              }
                            },
                            child: Text(
                              //state is RegisterLoadingState
                               // ? "loading..."
                              //  :
                            'Log In',
                              style: TextStyle(color: Colors.white),),
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
                  ),
                )
            );
    //       },
    //      ),
    // );
  }
}
