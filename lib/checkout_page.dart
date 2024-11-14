import 'package:flutter/material.dart';
import 'confirmation_page.dart';
class CheckoutPage extends StatelessWidget {
  final TextEditingController _cardHolderController = TextEditingController(text: "Roza");
  final TextEditingController _cardNumberController = TextEditingController(text: "8545 5121 8455 1564");
  final TextEditingController _expiryDateController = TextEditingController(text: "08/23");
  final TextEditingController _cvvController = TextEditingController(text: "000");
  CheckoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal[700],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.credit_card, color: Colors.white, size: 40),
                        Icon(Icons.paypal, color: Colors.white, size: 40),
                        Icon(Icons.account_balance, color: Colors.white, size: 40),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _cardHolderController,
                            decoration: const InputDecoration(
                              labelText: 'Card Holder Name',
                              border: InputBorder.none,
                            ),
                          ),
                          Divider(color: Colors.grey[300]),
                          TextField(
                            controller: _cardNumberController,
                            decoration: const InputDecoration(
                              labelText: 'Card Number',
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          Divider(color: Colors.grey[300]),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _expiryDateController,
                                  decoration: const InputDecoration(
                                    labelText: 'Expiry Date',
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.datetime,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _cvvController,
                                  decoration: const InputDecoration(
                                    labelText: 'CVV',
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ticket Price', style: TextStyle(color: Colors.grey)),
                              Text('\$790', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Fare Tax', style: TextStyle(color: Colors.grey)),
                              Text('\$160', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          Divider(color: Colors.grey[300], thickness: 1),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '\$950',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmationPage()),
                  );
                },
                child: const Text(
                  'Proceed',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

