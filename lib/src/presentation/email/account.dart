import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routiner/src/presentation/email/gender.dart';
import 'package:routiner/src/presentation/widget/navigatorbutton_widget.dart';
import 'package:routiner/src/presentation/widget/textfield_widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}
final _formkey = GlobalKey<FormState>();

class _AccountPageState extends State<AccountPage> {
  final _namecontroller = TextEditingController();
  final _surnamecontroller = TextEditingController();
  final _datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(12).r)),
              child: Icon(Icons.chevron_left),
            ),
          ),
        ),
        title: const Text(
          "Create Account",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.r, right: 20.r, top: 30.r).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name"),
                      TextFieldWidget(
                        onTap: () => _namecontroller.clear(),
                        hintText: "Name",
                        icon: Icon(Icons.close),
                        keyboardType: TextInputType.name,
                        controller: _namecontroller,
                        validator: (name) => name!.length < 4
                            ? 'Password should be at least 4 digits long'
                            : null,
                      ),
                      SizedBox(
                        height: 20.r,
                      ),
                      const Text("Surname"),
                      TextFieldWidget(onTap: () => _surnamecontroller.clear(),
                        hintText: "Enter your surname",
                        icon: Icon(Icons.close),
                        keyboardType: TextInputType.name,
                        controller: _surnamecontroller,
                        validator: (name) => name!.length < 4
                            ? 'Password should be at least 4 digits long'
                            : null,
                      ),
                      SizedBox(
                        height: 20.r,
                      ),
                      const Text("BirthDate"),
                      TextFieldWidget(
                        onTap: () {setState(() {
                          _datecontroller.clear();
                        });} ,
                        hintText: "mm/dd/yyyy",
                        icon: const Icon(Icons.close),
                        keyboardType: TextInputType.number,
                        controller: _datecontroller,
                        validator: (name) => name!.length < 7
                            ? 'Password should be at least 7 digits long'
                            : null,
                      ),
                    
                    ],
                  ),
                ),
              ),
                SizedBox(
                      height: 300.r,
                    ),
                    NavigatorButtonWidget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GenderPage(),
                            )),
                        text: "Next")
            ],
          ),
        ),
      ),
    );
  }
}
