import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/homescreen/detailsscreen/details.dart';
import 'package:null_project/home/model/productmodel.dart';

class customproductitem extends StatefulWidget {
  customproductitem(
      {super.key,
      required this.cart,
      required this.model,
      required this.isfavorite});
  final productmodel model;
  bool isfavorite;
  bool cart;

  @override
  State<customproductitem> createState() => _customproductitemState();
}

class _customproductitemState extends State<customproductitem> {
  @override
  Widget build(BuildContext context) {
    var cubti = BlocProvider.of<ManageLove_Cart_states_cubit>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(model: widget.model),
            ),
          );
        },
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            height: MediaQuery.sizeOf(context).height * 0.23,
            decoration: BoxDecoration(
                // color: Color.fromARGB(255, 248, 228, 147),
                border: Border.all(color: Colors.yellow),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 1, offset: Offset(0, 10))
                ],
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFCC873),
                      Colors.white,
                    ]),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model!.title,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff6D6131),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.model.description,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6D6131),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 62, 56, 28),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Text(
                            "The best price  ",
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
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 156, 125, 0),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 156, 125, 0),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 156, 125, 0),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 46, 41, 20),
                          ),
                          Text(
                            "   ${widget.model.rating.rate} [1200]",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 100, 106, 7)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
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
                            Icons.favorite,
                            color: widget.model.isactive
                                ? const Color.fromARGB(255, 138, 11, 11)
                                : null,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (!widget.model.cart) {
                              cubti.addtocart(item: widget.model);
                            } else {
                              cubti.removefromcart(item: widget.model);
                            }
                            widget.model.cart = !widget.model.cart;
                            setState(() {});
                          },
                          icon: Icon(
                            FontAwesomeIcons.cartShopping,
                            color: widget.model.cart
                                ? Color.fromARGB(255, 138, 11, 11)
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -35,
            left: MediaQuery.of(context).size.width * 0.65,
            child: Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: widget.model.image,
                placeholder: (context, url) => const CircularProgressIndicator(
                  color: Colors.orange,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
