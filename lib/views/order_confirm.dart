import 'package:flutter/material.dart';
import 'package:laza_commerce/views/layout_screen.dart';

class OrderConfirmView extends StatelessWidget {
  const OrderConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffFCFCFC),

      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset('assets/images/order_confirm.png'),
          const SizedBox(
            height: 30,
          ),
          const Text(
              'Order Confirmed',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Your order has been confirmed, we will send you confirmation email shortly.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xff8F959E)
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 106,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 335,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Go to Orders',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8F959E)
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));
            },
            child: Container(
              width: double.infinity,
              height: 75,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xff9775FA),
              ),
              child: const Text(
                'Continue Shopping',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFEFEFE)
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
