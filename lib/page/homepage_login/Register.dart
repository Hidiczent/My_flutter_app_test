

import 'package:app_present/src/UserRole.dart';
import 'package:flutter/material.dart';
// import 'package:home_work/Profile.dart';
// import 'package:home_work/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool eye = true;
  TextEditingController user = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "ສະໝັກສະມາຊິກ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 30.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 30.0),
              child: Column(
                children: [
                  TextField(
                    controller: user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)), //ກຳນົດຂອບ
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person), //ໃສ່ໄອຄອນທາງໜ້າ
                      // suffixIcon: Icon(Icons.add) ໃສ່ໄອຄອນດ້ານຫຼັງ
                    ),

                    // labelText ກຳນົດ InputDecoration
                    // hintText
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
              child: TextField(
                controller: pwd,
                obscureText: eye,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)), //ກຳນົດຂອບ
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            eye = !eye;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye)) //ໃສ່ໄອຄອນທາງໜ້າ
                    // suffixIcon: Icon(Icons.add) ໃສ່ໄອຄອນດ້ານຫຼັງ
                    ),

                // labelText ກຳນົດ InputDecoration
                // hintText
              ),
            ),
            SizedBox(
              height: 30.0,
            ),

            // Button confirm
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // ກວດສອບເງື່ອນໄຂຄວາມຖືກຕ້ອງ
                        String stremail = email.text;
                        String struser = user.text;
                        String strpwd = pwd.text;

                        // ກວດສອບຄວາມຖືກຕ້ອງ email
                        String? emailError = emailValidator(stremail);
                        if (emailError != null) {
                          _showErrorDialog(emailError);
                          return; // Do not proceed if email validation fails
                        }

                        // ກວດສອບຄວາມຖືກຕ້ອງ username
                        String? usernameError = usernameValidator(struser);
                        if (usernameError != null) {
                          _showErrorDialog(usernameError);
                          return;
                        }

                        // ກວດສອບຄວາມຖືກຕ້ອງ password
                        String? passwordError = passwordValidator(strpwd);
                        if (passwordError != null) {
                          _showErrorDialog(passwordError);
                          return;
                        }

                        // All validations passed, proceed to the login screen
                        String result =
                            "Email: $stremail  Username: $struser \n Password: $strpwd ";
                        print(result);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserRole(
                              email: stremail,
                              username: struser,
                              password: strpwd,
                            ),
                          ),
                        );
                      });
                    },
                    child: Text("Confirm"),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text("Cancle"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

// ກວດສອບຄວາມຖືກຕ້ອງຂອງອີເມວ
  String? emailValidator(String? value) {
    // ກວດສອບເງື່ອນໄຂຄ່າວ່າງ
    if (value == null || value.isEmpty) {
      return 'ກາລຸນາປ້ອນທີຢູ່ອີເມວ';
    }
    // Regular expression
    RegExp regex = RegExp(r'^[a-zA-Z0-9._-]+@gmail\.com$');
    if (!regex.hasMatch(value)) {
      return 'ກາລຸນາປ້ອນທີຢູ່ອີເມວຂອງທ່ານໃຫ້ຖືກຕ້ອງ';
    }
    return null;
  }

// ກວດສອບຄວາມຖືກຕ້ອງຂອງຜູ້ໃຊ້
  String? usernameValidator(String value) {
    // ກວດສອບເງື່ອນໄຂຄ່າວ່າງ
    if (value.trim().isEmpty) {
      return 'ກາລຸນາປ້ອນຊື່ຜູ້ໃຊ້';
    }

    return null;
  }

// ກວດສອບຄວາມຖືກຕ້ອງຂອງລະຫັດຜ່ານ
  String? passwordValidator(String value) {
    // ກວດສອບເງື່ອນໄຂຄ່າວ່າງ
    if (value.trim().isEmpty) {
      return 'ກາລຸນາປ້ອນລະຫັດຜ່ານ';
    }
    if (value.length <= 8) {
      return 'ກາລຸນາປ້ອນລະຫັດຜ່ານໃຫ້ຍາວກວ່າ 8 ຕົວອັກສອນ';
    }
    return null;
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ເກິດມີຂໍ້ຜິດພາດ'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
