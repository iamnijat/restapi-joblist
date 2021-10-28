// To parse this JSON data, do
//
//     final jobList = jobListFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

JobList jobListFromJson(String str) => JobList.fromJson(json.decode(str));

String jobListToJson(JobList data) => json.encode(data.toJson());

class JobList {
    JobList({
        this.page,
        this.pageCount,
        this.itemsPerPage,
        this.took,
        this.timedOut,
        this.total,
        this.results,
        this.aggregations,
    });

    int page;
    int pageCount;
    int itemsPerPage;
    int took;
    bool timedOut;
    int total;
    List<Result> results;
    Aggregations aggregations;

    factory JobList.fromJson(Map<String, dynamic> json) => JobList(
        page: json["page"],
        pageCount: json["page_count"],
        itemsPerPage: json["items_per_page"],
        took: json["took"],
        timedOut: json["timed_out"],
        total: json["total"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        aggregations: Aggregations.fromJson(json["aggregations"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "page_count": pageCount,
        "items_per_page": itemsPerPage,
        "took": took,
        "timed_out": timedOut,
        "total": total,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "aggregations": aggregations.toJson(),
    };
}

class Aggregations {
    Aggregations();

    factory Aggregations.fromJson(Map<String, dynamic> json) => Aggregations(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Result {
    Result({
        this.contents,
        this.name,
        this.type,
        this.publicationDate,
        this.shortName,
        this.modelType,
        this.id,
        this.locations,
        this.categories,
        this.levels,
        this.tags,
        this.refs,
        this.company,
    });

    String contents;
    String name;
    Type type;
    DateTime publicationDate;
    String shortName;
    ModelType modelType;
    int id;
    List<Category> locations;
    List<Category> categories;
    List<Level> levels;
    List<Level> tags;
    Refs refs;
    Company company;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        contents: json["contents"],
        name: json["name"],
        type: typeValues.map[json["type"]],
        publicationDate: DateTime.parse(json["publication_date"]),
        shortName: json["short_name"],
        modelType: modelTypeValues.map[json["model_type"]],
        id: json["id"],
        locations: List<Category>.from(json["locations"].map((x) => Category.fromJson(x))),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
        tags: List<Level>.from(json["tags"].map((x) => Level.fromJson(x))),
        refs: Refs.fromJson(json["refs"]),
        company: Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "contents": contents,
        "name": name,
        "type": typeValues.reverse[type],
        "publication_date": publicationDate.toIso8601String(),
        "short_name": shortName,
        "model_type": modelTypeValues.reverse[modelType],
        "id": id,
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "levels": List<dynamic>.from(levels.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "refs": refs.toJson(),
        "company": company.toJson(),
    };
}

class Category {
    Category({
        this.name,
    });

    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class Company {
    Company({
        this.id,
        this.shortName,
        this.name,
    });

    int id;
    String shortName;
    String name;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        shortName: json["short_name"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "short_name": shortName,
        "name": name,
    };
}

class Level {
    Level({
        this.name,
        this.shortName,
    });

    Name name;
    ShortName shortName;

    factory Level.fromJson(Map<String, dynamic> json) => Level(
        name: nameValues.map[json["name"]],
        shortName: shortNameValues.map[json["short_name"]],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "short_name": shortNameValues.reverse[shortName],
    };
}

enum Name { SENIOR_LEVEL, MID_LEVEL, FAST_GROWING_COMPANIES, FORTUNE_1000 }

final nameValues = EnumValues({
    "Fast Growing Companies": Name.FAST_GROWING_COMPANIES,
    "Fortune 1000": Name.FORTUNE_1000,
    "Mid Level": Name.MID_LEVEL,
    "Senior Level": Name.SENIOR_LEVEL
});

enum ShortName { SENIOR, MID, FAST_GROWING_COMPANIES, FORTUNE_1000_COMPANIES }

final shortNameValues = EnumValues({
    "fast-growing-companies": ShortName.FAST_GROWING_COMPANIES,
    "fortune-1000-companies": ShortName.FORTUNE_1000_COMPANIES,
    "mid": ShortName.MID,
    "senior": ShortName.SENIOR
});

enum ModelType { JOBS }

final modelTypeValues = EnumValues({
    "jobs": ModelType.JOBS
});

class Refs {
    Refs({
        this.landingPage,
    });

    String landingPage;

    factory Refs.fromJson(Map<String, dynamic> json) => Refs(
        landingPage: json["landing_page"],
    );

    Map<String, dynamic> toJson() => {
        "landing_page": landingPage,
    };
}

enum Type { EXTERNAL }

final typeValues = EnumValues({
    "external": Type.EXTERNAL
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
