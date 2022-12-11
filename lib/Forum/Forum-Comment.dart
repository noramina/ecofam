import 'dart:io';

import 'package:capstone/Forum/Forum-Make.dart';
import 'package:capstone/Model/DataDummy/dataforum.dart';
import 'package:capstone/Model/Icon/forum_icon_icons.dart';
import 'package:capstone/Widget/spacer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ForumCommentPage extends StatefulWidget {
  ForumCommentPage({Key? key, required this.forum}) : super(key: key);
  Forum? forum;

  @override
  State<ForumCommentPage> createState() => _ForumCommentPageState();
}

class _ForumCommentPageState extends State<ForumCommentPage> {
  final _picker = ImagePicker();
  File? _imageFile;

  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: _imageFile == null
              ? Container(
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 154, 154, 154)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 3,
                        style: const TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                            icon: Container(
                              margin: const EdgeInsets.all(5),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.forum!.image),
                                      fit: BoxFit.cover)),
                            ),
                            hintText: "Add a comment",
                            border: InputBorder.none),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                    onTap: () {
                                      getImage();
                                    },
                                    child: const Icon(
                                      ForumIcon.imageIcon,
                                      color: Color.fromARGB(255, 255, 91, 31),
                                    ))),
                            Positioned(
                              right: 0,
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Post",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 255, 91, 31),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
              : Container(
                  height: 150,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 154, 154, 154)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                            icon: Container(
                              margin: const EdgeInsets.all(5),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.forum!.image),
                                      fit: BoxFit.cover)),
                            ),
                            hintText: "Add a comment",
                            border: InputBorder.none),
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                width: 120,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            FileImage(_imageFile ?? File('')),
                                        fit: BoxFit.fitHeight)),
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _imageFile = null;
                                        });
                                      },
                                      child: const Icon(Icons.cancel)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                    onTap: () {
                                      getImage();
                                    },
                                    child: const Icon(
                                      ForumIcon.imageIcon,
                                      color: Color.fromARGB(255, 255, 91, 31),
                                    ))),
                            Positioned(
                              right: 0,
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Post",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 255, 91, 31),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        title: const Text("Forum"),
        automaticallyImplyLeading: false,
        leadingWidth: 67,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios_rounded,
                    color: Color.fromARGB(255, 255, 91, 31)),
                Text(
                  "Back",
                  style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 255, 91, 31),
                      fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
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
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
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
                              image: NetworkImage(widget.forum!.image),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 60),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          widget.forum!.nama,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 91, 31),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      spacer5(),
                      SizedBox(
                        width: 250,
                        child: Text(
                          widget.forum!.description,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        ),
                      ),
                      getimgpost(),
                      SizedBox(
                        width: 250,
                        child: Text(
                          widget.forum!.date,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 135, 135, 135)),
                        ),
                      ),
                      spacer5(),
                      SizedBox(
                          width: 250,
                          height: 15,
                          child: Stack(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(widget.forum!.image),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 7),
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(widget.forum!.image),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 14),
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(widget.forum!.image),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 21),
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(widget.forum!.image),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          )),
                      spacer5(),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 250,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  const Icon(
                                    ForumIcon.likesIcon,
                                    color: Color.fromARGB(255, 255, 91, 31),
                                    size: 17,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 3),
                                    child: Text(
                                      widget.forum!.likescount.toString(),
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 255, 91, 31),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 50),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(ForumIcon.commentIcon,
                                        size: 17,
                                        color:
                                            Color.fromARGB(255, 135, 135, 135)),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        widget.forum!.commentcount.toString(),
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
                                        color:
                                            Color.fromARGB(255, 135, 135, 135)),
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
          ),
          const Divider(
            color: Color.fromARGB(255, 160, 160, 160),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.forum!.commentcount,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: NetworkImage(widget.forum!.image),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(children: [
                            SizedBox(
                              width: 280,
                              child: Row(
                                children: [
                                  Text(
                                    widget.forum!.nama,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 255, 91, 31),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 5, left: 10, right: 10),
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 135, 135, 135),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  Text(
                                    widget.forum!.date,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 135, 135, 135)),
                                  ),
                                ],
                              ),
                            ),
                            spacer5(),
                            SizedBox(
                              width: 280,
                              child: Text(
                                widget.forum!.description,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                            SizedBox(
                                width: 240,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        ForumIcon.likesIcon,
                                        size: 15,
                                        color: Color.fromARGB(255, 255, 91, 31),
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(left: 3),
                                        child: Text(
                                          widget.forum!.likescount.toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 255, 91, 31),
                                          ),
                                        ))
                                  ],
                                )),
                          ])),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getimgpost() {
    if (widget.forum!.imgpost != "") {
      return Column(
        children: [
          spacer5(),
          Container(
            width: 200,
            height: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.forum!.imgpost),
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
