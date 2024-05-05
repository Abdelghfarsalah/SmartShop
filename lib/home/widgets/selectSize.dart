import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/managedetails/detailsStates.dart';
import 'package:null_project/home/cubits/managedetails/detailscubit.dart';

// ignore: must_be_immutable
class selectSize extends StatefulWidget {
  const selectSize({super.key});

  @override
  State<selectSize> createState() => _selectSizeState();
}

class _selectSizeState extends State<selectSize> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<detailscubit>(context);
    return Container(
      padding: EdgeInsets.only(left: 10, right: 0, top: 2),
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Size",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: BlocConsumer<detailscubit, DetailsStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.Sizes.length,
                  itemBuilder: (context, index) => selectSizewidget(
                    cubit: cubit,
                    index: index,
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

class selectSizewidget extends StatelessWidget {
  const selectSizewidget({
    super.key,
    required this.cubit,
    required this.index,
  });
  final int index;
  final detailscubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.changesize(i: index);
      },
      child: Text(
        "${cubit.Sizes[index]}  ",
        style: TextStyle(
            fontWeight:
                cubit.sizeindex == index ? FontWeight.w900 : FontWeight.w500,
            fontSize: cubit.sizeindex == index ? 24 : 20,
            color: cubit.sizeindex == index ? Colors.white : Colors.grey),
      ),
    );
  }
}
