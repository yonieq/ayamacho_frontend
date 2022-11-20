import 'package:collection/collection.dart';

import 'data.dart';
import 'meta.dart';

class ResponseOrderModel {
	Meta? meta;
	Data? data;

	ResponseOrderModel({this.meta, this.data});

	factory ResponseOrderModel.fromJson(Map<String, dynamic> json) {
		return ResponseOrderModel(
			meta: json['meta'] == null
						? null
						: Meta.fromJson(json['meta'] as Map<String, dynamic>),
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'meta': meta?.toJson(),
				'data': data?.toJson(),
			};

	ResponseOrderModel copyWith({
		Meta? meta,
		Data? data,
	}) {
		return ResponseOrderModel(
			meta: meta ?? this.meta,
			data: data ?? this.data,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! ResponseOrderModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => meta.hashCode ^ data.hashCode;
}
