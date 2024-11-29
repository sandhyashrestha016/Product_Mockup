// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? title;
  String? message;
  ProductData? data;

  ProductModel({
    this.title,
    this.message,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        title: json["title"],
        message: json["message"],
        data: json["data"] == null ? null : ProductData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "message": message,
        "data": data?.toJson(),
      };
}

class ProductData {
  String? id;
  String? slug;
  Category? category;
  Brand? brand;
  String? title;
  String? ingredient;
  String? howToUse;
  String? description;
  int? price;
  int? rewardPoint;
  int? commissionPercentage;
  int? strikePrice;
  int? offPercent;
  int? minOrder;
  int? maxOrder;
  bool? status;
  List<String>? images;
  List<Color>? colorAttributes;
  List<dynamic>? sizeAttributes;
  String? variantType;
  List<ColorVariant>? colorVariants;
  int? ratings;
  int? totalRatings;
  int? ratedBy;
  FilterOptions? filterOptions;
  String? metaRobots;
  bool? isTodaysDeal;
  bool? isFeatured;
  bool? isPublished;
  String? searchWords;
  bool? isDeleted;
  List<dynamic>? sizeVariants;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? noneText;
  List<BreadCrum>? breadCrums;
  bool? wished;

  ProductData({
    this.id,
    this.slug,
    this.category,
    this.brand,
    this.title,
    this.ingredient,
    this.howToUse,
    this.description,
    this.price,
    this.rewardPoint,
    this.commissionPercentage,
    this.strikePrice,
    this.offPercent,
    this.minOrder,
    this.maxOrder,
    this.status,
    this.images,
    this.colorAttributes,
    this.sizeAttributes,
    this.variantType,
    this.colorVariants,
    this.ratings,
    this.totalRatings,
    this.ratedBy,
    this.filterOptions,
    this.metaRobots,
    this.isTodaysDeal,
    this.isFeatured,
    this.isPublished,
    this.searchWords,
    this.isDeleted,
    this.sizeVariants,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.noneText,
    this.breadCrums,
    this.wished,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["_id"],
        slug: json["slug"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        title: json["title"],
        ingredient: json["ingredient"],
        howToUse: json["howToUse"],
        description: json["description"],
        price: json["price"],
        rewardPoint: json["rewardPoint"],
        commissionPercentage: json["commissionPercentage"],
        strikePrice: json["strikePrice"],
        offPercent: json["offPercent"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        status: json["status"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        colorAttributes: json["colorAttributes"] == null
            ? []
            : List<Color>.from(
                json["colorAttributes"]!.map((x) => Color.fromJson(x))),
        sizeAttributes: json["sizeAttributes"] == null
            ? []
            : List<dynamic>.from(json["sizeAttributes"]!.map((x) => x)),
        variantType: json["variantType"],
        colorVariants: json["colorVariants"] == null
            ? []
            : List<ColorVariant>.from(
                json["colorVariants"]!.map((x) => ColorVariant.fromJson(x))),
        ratings: json["ratings"],
        totalRatings: json["totalRatings"],
        ratedBy: json["ratedBy"],
        filterOptions: json["filterOptions"] == null
            ? null
            : FilterOptions.fromJson(json["filterOptions"]),
        metaRobots: json["metaRobots"],
        isTodaysDeal: json["isTodaysDeal"],
        isFeatured: json["isFeatured"],
        isPublished: json["isPublished"],
        searchWords: json["searchWords"],
        isDeleted: json["isDeleted"],
        sizeVariants: json["sizeVariants"] == null
            ? []
            : List<dynamic>.from(json["sizeVariants"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        noneText: json["noneText"],
        breadCrums: json["breadCrums"] == null
            ? []
            : List<BreadCrum>.from(
                json["breadCrums"]!.map((x) => BreadCrum.fromJson(x))),
        wished: json["wished"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "slug": slug,
        "category": category?.toJson(),
        "brand": brand?.toJson(),
        "title": title,
        "ingredient": ingredient,
        "howToUse": howToUse,
        "description": description,
        "price": price,
        "rewardPoint": rewardPoint,
        "commissionPercentage": commissionPercentage,
        "strikePrice": strikePrice,
        "offPercent": offPercent,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "status": status,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "colorAttributes": colorAttributes == null
            ? []
            : List<dynamic>.from(colorAttributes!.map((x) => x.toJson())),
        "sizeAttributes": sizeAttributes == null
            ? []
            : List<dynamic>.from(sizeAttributes!.map((x) => x)),
        "variantType": variantType,
        "colorVariants": colorVariants == null
            ? []
            : List<dynamic>.from(colorVariants!.map((x) => x.toJson())),
        "ratings": ratings,
        "totalRatings": totalRatings,
        "ratedBy": ratedBy,
        "filterOptions": filterOptions?.toJson(),
        "metaRobots": metaRobots,
        "isTodaysDeal": isTodaysDeal,
        "isFeatured": isFeatured,
        "isPublished": isPublished,
        "searchWords": searchWords,
        "isDeleted": isDeleted,
        "sizeVariants": sizeVariants == null
            ? []
            : List<dynamic>.from(sizeVariants!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "noneText": noneText,
        "breadCrums": breadCrums == null
            ? []
            : List<dynamic>.from(breadCrums!.map((x) => x.toJson())),
        "wished": wished,
      };
}

class Brand {
  String? id;
  String? slug;
  String? name;

  Brand({
    this.id,
    this.slug,
    this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["_id"],
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "slug": slug,
        "name": name,
      };
}

class BreadCrum {
  String? title;
  String? slug;

  BreadCrum({
    this.title,
    this.slug,
  });

  factory BreadCrum.fromJson(Map<String, dynamic> json) => BreadCrum(
        title: json["title"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
      };
}

class Category {
  String? id;
  String? slug;
  String? title;
  int? level;
  String? parentId;

  Category({
    this.id,
    this.slug,
    this.title,
    this.level,
    this.parentId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        slug: json["slug"],
        title: json["title"],
        level: json["level"],
        parentId: json["parentId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "slug": slug,
        "title": title,
        "level": level,
        "parentId": parentId,
      };
}

class Color {
  String? id;
  bool? isTwin;
  String? name;
  List<String>? colorValue;

  Color({
    this.id,
    this.isTwin,
    this.name,
    this.colorValue,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["_id"],
        isTwin: json["isTwin"],
        name: json["name"],
        colorValue: json["colorValue"] == null
            ? []
            : List<String>.from(json["colorValue"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "isTwin": isTwin,
        "name": name,
        "colorValue": colorValue == null
            ? []
            : List<dynamic>.from(colorValue!.map((x) => x)),
      };
}

class ColorVariant {
  Color? color;
  int? price;
  int? rewardPoint;
  int? strikePrice;
  int? offPercent;
  int? minOrder;
  int? maxOrder;
  bool? status;
  List<dynamic>? images;
  String? productCode;
  String? id;

  ColorVariant({
    this.color,
    this.price,
    this.rewardPoint,
    this.strikePrice,
    this.offPercent,
    this.minOrder,
    this.maxOrder,
    this.status,
    this.images,
    this.productCode,
    this.id,
  });

  factory ColorVariant.fromJson(Map<String, dynamic> json) => ColorVariant(
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
        price: json["price"],
        rewardPoint: json["rewardPoint"],
        strikePrice: json["strikePrice"],
        offPercent: json["offPercent"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        status: json["status"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        productCode: json["productCode"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "color": color?.toJson(),
        "price": price,
        "rewardPoint": rewardPoint,
        "strikePrice": strikePrice,
        "offPercent": offPercent,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "status": status,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "productCode": productCode,
        "_id": id,
      };
}

class FilterOptions {
  bool? age12;
  bool? age20;
  bool? age30;
  bool? age40;
  bool? age50;
  bool? benefitsAntiAgeing;
  bool? benefitsAntiShine;
  bool? benefitsBrightning;
  bool? benefitsBronzing;
  bool? benefitsCooling;
  bool? benefitsConcealing;
  bool? benefitsConditioning;
  bool? benefitsCurling;
  bool? benefitsDefining;
  bool? benefitsEnergising;
  bool? benefitsEvenSkinTone;
  bool? benefitsExfoliating;
  bool? benefitsFilling;
  bool? benefitsGrowthBoosting;
  bool? benefitsHydrating;
  bool? benefitsLengthening;
  bool? benefitsLongLasting;
  bool? benefitsMattifing;
  bool? benefitsMoisturing;
  bool? benefitsNourishing;
  bool? benefitsProtecting;
  bool? benefitsQuickDry;
  bool? benefitsRevitalising;
  bool? benefitsSculpting;
  bool? benefitsSmoothing;
  bool? benefitsThickening;
  bool? benefitsTransferProof;
  bool? benefitsVolumising;
  bool? benefitsWaterproof;
  bool? colorRed;
  String? colorRedHex;
  bool? colorBlue;
  String? colorBlueHex;
  bool? colorPink;
  String? colorPinkHex;
  bool? colorBlack;
  String? colorBlackHex;
  bool? colorBrown;
  String? colorBrownHex;
  bool? colorGrey;
  String? colorGreyHex;
  bool? colorGreen;
  String? colorGreenHex;
  bool? colorBurgundy;
  String? colorBurgundyHex;
  bool? colorPurple;
  String? colorPurpleHex;
  bool? coverageHigh;
  bool? coverageLight;
  bool? coverageMedium;
  bool? finishCreamy;
  bool? finishGlossy;
  bool? finishLuminious;
  bool? finishMalte;
  bool? finishMetaallic;
  bool? finishNatural;
  bool? finishSatin;
  bool? finishSheer;
  bool? finishShimmer;
  bool? finishShine;
  bool? formulationGel;
  bool? formulationLiquid;
  bool? formulationPencil;
  bool? formulationPowder;
  bool? formulationStick;
  bool? formulationWax;
  bool? formulationCream;
  bool? formulationLipBalm;
  bool? formulationLoose;
  bool? formulationPearls;
  bool? formulationPressed;
  bool? formulationSerum;
  bool? skinTypeCombination;
  bool? skinTypeDry;
  bool? skinTypeNormal;
  bool? skinTypeOily;
  bool? skinTypeSensitive;

  FilterOptions({
    this.age12,
    this.age20,
    this.age30,
    this.age40,
    this.age50,
    this.benefitsAntiAgeing,
    this.benefitsAntiShine,
    this.benefitsBrightning,
    this.benefitsBronzing,
    this.benefitsCooling,
    this.benefitsConcealing,
    this.benefitsConditioning,
    this.benefitsCurling,
    this.benefitsDefining,
    this.benefitsEnergising,
    this.benefitsEvenSkinTone,
    this.benefitsExfoliating,
    this.benefitsFilling,
    this.benefitsGrowthBoosting,
    this.benefitsHydrating,
    this.benefitsLengthening,
    this.benefitsLongLasting,
    this.benefitsMattifing,
    this.benefitsMoisturing,
    this.benefitsNourishing,
    this.benefitsProtecting,
    this.benefitsQuickDry,
    this.benefitsRevitalising,
    this.benefitsSculpting,
    this.benefitsSmoothing,
    this.benefitsThickening,
    this.benefitsTransferProof,
    this.benefitsVolumising,
    this.benefitsWaterproof,
    this.colorRed,
    this.colorRedHex,
    this.colorBlue,
    this.colorBlueHex,
    this.colorPink,
    this.colorPinkHex,
    this.colorBlack,
    this.colorBlackHex,
    this.colorBrown,
    this.colorBrownHex,
    this.colorGrey,
    this.colorGreyHex,
    this.colorGreen,
    this.colorGreenHex,
    this.colorBurgundy,
    this.colorBurgundyHex,
    this.colorPurple,
    this.colorPurpleHex,
    this.coverageHigh,
    this.coverageLight,
    this.coverageMedium,
    this.finishCreamy,
    this.finishGlossy,
    this.finishLuminious,
    this.finishMalte,
    this.finishMetaallic,
    this.finishNatural,
    this.finishSatin,
    this.finishSheer,
    this.finishShimmer,
    this.finishShine,
    this.formulationGel,
    this.formulationLiquid,
    this.formulationPencil,
    this.formulationPowder,
    this.formulationStick,
    this.formulationWax,
    this.formulationCream,
    this.formulationLipBalm,
    this.formulationLoose,
    this.formulationPearls,
    this.formulationPressed,
    this.formulationSerum,
    this.skinTypeCombination,
    this.skinTypeDry,
    this.skinTypeNormal,
    this.skinTypeOily,
    this.skinTypeSensitive,
  });

  factory FilterOptions.fromJson(Map<String, dynamic> json) => FilterOptions(
        age12: json["age_12"],
        age20: json["age_20"],
        age30: json["age_30"],
        age40: json["age_40"],
        age50: json["age_50"],
        benefitsAntiAgeing: json["benefits_anti_ageing"],
        benefitsAntiShine: json["benefits_anti_shine"],
        benefitsBrightning: json["benefits_brightning"],
        benefitsBronzing: json["benefits_bronzing"],
        benefitsCooling: json["benefits_cooling"],
        benefitsConcealing: json["benefits_concealing"],
        benefitsConditioning: json["benefits_conditioning"],
        benefitsCurling: json["benefits_curling"],
        benefitsDefining: json["benefits_defining"],
        benefitsEnergising: json["benefits_energising"],
        benefitsEvenSkinTone: json["benefits_even_skin_tone"],
        benefitsExfoliating: json["benefits_exfoliating"],
        benefitsFilling: json["benefits_filling"],
        benefitsGrowthBoosting: json["benefits_growth_boosting"],
        benefitsHydrating: json["benefits_hydrating"],
        benefitsLengthening: json["benefits_lengthening"],
        benefitsLongLasting: json["benefits_long_lasting"],
        benefitsMattifing: json["benefits_mattifing"],
        benefitsMoisturing: json["benefits_moisturing"],
        benefitsNourishing: json["benefits_nourishing"],
        benefitsProtecting: json["benefits_protecting"],
        benefitsQuickDry: json["benefits_quick_dry"],
        benefitsRevitalising: json["benefits_revitalising"],
        benefitsSculpting: json["benefits_sculpting"],
        benefitsSmoothing: json["benefits_smoothing"],
        benefitsThickening: json["benefits_thickening"],
        benefitsTransferProof: json["benefits_transfer_proof"],
        benefitsVolumising: json["benefits_volumising"],
        benefitsWaterproof: json["benefits_waterproof"],
        colorRed: json["color_red"],
        colorRedHex: json["color_red_hex"],
        colorBlue: json["color_blue"],
        colorBlueHex: json["color_blue_hex"],
        colorPink: json["color_pink"],
        colorPinkHex: json["color_pink_hex"],
        colorBlack: json["color_black"],
        colorBlackHex: json["color_black_hex"],
        colorBrown: json["color_brown"],
        colorBrownHex: json["color_brown_hex"],
        colorGrey: json["color_grey"],
        colorGreyHex: json["color_grey_hex"],
        colorGreen: json["color_green"],
        colorGreenHex: json["color_green_hex"],
        colorBurgundy: json["color_burgundy"],
        colorBurgundyHex: json["color_burgundy_hex"],
        colorPurple: json["color_purple"],
        colorPurpleHex: json["color_purple_hex"],
        coverageHigh: json["coverage_high"],
        coverageLight: json["coverage_light"],
        coverageMedium: json["coverage_medium"],
        finishCreamy: json["finish_creamy"],
        finishGlossy: json["finish_glossy"],
        finishLuminious: json["finish_luminious"],
        finishMalte: json["finish_malte"],
        finishMetaallic: json["finish_metaallic"],
        finishNatural: json["finish_natural"],
        finishSatin: json["finish_satin"],
        finishSheer: json["finish_sheer"],
        finishShimmer: json["finish_shimmer"],
        finishShine: json["finish_shine"],
        formulationGel: json["formulation_gel"],
        formulationLiquid: json["formulation_liquid"],
        formulationPencil: json["formulation_pencil"],
        formulationPowder: json["formulation_powder"],
        formulationStick: json["formulation_stick"],
        formulationWax: json["formulation_wax"],
        formulationCream: json["formulation_cream"],
        formulationLipBalm: json["formulation_lip_balm"],
        formulationLoose: json["formulation_loose"],
        formulationPearls: json["formulation_pearls"],
        formulationPressed: json["formulation_pressed"],
        formulationSerum: json["formulation_serum"],
        skinTypeCombination: json["skin_type_combination"],
        skinTypeDry: json["skin_type_dry"],
        skinTypeNormal: json["skin_type_normal"],
        skinTypeOily: json["skin_type_oily"],
        skinTypeSensitive: json["skin_type_sensitive"],
      );

  Map<String, dynamic> toJson() => {
        "age_12": age12,
        "age_20": age20,
        "age_30": age30,
        "age_40": age40,
        "age_50": age50,
        "benefits_anti_ageing": benefitsAntiAgeing,
        "benefits_anti_shine": benefitsAntiShine,
        "benefits_brightning": benefitsBrightning,
        "benefits_bronzing": benefitsBronzing,
        "benefits_cooling": benefitsCooling,
        "benefits_concealing": benefitsConcealing,
        "benefits_conditioning": benefitsConditioning,
        "benefits_curling": benefitsCurling,
        "benefits_defining": benefitsDefining,
        "benefits_energising": benefitsEnergising,
        "benefits_even_skin_tone": benefitsEvenSkinTone,
        "benefits_exfoliating": benefitsExfoliating,
        "benefits_filling": benefitsFilling,
        "benefits_growth_boosting": benefitsGrowthBoosting,
        "benefits_hydrating": benefitsHydrating,
        "benefits_lengthening": benefitsLengthening,
        "benefits_long_lasting": benefitsLongLasting,
        "benefits_mattifing": benefitsMattifing,
        "benefits_moisturing": benefitsMoisturing,
        "benefits_nourishing": benefitsNourishing,
        "benefits_protecting": benefitsProtecting,
        "benefits_quick_dry": benefitsQuickDry,
        "benefits_revitalising": benefitsRevitalising,
        "benefits_sculpting": benefitsSculpting,
        "benefits_smoothing": benefitsSmoothing,
        "benefits_thickening": benefitsThickening,
        "benefits_transfer_proof": benefitsTransferProof,
        "benefits_volumising": benefitsVolumising,
        "benefits_waterproof": benefitsWaterproof,
        "color_red": colorRed,
        "color_red_hex": colorRedHex,
        "color_blue": colorBlue,
        "color_blue_hex": colorBlueHex,
        "color_pink": colorPink,
        "color_pink_hex": colorPinkHex,
        "color_black": colorBlack,
        "color_black_hex": colorBlackHex,
        "color_brown": colorBrown,
        "color_brown_hex": colorBrownHex,
        "color_grey": colorGrey,
        "color_grey_hex": colorGreyHex,
        "color_green": colorGreen,
        "color_green_hex": colorGreenHex,
        "color_burgundy": colorBurgundy,
        "color_burgundy_hex": colorBurgundyHex,
        "color_purple": colorPurple,
        "color_purple_hex": colorPurpleHex,
        "coverage_high": coverageHigh,
        "coverage_light": coverageLight,
        "coverage_medium": coverageMedium,
        "finish_creamy": finishCreamy,
        "finish_glossy": finishGlossy,
        "finish_luminious": finishLuminious,
        "finish_malte": finishMalte,
        "finish_metaallic": finishMetaallic,
        "finish_natural": finishNatural,
        "finish_satin": finishSatin,
        "finish_sheer": finishSheer,
        "finish_shimmer": finishShimmer,
        "finish_shine": finishShine,
        "formulation_gel": formulationGel,
        "formulation_liquid": formulationLiquid,
        "formulation_pencil": formulationPencil,
        "formulation_powder": formulationPowder,
        "formulation_stick": formulationStick,
        "formulation_wax": formulationWax,
        "formulation_cream": formulationCream,
        "formulation_lip_balm": formulationLipBalm,
        "formulation_loose": formulationLoose,
        "formulation_pearls": formulationPearls,
        "formulation_pressed": formulationPressed,
        "formulation_serum": formulationSerum,
        "skin_type_combination": skinTypeCombination,
        "skin_type_dry": skinTypeDry,
        "skin_type_normal": skinTypeNormal,
        "skin_type_oily": skinTypeOily,
        "skin_type_sensitive": skinTypeSensitive,
      };
}
