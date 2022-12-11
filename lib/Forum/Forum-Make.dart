import 'dart:io';

import 'package:capstone/Model/Icon/forum_icon_icons.dart';
import 'package:capstone/Widget/Navbottombar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MakeForumPage extends StatefulWidget {
  MakeForumPage({Key? key}) : super(key: key);

  @override
  State<MakeForumPage> createState() => _MakeForumPageState();
}

class _MakeForumPageState extends State<MakeForumPage> {
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
                      color: Color.fromARGB(255, 255, 91, 31),
                      fontWeight: FontWeight.w700),
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
              onPressed: () {},
              icon: const Icon(
                Icons.add_rounded,
                color: Color.fromARGB(255, 255, 91, 31),
              )),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/736x/93/12/38/9312386efccaa2b6b0d2c5a2c1a4eb34.jpg"),
                        fit: BoxFit.cover)),
              )
            ],
          ),
          _imageFile == null
              ? Container(
                  height: 170,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 80, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 154, 154, 154)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 6,
                        style: const TextStyle(fontSize: 12),
                        decoration: const InputDecoration(
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
                  height: 170,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 80, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 154, 154, 154)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(fontSize: 12),
                        decoration: const InputDecoration(
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
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BottomNavBar(),
                                          ),
                                          (route) => false);
                                    },
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
        ],
      ),
    );
  }
}
