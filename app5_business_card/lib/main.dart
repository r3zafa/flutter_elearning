import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: false,
      builder: (context) => Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FarajiContact',
          home: Scaffold(
            backgroundColor: Colors.teal[900],
            body: SafeArea(
              child: SizedBox(
                height: 100.h,
                width: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.black38,
                      backgroundImage: AssetImage('assets/images/bio.jpg'),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Reza Faraji',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                          fontSize: 42,
                          wordSpacing: 2,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        'IT Consultant / Full stack developer'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            wordSpacing: 5,
                            letterSpacing: 4,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                      width: 50.w,
                      child: const Divider(
                        thickness: 2.0,
                        color: Colors.white10,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.black38),
                        ),
                        onPressed: _callNumber,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.call,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Call',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '(+4917657943385)',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.black38),
                        ),
                        onPressed: _launchUrl,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.email_outlined,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'rfaraji@frobese.com',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

_callNumber() async {
  const number = '+4917657943385';
  await FlutterPhoneDirectCaller.callNumber(number);
}

Future<void> _launchUrl() async {
  final Uri url = Uri.parse('mailto:rfaraji@frobese.com');
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
