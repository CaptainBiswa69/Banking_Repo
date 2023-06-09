import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  int? amount;
  String note = "Given";
  String type = "Expense";
  DateTime selectedDate = DateTime.now();
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  Future<void> _selectedDate(BuildContext context) async {
    var showDatePicker2 = showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2019, 1),
      lastDate: DateTime(2100, 12),
    );
    final DateTime? picked = await showDatePicker2;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Add Transctions",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xffe2e7ef),
      body: ListView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 25.0),
        children: [
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: const EdgeInsets.all(12.0),
                child: const Icon(
                  CupertinoIcons.money_dollar_circle,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(hintText: "Amount"),
                  style: const TextStyle(fontSize: 20),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    try {
                      amount = int.parse(value);
                    } catch (e) {}
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: const EdgeInsets.all(12.0),
                child: const Icon(
                  Icons.description_rounded,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(hintText: "Take a note"),
                  style: const TextStyle(fontSize: 20),
                  maxLength: 30,
                  onChanged: (value) {
                    note = value;
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: const EdgeInsets.all(12.0),
                child: const Icon(
                  CupertinoIcons.money_rubl_circle,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ChoiceChip(
                label: Text(
                  "Deposit",
                  style: TextStyle(
                      fontSize: 18,
                      color: type == "Income" ? Colors.white : Colors.black),
                ),
                selected: type == "Income" ? true : false,
                selectedColor: Colors.red,
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      type = "Income";
                    });
                  }
                },
              ),
              const SizedBox(
                width: 20,
              ),
              ChoiceChip(
                label: Text(
                  "Send",
                  style: TextStyle(
                      fontSize: 18,
                      color: type == "Expense" ? Colors.white : Colors.black),
                ),
                selected: type == "Expense" ? true : false,
                selectedColor: Colors.red,
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      type = "Expense";
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: const EdgeInsets.all(12.0),
                child: const Icon(
                  CupertinoIcons.calendar_today,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  _selectedDate(context);
                },
                child: Text(
                    "${selectedDate.day} ${months[selectedDate.month - 1]} ${selectedDate.year}",
                    style: const TextStyle(fontSize: 20)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                // if (amount != null && note.isNotEmpty) {
                //   DbHelper helper = DbHelper();
                //   await helper.addData(amount!, selectedDate, note, type);
                // }
                // Navigator.of(context).pop();
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
