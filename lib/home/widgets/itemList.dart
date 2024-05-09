import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/homescreen/detailsscreen/details.dart';
import 'package:null_project/home/model/productmodel.dart';

class itemlist extends StatefulWidget {
  itemlist(
      {super.key,
      required this.cart,
      required this.isfavorite,
      required this.model,
      required this.index});
  final productmodel model;
  final int index;
  bool isfavorite;
  bool cart;
  @override
  State<itemlist> createState() => _itemlistState();
}

class _itemlistState extends State<itemlist> {
  @override
  Widget build(BuildContext context) {
    var cubti = BlocProvider.of<ManageLove_Cart_states_cubit>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(model: widget.model),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Container(
          height: 150,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 1, offset: Offset(0, 10))
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFCC873),
                  Colors.white,
                ]),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 110,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              CachedNetworkImageProvider(widget.model.image)),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.model.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      "${widget.model.price}\$ ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.green,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    if (widget.model.cart) {
                      cubti.removefromcart(item: widget.model);
                    } else {
                      cubti.addtocart(item: widget.model);
                    }
                    widget.model.cart = !widget.model.cart;
                    setState(() {});
                  },
                  icon: Icon(
                    FontAwesomeIcons.cartShopping,
                    color: widget.model.cart
                        ? const Color.fromARGB(255, 138, 11, 11)
                        : null,
                  )),
              IconButton(
                  onPressed: () {
                    if (widget.model.isactive) {
                      cubti.removefromLove(item: widget.model);
                    } else {
                      cubti.addtolove(item: widget.model);
                    }
                    widget.model.isactive = !widget.model.isactive;
                    setState(() {});
                  },
                  icon: Icon(
                      color: widget.model.isactive
                          ? const Color.fromARGB(255, 138, 11, 11)
                          : null,
                      Icons.favorite))
            ],
          ),
        ),
      ),
    );
  }
}
