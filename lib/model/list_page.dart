// To parse this JSON data, do
//
//     final lotteryList = lotteryListFromJson(jsonString);

// import 'dart:convert';

// LotteryList lotteryListFromJson(String str) => LotteryList.fromJson(json.decode(str));

// String lotteryListToJson(LotteryList data) => json.encode(data.toJson());

class LotteryList {
    LotteryList({
        this.status,
        this.response,
    });

    String status;
    List<Responset> response;

    factory LotteryList.fromJson(Map<String, dynamic> json) => LotteryList(
        status: json["status"],
        response: List<Responset>.from(json["response"].map((x) => Responset.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Responset {
    Responset({
        this.id,
        this.url,
        this.date,
    });

    String id;
    String url;
    String date;

    factory Responset.fromJson(Map<String, dynamic> json) => Responset(
        id: json["id"],
        url: json["url"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "date": date,
    };
}