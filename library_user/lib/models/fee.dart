class FeeModel {
  FeeModel({
    required this.starting,
    required this.ending,
    required this.fee,
  });

  String starting;
  String ending;
  int fee;

  factory FeeModel.fromMap(Map<String, dynamic> json) => FeeModel(
        starting: json["starting"],
        ending: json["ending"],
        fee: json["fee"],
      );

  Map<String, dynamic> toMap() => {
        "starting": starting,
        "ending": ending,
        "fee": fee,
      };
}
