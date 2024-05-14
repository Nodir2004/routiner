import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routiner/src/presentation/email/account.dart';
import 'package:routiner/src/presentation/widget/navigatorbutton_widget.dart';
import 'package:routiner/src/presentation/widget/textfield_widget.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

final _formkey = GlobalKey<FormState>();
bool visibil = true;

class _EmailPageState extends State<EmailPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Icon(Icons.chevron_left),
          ),
        ),
        title: const Text(
          "Continue with E-mail",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 20.r).r,
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("E-MAIL"),
                      TextFieldWidget(
                        validator: (email) => validateEmail(email),
                        controller: _emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "E-mail",
                        icon: Icon(Icons.abc),
                        onTap: () => _emailcontroller.clear(),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const Text("PASSWORD"),
                      TextFieldWidget(
                        validator: (password) => password!.length < 4
                            ? 'Password should be at least 4 digits long'
                            : null,
                        controller: _passwordcontroller,
                        keyboardType: TextInputType.text,
                        hintText: "Enter you password",
                        onTap: () => visibil = !visibil,
                        icon: visibil
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "I forgot my password",
                            style: TextStyle(color: Color(0xff686873)),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              TextButton(
                onPressed: () {},
                child:  const Text(
                  "Don’t have account? Let’s create!",
                  style: TextStyle(color: Color(0xff553B59)),
                ),
                style: const ButtonStyle(
                    surfaceTintColor: MaterialStatePropertyAll(Colors.white)),
              ),
              SizedBox(
                height: 10.h,
              ),
              NavigatorButtonWidget(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountPage(),
                      )),
                  text: "Next")
            ],
          ),
        ),
      ),
    );
  }
}
