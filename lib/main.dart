import 'package:aweliv/utils/constans.dart';
import 'package:aweliv/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeTab(),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;
  List screens = [const HomePage(), Container(), const HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 69, 82, 28),
          selectedItemColor: Appcolors.green,
          unselectedItemColor: Appcolors.green,
          unselectedLabelStyle: Style.textStyleinter(color: Appcolors.white, fontSize: 12),
          selectedLabelStyle: Style.textStyleinter(color: Appcolors.white, fontSize: 12),
          currentIndex: currentIndex,
          onTap: (v) {
            setState(() {
              currentIndex = v;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.flight), label: 'Aweliv'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
      body: screens[currentIndex],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchValue = false;
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    var tabChildren = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            children: [
              customCard('Lighting1'),
              const SizedBox(height: 20),
              customCard('Lighting2'),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              customCard('Lighting3'),
              const SizedBox(height: 20),
              customCard('Lighting4'),
            ],
          ),
        ],
      ),
    );
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              ListTile(
                leading: const CircleAvatar(backgroundColor: Appcolors.black, radius: 25),
                trailing: Image.asset(Images.hand, width: 58, height: 38),
                title: Text(
                  'Welcome Home',
                  style: Style.textStyleinter(fontWeight: FontWeight.w500, fontSize: 12),
                ),
                subtitle: Text(
                  'Aman Bindal',
                  style: Style.textStyleinter(fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
              const SizedBox(height: 23),
              SizedBox(
                width: screenSize(context).width,
                height: 230,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  itemBuilder: (_, index) => Container(
                    width: screenSize(context).width * .9,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      gradient:
                          LinearGradient(colors: [Color(0xff283618), Color(0xff728142)]),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    margin: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Energy Usage'.toUpperCase(),
                              style: Style.textStyleinter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Appcolors.white,
                              ),
                            ),
                            Text(
                              '23 Feb 2022',
                              style: Style.textStyleinter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Appcolors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Image.asset(
                              Images.thunder,
                              width: 107,
                              height: 86,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 35),
                            Container(color: Appcolors.grey, width: 1, height: 72),
                            const SizedBox(width: 35),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\nToday’s Usage',
                                      style: Style.textStyleinter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Appcolors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Container(
                                      // width: 20,
                                      // height: 20,
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Appcolors.white,
                                      ),
                                      child: Image.asset(Images.bolt,
                                          height: 15, fit: BoxFit.cover),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '24.6 kWhs',
                                  style: Style.textStyleinter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: Appcolors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CupertinoSwitch(
                                activeColor: Appcolors.green,
                                thumbColor: Appcolors.white,
                                trackColor: Appcolors.green,
                                value: switchValue,
                                onChanged: (v) {
                                  setState(() {
                                    switchValue = v;
                                  });
                                }),
                            const SizedBox(width: 20),
                            Flexible(
                              child: Text(
                                'Turn On The Energy Saver To Save Power',
                                style: Style.textStyleinter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Appcolors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < 3; i++)
                    Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                          color: Appcolors.grey, shape: BoxShape.circle),
                    ),
                ],
              ),
              SizedBox(
                width: screenSize(context).width,
                // height: 200,
                child: const TabBar(
                  unselectedLabelColor: Appcolors.grey,
                  labelColor: Appcolors.green,
                  indicatorColor: Appcolors.green2,
                  indicatorSize: TabBarIndicatorSize.label,
                  padding: EdgeInsets.only(top: 30),
                  indicatorWeight: 3,
                  tabs: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('My Room'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Living Room'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Garden'),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: TabBarView(children: [
                  tabChildren,
                  tabChildren,
                  tabChildren,
                ]),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  gradient: LinearGradient(colors: [Color(0xff283618), Color(0xff728142)]),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Change room temp',
                          style: Style.textStyleinter(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Appcolors.white,
                          ),
                        ),
                        Text(
                          '22.4 C',
                          style: Style.textStyleinter(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Appcolors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Slider(
                        value: sliderValue,
                        activeColor: Appcolors.green,
                        inactiveColor: Appcolors.green,
                        thumbColor: Appcolors.white,
                        onChanged: (v) {
                          setState(() {
                            sliderValue = v;
                          });
                        })
                  ],
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget customCard(title) {
    return Container(
      width: screenSize(context).width * .42,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Appcolors.grey.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Appcolors.green2,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: const Icon(
                  Icons.light,
                  color: Appcolors.grey,
                ),
              ),
              Transform.scale(
                scale: 0.7,
                alignment: Alignment.topRight,
                child: CupertinoSwitch(
                    activeColor: Appcolors.green,
                    thumbColor: Appcolors.white,
                    trackColor: Appcolors.green,
                    value: switchValue,
                    onChanged: (v) {
                      setState(() {
                        switchValue = v;
                      });
                    }),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Style.textStyleinter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Appcolors.black,
                    ),
                  ),
                  Text(
                    title,
                    style: Style.textStyleinter(
                      fontSize: 10,
                      color: Appcolors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                'On',
                style: Style.textStyleinter(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Appcolors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
