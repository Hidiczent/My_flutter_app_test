import 'package:app_present/page/Shoppage/Hompage.dart';
import 'package:app_present/page/homepage_login/Homepage.dart';
import 'package:app_present/page/homepage_login/Register.dart';
import 'package:flutter/material.dart';

// import 'package:home_work/UserRole.dart';
// import 'package:project_lect2cw1/Register.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool eye = true;
  TextEditingController user = TextEditingController();
  TextEditingController pwd = TextEditingController();
  int loginAttempts = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("ເຂົ້າສູ່ລະບົບ"),
      // ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "ເຂົ້າສູ່ລະບົບ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 30.0),
              child: Column(
                children: [
                  TextField(
                    controller: user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
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
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        eye = !eye;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            // Button Login
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        _Profile(user.text, pwd.text);
                      },
                      child: Text('Login'),
                    ),
                  ),
                  // _Profile(user.text, pwd.text);
                  SizedBox(width: 15.0),
                  Container(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      child: Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _Profile(String username, String password) {
    if (username == "Southavy" && password == "Sengdavong" ||
        username == "jimmy" && password == "02059955001") {
      // ໄປຫາໜ້າຈໍຖັດໄປຖ້າຖືກຕາມເງື່ອນໄຂ
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShopingMenu()),
      );
    } else {
      // ເມື່ອມີການລັອກອິນຜິດຕາມທີ່ເຮົາກຳນົດໄວ້ຄົບສາມຮອບມັນຈະເຮັດການບວກຄ່າມັນເອງຂຶ້ນເທື່ອລະ1ໍຈົນຄົບ
      loginAttempts++;
      _showErrorDialog('ຂໍ້ມູນບໍ່ຖືກຕ້ອງ. ກະລຸນາລອງອີກຄັ້ງ.');

      // ກວດເງື່ອນໄຂເມື່ອມີການພາຍາຍາມລັອກເກິນ3ຮອບ
      if (loginAttempts >= 3) {
        // ສະ​ແດງ​ຂໍ້​ຄວາມ​ຜິດ​ພາດ​ຫຼື​ດໍາ​ເນີນ​ການ​ທີ່​ເຫມາະ​ສົມ (ເຊັ່ນ​: lock ບັນ​ຊີ​)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
        _showErrorDialog('ທ່ານໄດ້ພະຍາຍາມເຂົ້າສູ່ລະບົບເກີນກຳໜົດ.');
      }
    }
  }

  // ຟັງຊັນເພື່ອສະແດງການໂຕ້ຕອບຂໍ້ຜິດພາດ
  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
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
