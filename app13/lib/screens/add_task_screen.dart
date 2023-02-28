import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
    required this.addItemCallBack,
  }) : super(key: key);

  final Function addItemCallBack;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String newTaskTitle = '';

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom < 1
            ? 20
            : MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            controller: controller,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 2,
            autofocus: true,
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3),
              ),
            ),
            onChanged: (newVal) {
              newTaskTitle = newVal;
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
                    ? const EdgeInsets.symmetric(vertical: 30)
                    : const EdgeInsets.symmetric(vertical: 15),
              ),
              backgroundColor:
                  const MaterialStatePropertyAll<Color>(Colors.lightBlueAccent),
            ),
            onPressed: () {
              if (newTaskTitle.isNotEmpty) {
                addItemCallBack(newTaskTitle);
                controller.clear();
              } else {
                if (kDebugMode) {
                  print('input empty!');
                }
              }
            },
            child: Text(
              'Add'.toUpperCase(),
              style: TextStyle(
                fontSize:
                    (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
                        ? 24
                        : 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
