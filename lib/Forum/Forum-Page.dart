import 'package:capstone/Forum/Forum-Comment.dart';
import 'package:capstone/Forum/Forum-Make.dart';
import 'package:capstone/Model/DataDummy/dataforum.dart';
import 'package:capstone/Model/Icon/forum_icon_icons.dart';
import 'package:capstone/Widget/spacer.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        title: const Text("Forum"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 91, 31),
            fontSize: 17,
            fontWeight: FontWeight.bold),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MakeForumPage(),
                    ));
              },
              icon: const Icon(
                Icons.add_rounded,
                color: Color.fromARGB(255, 255, 91, 31),
              )),
        ],
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: forumdata.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: const Color.fromARGB(255, 200, 200, 200))),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                                image: NetworkImage(forumdata[index].image),
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
                                color: Color.fromARGB(255, 255, 91, 31),
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
                                color: Color.fromARGB(255, 255, 91, 31)),
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
                                color: Color.fromARGB(255, 135, 135, 135)),
                          ),
                        ),
                        spacer5(),
                        SizedBox(
                            width: 193,
                            height: 15,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 21),
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              forumdata[index].image),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 14),
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              forumdata[index].image),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 7),
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              forumdata[index].image),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
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
                                      color: Color.fromARGB(255, 255, 91, 31),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 3),
                                      child: Text(
                                        forumdata[index].likescount.toString(),
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 91, 31),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 50),
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
                                      const Icon(ForumIcon.commentIcon,
                                          size: 17,
                                          color: Color.fromARGB(
                                              255, 135, 135, 135)),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          forumdata[index]
                                              .commentcount
                                              .toString(),
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 135, 135, 135)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 50),
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
          },
        ),
      ),
    );
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
}
