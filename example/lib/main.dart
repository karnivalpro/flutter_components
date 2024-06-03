import 'package:flutter/material.dart';
import 'package:flutter_component/flutter_component.dart';

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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          fontFamily: "Inter"),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: <Widget>[
            const KAvatar(
              imageUrl:
                  "https://pbs.twimg.com/profile_images/803832195970433027/aaoG6PJI_400x400.jpg",
              size: 124,
              boxShape: BoxShape.rectangle,
            ),
            const SizedBox(height: 24),
            const KAvatar(
              imageUrl: "assets/image/profile.jpeg",
              size: 124,
              boxShape: BoxShape.circle,
            ),
            const SizedBox(height: 24),
            KButton(
                text: "Press me hello world",
                onPressed: () {},
                textStyle: KTextStyles.textStyle(
                    fontSize: 24, fontColor: Colors.white)),
            const SizedBox(
              width: 24,
            ),
            KButtonLoading(
                text: "Press me",
                onPressed: () {},
                isLoading: true,
                textStyle: KTextStyles.textStyle(
                    fontSize: 24, fontColor: Colors.white)),
            const SizedBox(
              width: 24,
            ),
            KButton(
                text: "Press me hello world",
                onPressed: () {},
                buttonStyle:
                    KButtonStyle.buttonStyleBorder(buttonBgColor: Colors.white),
                textStyle: KTextStyles.textStyle(
                    fontSize: 24, fontColor: Colors.black)),
            KText(
              text: 'You have pushed the button this many times:',
              textStyle: KTextStyles.textStyle(
                fontSize: 32,
              ),
            ),
            KText(
              text: 'You have pushed the button this many times:',
              textStyle: KTextStyles.textStyle(
                fontSize: 32,
                fontFamily: "DancingScript",
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            KAvatarGroup(
              agItems: [AGData(name: "Shivam Sharma", email: "shivam.sharma@karnival.com", imageSrc: "https://media.licdn.com/dms/image/D5603AQGy1guHaasKAg/profile-displayphoto-shrink_400_400/0/1671378198865?e=1689811200&v=beta&t=zoKf8yD-vinTssIMYOJg7Hrnes5A-yUWv4bZdGWD6EA"),
                AGData(name: "Ayush Kumar", email: "ayush.kumar@karnival.com", imageSrc: "https://media.licdn.com/dms/image/C5603AQEv1RX1G-NSKw/profile-displayphoto-shrink_400_400/0/1620534945628?e=1689811200&v=beta&t=jNfGZf5V3vWM3B-d6BKjhBhWsA7j-MM5tL8B8679wiw"),
                AGData(name: "Himanshu Jain", email: "himanshu.j@karnival.com", imageSrc: "https://media.licdn.com/dms/image/C5603AQFh4dZzGMoJZg/profile-displayphoto-shrink_400_400/0/1659903870815?e=1689811200&v=beta&t=K4M_zUqw6boC4cj223lFEVuBA0LU7pOdUJFMqyw31GQ"),
                AGData(name: "Shivam Sharma", email: "shivam.sharma@karnival.com", imageSrc: "https://media.licdn.com/dms/image/D5603AQGy1guHaasKAg/profile-displayphoto-shrink_400_400/0/1671378198865?e=1689811200&v=beta&t=zoKf8yD-vinTssIMYOJg7Hrnes5A-yUWv4bZdGWD6EA")
              ],
            ),
            SizedBox(
                width: 450,
                height: 250,
                child: KCalendarView()),
            // const AnimatedAlignWidget(),
            const KBadge(value: '8',kBadgeType: KBadgeType.normal,),
            const SpaceView(width: 12,),
            const KBadge(value: '8200002020',kBadgeType: KBadgeType.primary,),
            const SpaceView(width: 12,),
            const KBadge(value: '8', kBadgeType: KBadgeType.added,),
            const SpaceView(width: 12,),
            const KBadge(value: '8', kBadgeType: KBadgeType.removed,),
            const SpaceView(width: 12,),
            const KBadge(value: '8', kBadgeType: KBadgeType.imported,),
            const SpaceView(width: 12,),
            const KBadge(value: '8', kBadgeType: KBadgeType.primaryInverted,),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
