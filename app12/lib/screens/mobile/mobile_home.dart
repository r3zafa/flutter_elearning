import 'package:app12/controllers/firebase_controller.dart';
import 'package:app12/controllers/firestore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/app_controller.dart';

class MobileHome extends StatelessWidget {
  MobileHome({Key? key}) : super(key: key);

  final AppController appController = Get.put(AppController());
  final FirebaseController firebaseController = Get.put(FirebaseController());
  final FirestoreController dbController = Get.put(FirestoreController());

  bool isCurrentUser({required String sender}) {
    bool temp = sender == firebaseController.currentUser?.email ? true : false;
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        elevation: 5,
        title: const Text('GroupChat'),
        backgroundColor: Colors.deepPurple.shade600,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 36,
        ),
        toolbarHeight: 70,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                firebaseController.logout();
              },
              child: const Icon(Icons.power_settings_new),
            ),
          ),
        ],
      ),
      drawerScrimColor: Colors.black54,
      drawer: SidebarX(
        showToggleButton: true,
        theme: SidebarXTheme(
          width: 90,
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
          ),
          padding:
              const EdgeInsets.only(top: 24, bottom: 24, left: 0, right: 0),
          textStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          selectedTextStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 22.sp,
          ),
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 22.sp,
          ),
          itemPadding: const EdgeInsets.only(top: 16, bottom: 16),
          selectedItemPadding: const EdgeInsets.only(top: 16, bottom: 16),
          selectedItemDecoration: BoxDecoration(
            color: Colors.deepPurple.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
          itemTextPadding: const EdgeInsets.only(left: 8),
          selectedItemTextPadding: const EdgeInsets.only(left: 8),
        ),
        extendedTheme: SidebarXTheme(
          selectedItemPadding: const EdgeInsets.all(16),
          itemPadding: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          width: 75.w,
        ),
        controller: SidebarXController(
          selectedIndex: 0,
          extended: true,
        ),
        items: const [
          SidebarXItem(icon: Icons.home, label: 'Home'),
          SidebarXItem(icon: Icons.search, label: 'Search'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Obx(
                () {
                  return Expanded(
                    child: dbController.messages.isNotEmpty
                        ? ScrollablePositionedList.builder(
                            itemCount: dbController.messages.isNotEmpty
                                ? dbController.messages.length
                                : 2,
                            itemScrollController:
                                appController.itemScrollController,
                            itemPositionsListener:
                                appController.itemPositionsListener,
                            initialScrollIndex: 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: isCurrentUser(
                                        sender: dbController.messages[index]
                                            ['sender'])
                                    ? EdgeInsets.only(left: 20.w)
                                    : EdgeInsets.only(right: 20.w),
                                child: Card(
                                  child: ListTile(
                                    title: Text(
                                      dbController.messages[index]['sender'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.red.shade900,
                                      ),
                                    ),
                                    subtitle: Text(
                                      dbController.messages[index]['msg'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: PopupMenuButton(
                                      initialValue: 0,
                                      onSelected: (item) {
                                        if (item == 1) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text(
                                                  'AlertDialog Title'),
                                              content: const Text(
                                                  'AlertDialog description'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'),
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                    dbController.deleteMsg(
                                                        docRef: dbController
                                                                .messages[index]
                                                            ['docRef']);
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry>[
                                        const PopupMenuItem(
                                          value: 1,
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: SizedBox(
                              child: Text(
                                'messages history is empty',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
              TextField(
                onSubmitted: (submit) {
                  if (appController.message.text.isNotEmpty) {
                    dbController.addMessage(
                      msg: appController.message.text,
                      user: firebaseController.currentUser?.email,
                    );
                    appController.message.clear();
                    appController.itemScrollController.scrollTo(
                      index: dbController.messages.length + 1,
                      duration: const Duration(milliseconds: 100),
                    );
                  }
                },
                controller: appController.message,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Type...',
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (appController.message.text.isNotEmpty) {
                        dbController.addMessage(
                          msg: appController.message.text,
                          user: firebaseController.currentUser?.email,
                        );
                        appController.message.clear();
                        appController.itemScrollController.scrollTo(
                          index: dbController.messages.length + 1,
                          duration: const Duration(milliseconds: 100),
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
