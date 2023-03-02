import 'package:flutter/material.dart';
import 'package:pro_design/enums.dart';
import 'package:pro_design/pro_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //Initializing ProDesign!
    ProDesign.init(context);

    //Getting device type to use it on purpose
    ProDeviceType deviceType = ProDesign.getDeviceType();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'pro_design',
          style: TextStyle(
            color: Colors.white,
            //Setting 20 as a responsive font size
            fontSize: ProDesign.sp(20),
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ProDesign.pt(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                //Text will be shown beased on device orientation
                ProDesign.orientation == Orientation.portrait
                    ? 'Device orientation in potrait mode'
                    : 'Device orientation changed to landscape mode and font size changed because of it',
                style: TextStyle(
                  color: Colors.black87,
                  //Setting responsive font size but will be changed based on device type
                  fontSize: ProDesign.sp(16),
                ),
              ),
            ),
            SizedBox(
              //Using 10% of the screen vertically
              height: ProDesign.vertically(10),
            ),
            SizedBox(
              //Setting 250pt responsive width
              width: ProDesign.pt(250),
              //Setting 50pt responsive height
              height: ProDesign.pt(50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                ),
                child: Text(
                  'Button',
                  style: TextStyle(
                    color: Colors.white,
                    //Setting 16 as a responsive font size
                    fontSize: ProDesign.sp(16),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              //Using 10% of the screen vertically
              height: ProDesign.vertically(10),
            ),
            Container(
              alignment: Alignment.center,
              //Using 80% of the screen horizontally
              width: ProDesign.horizontally(80),
              //Using 40% of the screen horizontally
              height: ProDesign.horizontally(40),
              color: Colors.black87,
              child: Text(
                'Container',
                style: TextStyle(
                  color: Colors.white,
                  //Setting 20 as a responsive font size
                  fontSize: ProDesign.sp(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
