import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/cubits/categories/states.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/customproductitem.dart';
import 'package:null_project/home/widgets/customslider.dart';
import 'package:null_project/home/widgets/selsectCategories.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<Categorecubit>(context);
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromARGB(255, 221, 219, 219),
              child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(
                      "assets/images/icon/Screenshot 2024-05-04 192346.png")),
            ),
            SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome🤞",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 169, 169, 169)),
                ),
                Text(
                  "Abdelghfar salah",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 1, 1, 1)),
                ),
              ],
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: const Image(
            height: 28,
            image: AssetImage("assets/images/icon/menu.png"),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.grey.withOpacity(1),
                ),
              ))
        ],
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Smart Shop",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const customslider(),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: selsectCategories(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: BlocBuilder<Categorecubit, categoriesStates>(
                  builder: (context, state) {
                    return Text(
                      "   ${cubit.categories[cubit.index]}...",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w900),
                    );
                  },
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            BlocConsumer<Categorecubit, categoriesStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is Success) {
                  List<productmodel> pro = state.res;
                  List<customproductitem> item = [];
                  for (var element in pro) {
                    item.add(customproductitem(model: element));
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 200,
                      child: ListWheelScrollView(
                        itemExtent: 200,
                        children: item,
                      ),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
