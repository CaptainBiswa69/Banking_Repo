import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transactionscreen extends StatefulWidget {
  const Transactionscreen({super.key});

  @override
  State<Transactionscreen> createState() => _TransactionscreenState();
}

class _TransactionscreenState extends State<Transactionscreen> {
  List<int> amount = [1500, 3900, 2300, 4588, 9546, 345, 678];
  List<String> months = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transcations")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  height: 300,
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.red, width: 1.5),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.greenAccent,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                            gradient: LinearGradient(
                                colors: [Colors.green, Colors.green])),
                        child: Column(
                          children: [
                            const Text(
                              "Total Balance",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Rs 5191",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                incomeCard("14024"),
                                expenseCard("8833")
                              ],
                            )
                          ],
                        ),
                      ))),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return incomeTile(amount[index], "UPI",
                        DateTime.now().subtract(Duration(days: index)), index);
                  } else {
                    return expenseTile(
                        amount[index],
                        "UPI",
                        DateTime.now().subtract(Duration(days: 30 + index)),
                        index);
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget expenseCard(String value) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.white70),
          padding: const EdgeInsets.all(12.0),
          child: const Icon(
            CupertinoIcons.arrow_up,
            color: Colors.red,
            size: 24,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Expense",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ],
    );
  }

  Widget incomeTile(int value, String note, DateTime date, int index) {
    return InkWell(
      onLongPress: () async {
        // bool? answer = await showConfirmDialog(
        //     context, "Warning", "Do you want to delete this record?");
        // if (answer != null && answer) {
        //   helper.deleteData(index);
        //   setState(() {});
        // }
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.red, width: 1.5),
        ),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          decoration: const BoxDecoration(color: Colors.white60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const Icon(
                  CupertinoIcons.arrow_down_circle,
                  color: Colors.green,
                  size: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Income",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${date.day} ${months[date.month - 1]} ${date.year}",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]),
              Row(
                children: [
                  Column(
                    children: [
                      Text("+ $value",
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        note,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget expenseTile(int value, String note, DateTime date, int index) {
    return InkWell(
      onLongPress: () async {
        // bool? answer = await showConfirmDialog(
        //     context, "Warning", "Do you want to delete this record?");
        // if (answer != null && answer) {
        //   helper.deleteData(index);
        //   setState(() {});
        // }
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.red, width: 1.5),
        ),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          decoration: BoxDecoration(color: Colors.white60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const Icon(
                  CupertinoIcons.arrow_up_circle,
                  color: Colors.red,
                  size: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Expense",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${date.day} ${months[date.month - 1]} ${date.year}",
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]),
              Row(
                children: [
                  Column(
                    children: [
                      Text("- $value",
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(note, style: const TextStyle(fontSize: 15)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget incomeCard(String value) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.white70),
          padding: const EdgeInsets.all(12.0),
          child: const Icon(
            CupertinoIcons.arrow_down,
            color: Colors.green,
            size: 24,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Income",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ],
    );
  }
}
