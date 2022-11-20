import 'package:collection/collection.dart';

class Meta {
	int? code;
	String? status;
	String? message;

	Meta({this.code, this.status, this.message});

	factory Meta.fromJson(Map<String, dynamic> json) => Meta(
				code: json['code'] as int?,
				status: json['status'] as String?,
				message: json['message'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'code': code,
				'status': status,
				'message': message,
			};

	Meta copyWith({
		int? code,
		String? status,
		String? message,
	}) {
		return Meta(
			code: code ?? this.code,
			status: status ?? this.status,
			message: message ?? this.message,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Meta) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => code.hashCode ^ status.hashCode ^ message.hashCode;
}
