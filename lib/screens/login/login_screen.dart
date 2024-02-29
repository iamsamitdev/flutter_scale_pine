import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // สร้างตัวแปร formKey เพื่อใช้ในการ validate form
  final GlobalKey<FormState> _formKeyLogin = GlobalKey();

  // สร้างตัวแปรเพื่อเก็บค่า email และ password
  String? _email, _password;

  @override
  Widget build(BuildContext context) {

    // อนุญาติว่าให้หมุนทิศทางใดได้บ้าง
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ]
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/pinelogo.gif', width: 200,),
            Form(
              key: _formKeyLogin,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'กรุณากรอก Email';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _email = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'กรุณากรอก Password';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _password = value;
                      }
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        // ถ้า form ผ่าน validate ให้ทำการบันทึกค่า
                        if(_formKeyLogin.currentState!.validate()){
                          // บันทึกค่า
                          _formKeyLogin.currentState!.save();
                          // ลองแสดงค่าที่บันทึกไว้
                          print(_email);
                          print(_password);
                          if(_email == 'admin@email.com' && _password == '1234'){

                              // สร้าง SharedPreferences และเก็บค่าว่าเป็นการเปิดแอพครั้งแรก
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool('loginStatus', true);

                            // ส่งไปหน้า dashboard
                            Navigator.pushReplacementNamed(context, AppRouter.dashboard);

                          }else{
                            // แจ้งเตือนเมื่อ login ไม่ผ่าน
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text('Email หรือ Password ไม่ถูกต้อง'),
                                backgroundColor: Colors.red,
                              )
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}