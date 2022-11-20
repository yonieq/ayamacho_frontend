import 'package:collection/collection.dart';

class Product {
	int? id;
	String? name;
	int? price;
	String? description;
	String? tags;
	int? categoriesId;
	dynamic deletedAt;
	DateTime? createdAt;
	DateTime? updatedAt;

	Product({
		this.id, 
		this.name, 
		this.price, 
		this.description, 
		this.tags, 
		this.categoriesId, 
		this.deletedAt, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Product.fromJson(Map<String, dynamic> json) => Product(
				id: json['id'] as int?,
				name: json['name'] as String?,
				price: json['price'] as int?,
				description: json['description'] as String?,
				tags: json['tags'] as String?,
				categoriesId: json['categories_id'] as int?,
				deletedAt: json['deleted_at'] as dynamic,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'price': price,
				'description': description,
				'tags': tags,
				'categories_id': categoriesId,
				'deleted_at': deletedAt,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	Product copyWith({
		int? id,
		String? name,
		int? price,
		String? description,
		String? tags,
		int? categoriesId,
		dynamic deletedAt,
		DateTime? createdAt,
		DateTime? updatedAt,
	}) {
		return Product(
			id: id ?? this.id,
			name: name ?? this.name,
			price: price ?? this.price,
			description: description ?? this.description,
			tags: tags ?? this.tags,
			categoriesId: categoriesId ?? this.categoriesId,
			deletedAt: deletedAt ?? this.deletedAt,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Product) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			id.hashCode ^
			name.hashCode ^
			price.hashCode ^
			description.hashCode ^
			tags.hashCode ^
			categoriesId.hashCode ^
			deletedAt.hashCode ^
			createdAt.hashCode ^
			updatedAt.hashCode;
}
