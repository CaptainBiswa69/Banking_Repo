// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transaction {
  double amount;
  DateTime time;
  String type;
  String sentfrom;
  String reciever;
  String transactionid;
  String status;
  Transaction({
    required this.amount,
    required this.time,
    required this.type,
    required this.sentfrom,
    required this.reciever,
    required this.transactionid,
    required this.status,
  });
}
