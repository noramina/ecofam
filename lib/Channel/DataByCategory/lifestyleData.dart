import 'package:capstone/Model/DataDummy/dataforum.dart';
import 'package:flutter/material.dart';

class DataLifeStylePage extends StatefulWidget {
  const DataLifeStylePage({Key? key}) : super(key: key);

  @override
  State<DataLifeStylePage> createState() => _DataLifeStylePageState();
}

class _DataLifeStylePageState extends State<DataLifeStylePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: const Color.fromARGB(255, 200, 200, 200))),
          child: Stack(
            children: [
              Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "#MomNightTalks",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromARGB(255, 255, 68, 0)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Seberapa pentingkah seorang Ibu mengetahui status anakanya?",
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
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: NetworkImage(forumdata[1].image),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    const Color.fromARGB(129, 255, 255, 255)),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: NetworkImage(forumdata[1].image),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            const SizedBox(width: 200, child: Text("Michelle")),
                            const SizedBox(width: 200, child: Text("Jessica")),
                            const SizedBox(width: 200, child: Text("Justin")),
                            SizedBox(
                              width: 200,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.account_circle_outlined,
                                    size: 15,
                                    color: Color.fromARGB(255, 255, 163, 129),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 3),
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
                )
              ])
            ],
          ),
        );
      },
    );
  }
}
