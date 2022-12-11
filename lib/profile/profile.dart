import 'package:capstone/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:capstone/Forum/Forum-Comment.dart';
import 'package:capstone/Model/DataDummy/dataforum.dart';
import 'package:capstone/Model/Icon/forum_icon_icons.dart';
import 'package:capstone/Widget/spacer.dart';

void main() => runApp(const ProfilePage());

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String _title = 'TabBar Profile';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 248, 248, 248),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 91, 31),
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () async {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    size: 20,
                    color: Color.fromARGB(255, 255, 91, 31),
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false),
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('Asset/Image/maleprofile.jpeg'),
                    backgroundColor: Colors.deepOrangeAccent,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Ade Prayoga Nugraha',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Surabaya',
                    style:
                        TextStyle(fontSize: 15, color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xffF15C22),
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.orangeAccent,
            tabs: const <Widget>[
              Tab(text: "Forum"),
              Tab(text: "Channel"),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
              padding: const EdgeInsets.only(left: 20, top: 5),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: forumdata.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              forumdata[index].image),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 40),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 193,
                                    child: Text(
                                      forumdata[index].nama,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 255, 91, 31),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  spacer5(),
                                  SizedBox(
                                    width: 193,
                                    child: Text(
                                      forumdata[index].category,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 255, 91, 31)),
                                    ),
                                  ),
                                  spacer5(),
                                  SizedBox(
                                    width: 193,
                                    child: Text(
                                      forumdata[index].description,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                  getimgpost(index),
                                  SizedBox(
                                    width: 193,
                                    child: Text(
                                      forumdata[index].date,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 135, 135, 135)),
                                    ),
                                  ),
                                  spacer5(),
                                  SizedBox(
                                      width: 193,
                                      height: 15,
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 21),
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        forumdata[index].image),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 14),
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        forumdata[index].image),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 7),
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        forumdata[index].image),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        forumdata[index].image),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ],
                                      )),
                                  spacer5(),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    width: 193,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              const Icon(
                                                ForumIcon.likesIcon,
                                                size: 17,
                                                color: Color.fromARGB(
                                                    255, 255, 91, 31),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 3),
                                                child: Text(
                                                  forumdata[index]
                                                      .likescount
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 91, 31),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 50),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ForumCommentPage(
                                                      forum: forumdata[index],
                                                    ),
                                                  ));
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    ForumIcon.commentIcon,
                                                    size: 17,
                                                    color: Color.fromARGB(
                                                        255, 135, 135, 135)),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10),
                                                  child: Text(
                                                    forumdata[index]
                                                        .commentcount
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            135,
                                                            135,
                                                            135)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 50),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Row(
                                              children: const [
                                                Icon(ForumIcon.shareIcon,
                                                    size: 17,
                                                    color: Color.fromARGB(
                                                        255, 135, 135, 135)),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Column(children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Text(
                                  "#MomDaddy Outpouring",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 255, 68, 0)),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Text(
                                  "Bagaimana menjaga keharmonisan rumah tangga ?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 255, 68, 0)),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 10, left: 10),
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      forumdata[1].image),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 10, left: 10),
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: const Color.fromARGB(
                                                  129, 255, 255, 255)),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      forumdata[1].image),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                              width: 200,
                                              child: Text("Michelle")),
                                          const SizedBox(
                                              width: 200,
                                              child: Text("Jessica")),
                                          const SizedBox(
                                              width: 200,
                                              child: Text("Justin")),
                                          SizedBox(
                                            width: 200,
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.account_circle_outlined,
                                                  size: 15,
                                                  color: Color.fromARGB(
                                                      255, 255, 163, 129),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 3),
                                                  child: const Text(
                                                    "7",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 163, 129),
                                                        fontSize: 12),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 50,
                              ),
                              Column(children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text(
                                    "Berita Indonesia",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 255, 68, 0)),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text(
                                    "Informasi Gempa Bumi Cianjur ?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 13,
                                        color: Color.fromARGB(255, 255, 68, 0)),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, left: 10),
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        forumdata[1].image),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, left: 10),
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: const Color.fromARGB(
                                                    129, 255, 255, 255)),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        forumdata[1].image),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                                width: 200,
                                                child: Text("Steven")),
                                            const SizedBox(
                                                width: 200,
                                                child: Text("Andreo")),
                                            const SizedBox(
                                                width: 200,
                                                child: Text("Jane")),
                                            SizedBox(
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .account_circle_outlined,
                                                    size: 15,
                                                    color: Color.fromARGB(
                                                        255, 255, 163, 129),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 3),
                                                    child: const Text(
                                                      "7",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              163,
                                                              129),
                                                          fontSize: 12),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ])
                            ]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ]))
        ]));
  }
}

Widget getimgpost(int index) {
  if (forumdata[index].imgpost != "") {
    return Column(
      children: [
        spacer5(),
        Container(
          width: 200,
          height: 130,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(forumdata[index].imgpost),
                  fit: BoxFit.fitHeight)),
        ),
        spacer5()
      ],
    );
  } else {
    return spacer5();
  }
}
