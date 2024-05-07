import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:u_credit_card/u_credit_card.dart';

class buybage extends StatefulWidget {
  const buybage({super.key, required this.model});
  final productmodel model;

  @override
  State<buybage> createState() => _buybageState();
}

class _buybageState extends State<buybage> {
  int indexselext = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
            ),
            Text(
              "Convenient Payment",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 100,
                width: 55,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Icon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.white,
                )),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            CreditCardUi(
              cardHolderFullName: 'John Doe',
              cardNumber: '1234567812345678',
              validFrom: '01/23',
              validThru: '01/28',
              topLeftColor: Color.fromARGB(255, 72, 72, 72),
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
              enableFlipping: true,
              width: MediaQuery.sizeOf(context).width * 0.9,
              balance: 128.32434343,
              cvvNumber: '123',
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              indent: 10,
              endIndent: 10,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "  Payment Method..",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Row(
              children: [
                paymentmethod(
                  onTap: () {
                    indexselext = 0;
                    setState(() {});
                  },
                  image: const Icon(
                    FontAwesomeIcons.paypal,
                    size: 60,
                    color: Color.fromARGB(255, 3, 50, 88),
                  ),
                  select: indexselext == 0,
                ),
                paymentmethod(
                  onTap: () {
                    indexselext = 1;
                    setState(() {});
                  },
                  image: const Icon(
                    FontAwesomeIcons.applePay,
                    size: 60,
                    color: Colors.orange,
                  ),
                  select: indexselext == 1,
                ),
                paymentmethod(
                  onTap: () {
                    indexselext = 2;
                    setState(() {});
                  },
                  image: const Text(
                    "+",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w900),
                  ),
                  select: indexselext == 2,
                ),
                const Divider(
                  color: Colors.grey,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              indent: 10,
              endIndent: 10,
            ),
            const ListTile(
              title: Text(
                "Number",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                "1",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text(
                "Total Price",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                "${widget.model.price}\$",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 70,
                width: MediaQuery.sizeOf(context).width * 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffFCC873)),
                child: const Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "     Confirmation ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      Spacer(),
                      Icon(FontAwesomeIcons.arrowRight, color: Colors.black),
                      Icon(FontAwesomeIcons.arrowRight, color: Colors.black54),
                      Icon(FontAwesomeIcons.arrowRight, color: Colors.black45),
                      Icon(FontAwesomeIcons.arrowRight, color: Colors.black26),
                      Icon(FontAwesomeIcons.arrowRight, color: Colors.black12),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class paymentmethod extends StatefulWidget {
  const paymentmethod({
    super.key,
    required this.select,
    this.onTap,
    required this.image,
  });
  final bool select;
  final void Function()? onTap;
  final Widget image;
  @override
  State<paymentmethod> createState() => _paymentmethodState();
}

class _paymentmethodState extends State<paymentmethod> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  border:
                      widget.select ? Border.all(color: Colors.white) : null,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Center(
                  child: widget.image,
                ),
              ),
            ),
            widget.select
                ? CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    child: const Icon(
                      Icons.done,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(
                    height: 30,
                  )
          ],
        ),
      ),
    );
  }
}
