import 'package:flutter/material.dart';

class Practice04 extends StatelessWidget {
  const Practice04({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Practice 04"),
          backgroundColor: const Color(0xFFF6D983),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Food",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/food.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 217, 131, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              child: Text(
                                "배고프다 배고프다 ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text("Check List",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: const [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading:
                            Icon(Icons.check, color: Colors.black, size: 40),
                        title: Text("올리브영 가기", style: TextStyle(fontSize: 20)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading:
                            Icon(Icons.check, color: Colors.black, size: 40),
                        title: Text("컴퓨터구조 과제", style: TextStyle(fontSize: 20)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading:
                            Icon(Icons.check, color: Colors.black, size: 40),
                        title:
                            Text("서버구축 시험 준비", style: TextStyle(fontSize: 20)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading:
                            Icon(Icons.check, color: Colors.black, size: 40),
                        title: Text("헬스장 가기", style: TextStyle(fontSize: 20)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const Text("D-Day List",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildDdayItem("여행 준비", "D-3"),
                    buildDdayItem("프로젝트 마감", "D-7"),
                    buildDdayItem("친구 결혼식", "D-10"),
                    buildDdayItem("헬스장 등록", "D-30"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDdayItem(String title, String dday) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Text(
                  dday,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
