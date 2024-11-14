import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkout_bloc.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';
import 'package:flight_booking_design/confirmation_page.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutBloc(),
      child: Scaffold(
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
                child: _buildPaymentForm(context),
              ),
              const SizedBox(height: 16),
              _buildProceedButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentForm(BuildContext context) {
    return Container(
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
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return Column(
                children: [
                  TextField(
                    controller: _cardHolderController,
                    decoration: const InputDecoration(labelText: 'Card Holder Name', border: InputBorder.none),
                    onChanged: (value) => context.read<CheckoutBloc>().add(CardHolderChanged(value)),
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
                    onChanged: (value) => context.read<CheckoutBloc>().add(CardNumberChanged(value)),
                  ),
                  Divider(color: Colors.grey[300]),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _expiryDateController,
                          decoration: const InputDecoration(labelText: 'Expiry Date', border: InputBorder.none),
                          keyboardType: TextInputType.datetime,
                          onChanged: (value) => context.read<CheckoutBloc>().add(ExpiryDateChanged(value)),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _cvvController,
                          decoration: const InputDecoration(labelText: 'CVV', border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          onChanged: (value) => context.read<CheckoutBloc>().add(CVVChanged(value)),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProceedButton(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: state.isSubmitting
                ? null
                : () {
              context.read<CheckoutBloc>().add(SubmitCheckout());
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfirmationPage()));
            },
            child: state.isSubmitting
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Proceed', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        );
      },
    );
  }
}
