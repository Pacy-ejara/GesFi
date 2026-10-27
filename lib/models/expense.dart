// 1. Les sources de revenus pour tout ce que je percois comme argent
enum IncomeSource { salaire, don, autre }

// 2. Le type de gestion (Libre ou Dedie)
enum ManagementType { libre, dediee }

// 3. Les grandes catégories du montant à gestion libre
enum FreeManagementCategory { dieu, epargne, hommes, besoinsPersonnels, egare }

// 4. Les sous-catégories de gestion du montant à gestion libre détaillé
enum GodCategory { 
  dimes, offrandesECSD, offrandesFMN, offrandesFMI, 
  offrandesUMPJ, offrandeCUniv, offrandeHallN, 
  offrandesTA, offrandesMF, offrandesFE 
}

enum SavingsCategory { ejara, longTerme, autres }

enum PersonalCategory { 
  transport, nourriture, internet, vetement, 
  fraisRetrait, hygienne, others 
}

// Modèle pour un revenu reçu (avec sa source, son donateur et son type de gestion)
class Income {
  Income({
    required this.amount,
    required this.source,
    required this.date,
    required this.managementType, // Libre ou Dédié
    this.donorName, // Ex: "Liliane", "Diane", "Maman"
    this.dedicatedPurpose, // Ex: "Acheter une robe" si c'est dédié
  });

  final double amount;
  final IncomeSource source;
  final DateTime date;
  final ManagementType managementType;
  final String? donorName;
  final String? dedicatedPurpose;
}

// Modèle pour dépense provenant du montant à gestion libre
class ExpenseItem {
  ExpenseItem({
    required this.title,
    required this.amount,
    required this.date,
    required this.mainCategory,
    this.subCategoryLabel,
  });

  final String title;
  final double amount;
  final DateTime date;
  final FreeManagementCategory mainCategory;
  final String? subCategoryLabel; // Ex: "Maman", "Prisca", "Transport", etc.
}
