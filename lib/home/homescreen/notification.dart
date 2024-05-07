import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/managenotificationCubit/Statenoti.dart';
import 'package:null_project/home/cubits/managenotificationCubit/managenotificationCubit.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    shape: BoxShape.circle),
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            const Text(
              "Notification",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Color.fromARGB(255, 55, 54, 54)),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Clear All",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    index = 0;
                    setState(() {});
                    BlocProvider.of<managenotificationCubit>(context)
                        .changescreen(index: index);
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color:
                              index == 0 ? Colors.orange : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "Recent",
                      style: TextStyle(
                          color: index == 0 ? Colors.orange : Colors.grey,
                          fontSize: 20),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    index = 1;
                    setState(() {});
                    BlocProvider.of<managenotificationCubit>(context)
                        .changescreen(index: index);
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color:
                              index == 1 ? Colors.orange : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Earlier",
                        style: TextStyle(
                            color: index == 1 ? Colors.orange : Colors.grey,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    index = 2;
                    setState(() {});
                    BlocProvider.of<managenotificationCubit>(context)
                        .changescreen(index: index);
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color:
                              index == 2 ? Colors.orange : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "Archieved",
                      style: TextStyle(
                          color: index == 2 ? Colors.orange : Colors.grey,
                          fontSize: 20),
                    )),
                  ),
                ),
              ),
            ],
          ),
          BlocConsumer<managenotificationCubit, Statenoti>(
              builder: (context, state) {
                return BlocProvider.of<managenotificationCubit>(context).screen[
                    BlocProvider.of<managenotificationCubit>(context)
                        .currentindex];
              },
              listener: (context, state) {})
        ]),
      ),
    );
  }
}
