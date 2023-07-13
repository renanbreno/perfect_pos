import 'package:flutter/material.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

Future<dynamic> customerInput(
    BuildContext context, Function(String customerName) setCustomerName) async {
  TextEditingController customerName = TextEditingController();

  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Identificação de cliente",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Wrap(
                    children: [
                      TextFormField(
                        controller: customerName,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              size: 28,
                            ),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: UITheme.coraColorNeutralLighter,
                            labelStyle:
                                TextStyle(color: UITheme.coraColorNeutralDark),
                            labelText: "Informe o nome do cliente"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                foregroundColor: Colors.white,
                                backgroundColor: UITheme.coraColorBrandMedium,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                elevation: 15),
                            child: const Text('Identificar'),
                            onPressed: () {
                              setCustomerName(customerName.text);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
