import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card")),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: "4596 7896 7896 6789",
            expiryDate: "12/24",
            cardHolderName: "Biswajeet",
            cvvCode: "123",
            showBackView: false,
            // glassmorphismConfig: Glassmorphism.defaultConfig(),
            onCreditCardWidgetChange: (CreditCardBrand) {},
            obscureCardNumber: true,
            obscureInitialCardNumber: false,
            obscureCardCvv: true,
            isChipVisible: true,
            isHolderNameVisible: true,
            isSwipeGestureEnabled: true,
            animationDuration: const Duration(milliseconds: 1000),
            //true when you want to show cvv(back) view
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Block Card")),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Activate Card"))
            ],
          )
        ],
      ),
    );
  }
}
