import 'package:app_present/page/Shoppage/pages/Home_srceen.dart';
import 'package:app_present/page/Shoppage/pages/favorite_srceen.dart';
import 'package:app_present/page/Shoppage/providers/cart_provider.dart';
import 'package:app_present/page/Shoppage/providers/favorite_provider.dart';
import 'package:app_present/page/chatpage/Display_message.dart';
import 'package:app_present/page/chatpage/Showchat.dart';
import 'package:app_present/page/homepage_login/Profile.dart';
import 'package:app_present/page/homepage_login/login.dart';
import 'package:app_present/src/FutureImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopingMenu extends StatefulWidget {
  const ShopingMenu({super.key});

  @override
  State<ShopingMenu> createState() => _ShopingMenuState();
}

class _ShopingMenuState extends State<ShopingMenu> {
  int currentIndex = 0;
  List screens = [const Home_screen(), const FavoriteScreen(), const Profile()];

  Widget UnitItem() {
    return ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text("ຂໍ້ມູນຫົວໜ່ວຍ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget CategoryItem() {
    return ListTile(
        leading: Icon(Icons.category),
        title: Text("ປະເພດສິນຄ້າ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget ProductItem() {
    return ListTile(
        leading: Icon(Icons.storage),
        title: Text("ຂໍ້ມູນຫົວໜ່ວຍ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget SaletsItem() {
    return ListTile(
        leading: Icon(Icons.shopping_cart),
        title: Text("ຂາຍສິນຄ້າ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget OrderItem() {
    return ListTile(
        leading: Icon(Icons.payment),
        title: Text("ການສັ່ງສິນຄ້າ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget ImportItem() {
    return ListTile(
        leading: Icon(Icons.import_export),
        title: Text("ການນຳເຂົ້າສິນຄ້າ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget ReportItem() {
    return ListTile(
        leading: Icon(Icons.report),
        title: Text("ລາຍງານສິນຄ້າ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget EmployeeItem() {
    return ListTile(
        leading: Icon(Icons.person),
        title: Text("ຂໍ້ມູນພະນັກງານ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget SupplyItem() {
    return ListTile(
        leading: Icon(Icons.send_and_archive),
        title: Text("ຂໍ້ມູນຜູ້ສະໜອງ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget ExchangeItem() {
    return ListTile(
        leading: Icon(Icons.currency_exchange),
        title: Text("ອັດຕາການແລກປ່ຽນ"),
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  Widget Logout() {
    return ListTile(
        leading: Icon(Icons.logout),
        title: Text("ອອກຈາກລະບົບ"),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => login()));
        });
  }

  Widget ListMenuItem() {
    return Container(
      child: Column(children: [
        Myprofile(),
        // UnitItem(),
        // CategoryItem(),
        ProductItem(),
        SaletsItem(),
        OrderItem(),
        ImportItem(),
        ReportItem(),
        EmployeeItem(),
        SupplyItem(),
        ExchangeItem(),
        Logout(),
        Divider(
          color: Colors.black,
        )
      ]),
    );
  }

  Widget showText() {
    return Text(
      "Southavy Sengdavong",
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget ShopLogo() {
    return Container(
      width: 80,
      height: 80,
      child: GestureDetector(
        onTap: () {
          FullImage.showFullImage(context);
        },
        child: CircleAvatar(
          backgroundImage: AssetImage("images/ChatContract/Profile.jpg"),
        ),
      ),
    );
  }

  Widget Myprofile() {
    return ListTile(
        leading: Icon(Icons.person),
        title: Text("ໂປໄຟລຂອງຂ້ອຍ"),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profile()));
        });
  }

  Widget headerItem() {
    return DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/ChatContract/bgcoffee.gif"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 5)),
          ShopLogo(),
          SizedBox(height: 5.0),
          showText(),
          SizedBox(height: 5.0),
          // showLongin(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        // ChangeNotifierProvider(create: (_) => ())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("ລະບົບຂາຍຈອງຮ້ານ CW Store"),
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  if (value == "shared") {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => login()));
                  } else if (value == "Messenger") {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Displaymenu()));
                  } else if (value == "settings") {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ShowChat()));
                  }
                },
                color: Colors.black,
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: "shared",
                        child: ListTile(
                          leading: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          title: Text(
                            "ສົ່ງຕໍ່",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Messenger",
                        child: ListTile(
                          leading: Icon(
                            Icons.messenger,
                            color: Colors.white,
                          ),
                          title: Text("ສົ່ງຂໍ້ຄວາມ",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      PopupMenuItem(
                        value: "settings",
                        child: ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text("ຕັ້ງຄ່າ",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      PopupMenuItem(
                        value: "ປິດໂປແກຣມ",
                        child: ListTile(
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          title: Text("ປິດໂປແກຣມ",
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ])
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              headerItem(),
              ListMenuItem(),
            ],
          ),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            // Handle navigation item taps here
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
