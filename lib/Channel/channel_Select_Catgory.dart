import 'package:capstone/Channel/DataByCategory/lifestyleData.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  int? indextabbar;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 248, 248),
          title: const Text("Channel"),
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
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          hintStyle: const TextStyle(fontSize: 12),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 199, 199, 199))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 199, 199, 199))),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 248, 248, 248),
                          hintText: "Search",
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TabBar(
                        onTap: (index) {
                          setState(() {
                            indextabbar = index;
                          });
                        },
                        unselectedLabelColor:
                            const Color.fromARGB(255, 199, 199, 199),
                        isScrollable: true,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            gradient: const LinearGradient(
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter,
                                colors: [
                                  Colors.redAccent,
                                  Colors.orangeAccent
                                ]),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.redAccent),
                        tabs: [
                          const SizedBox(
                            height: 25,
                            child: Center(child: Text("All")),
                          ),
                          SizedBox(
                            height: 25,
                            child: Center(
                                child: indextabbar == 1
                                    ? Row(
                                        children: const [
                                          Text("Lifestyle"),
                                          Icon(
                                            Icons.close_rounded,
                                            size: 12,
                                          ),
                                        ],
                                      )
                                    : const Text("Lifestyle")),
                          ),
                          SizedBox(
                            height: 25,
                            child: Center(
                                child: indextabbar == 2
                                    ? Row(
                                        children: const [
                                          Text("Pregnancy"),
                                          Icon(
                                            Icons.close_rounded,
                                            size: 12,
                                          ),
                                        ],
                                      )
                                    : const Text("Pregnancy")),
                          ),
                          SizedBox(
                            height: 25,
                            child: Center(
                              child: indextabbar == 3
                                  ? Row(
                                      children: const [
                                        Text("Well-Being"),
                                        Icon(
                                          Icons.close_rounded,
                                          size: 12,
                                        ),
                                      ],
                                    )
                                  : const Text("Well-Being"),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                            child: Center(
                                child: Row(
                              children: const [
                                Text("More "),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                ),
                              ],
                            )),
                          ),
                        ]),
                  ),
                ],
              )),
              const Expanded(
                flex: 6,
                child: TabBarView(
                  children: [
                    Center(
                      child: Text("0"),
                    ),
                    DataLifeStylePage(),
                    Center(
                      child: Text("3"),
                    ),
                    Center(
                      child: Text("4"),
                    ),
                    Center(
                      child: Text("5"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
