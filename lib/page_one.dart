import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final text_list = [
    "Early Access to the series",
    "Insider Exclusive rewards & Benefits",
    "Priority Customer Support",
  ];
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a1c23),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/bg.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Become An INSIDER",
                        style: TextStyle(
                          color: Color(0xffedab37),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Join the Insider programme and earn Supercoins with every purchase and much more. Log in now!",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 20,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // new goal criteria
                      const Text(
                        "New Goal Criteria",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Column(
                          children: [
                            CriteriaTile(
                              title: "\$0",
                              subtitle: "You've Spent",
                              goal: "\$700",
                            ),
                            CriteriaTile(
                              title: "0/5",
                              subtitle: "Your Orders",
                              goal: "5",
                            ),
                          ],
                        ),
                      ),

                      // benefits
                      const SizedBox(height: 25),
                      const Text(
                        "Benefits of joining the program",
                        style: TextStyle(
                          color: Color(0xffedab37),
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 40,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              text_list[index],
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ]),
                        ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: text_list.length,
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Rewards",
                        style: TextStyle(
                          color: Color(0xffedab37),
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        child: RawScrollbar(
                          radius: const Radius.circular(10),
                          thumbColor: Colors.grey.shade300,
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          controller: scrollController,
                          thickness: 5,
                          trackVisibility: true,
                          thumbVisibility: true,
                          child: ListView.separated(
                            controller: scrollController,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Image.asset(
                              'assets/images/bg.png',
                              height: 200,
                            ),
                            itemCount: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 110),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: const Color(0xff282c3f),
              height: 70,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.red,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}

class CriteriaTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String goal;
  const CriteriaTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xff282c3f),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.golf_course_sharp,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                goal,
                style: const TextStyle(color: Colors.white),
              ),
              const Text(
                "Goal",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}