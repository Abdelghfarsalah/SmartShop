import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/homescreen/detailsscreen/details.dart';
import 'package:null_project/home/model/productmodel.dart';

class itemgrid extends StatefulWidget {
  itemgrid({
    super.key,
    required this.cart,
    required this.isfavorite,
    required this.model,
  });
  final productmodel model;

  bool isfavorite;
  bool cart;

  @override
  State<itemgrid> createState() => _itemgridState();
}

class _itemgridState extends State<itemgrid> {
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(widget.model.image))),
                margin: EdgeInsets.all(10),
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.model.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.model.description,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "  Price  ",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 2, 26, 7)),
                  ),
                  Text(
                    " ${widget.model.price}\$ ",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 18, 214, 60)),
                  ),
                  const Spacer(),
                  Text(
                    " ${widget.model.rating.rate}  ",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 101, 160, 114)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                            ? Color.fromARGB(255, 138, 11, 11)
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
