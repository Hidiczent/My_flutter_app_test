// import 'package:app_present/page/chatpage/DisplayListview.dart';
import 'package:app_present/page/chatpage/Display_message.dart';
import 'package:app_present/src/state_widget.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> imagePost = [
    "https://i.pinimg.com/474x/85/e5/ef/85e5efb7f0787c0eefa64c70c16ab20c.jpg",
    "https://i.pinimg.com/474x/40/b9/83/40b983aced20efe0b5b411696f2d98d6.jpg",
    "https://i.pinimg.com/474x/cc/23/9f/cc239fc7cc6e5f620eaf99f95c4797f4.jpg",
    "https://i.pinimg.com/474x/3b/85/93/3b859394c373441eb4a3761ade1ba463.jpg",
    "https://i.pinimg.com/564x/b3/fa/75/b3fa755d0411335c7cdfb8eec8fff8d8.jpg",
    "https://i.pinimg.com/474x/a9/e2/20/a9e22006a0c814a75b56657128a1f325.jpg",
    "https://i.pinimg.com/564x/f8/47/31/f8473155c434695c8d39ded9a868e67d.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true, // Set this to true to center the title
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage("images/ChatContract/Profile.jpg"),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Southavy Sengdavong",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "@S_jxmme",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  statWidget("Post", "7"),
                  statWidget("Followers", "128"),
                  statWidget("Follow", "98"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 150,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context, // You need to provide the context here
                          MaterialPageRoute(
                            builder: (context) =>
                                Displaymenu(), // Assuming DisplayListView is the destination widget
                          ),
                        );
                      },
                      child: Text(
                        "Massage",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  height: 15.0,
                  // thickness: 1.0,
                  // color: Colors.black87,
                ),
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: imagePost.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          // padding: EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(imagePost[index]),
                              fit: BoxFit
                                  .cover, // Move this line inside the DecorationImage
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
