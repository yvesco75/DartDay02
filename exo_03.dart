// CAFÉ-O-MATIC - Division Innovation Café

// Mission : Créer la fonction servirCafe(double quantiteCafe) qui gérera notre service de café intelligent.

// Fonction main
void main() {
  // Exemple d'appel de la fonction
  servirCafe(1.795);
}

// Protocole de Service et de Sécurité
void servirCafe(double quantiteCafe) {
  // ✅ Protocole de Sécurité : Vérifier les limites (minimum 0.1 tasse, maximum 10 tasses)
  if (quantiteCafe < 0.1 || quantiteCafe > 10) {
    print("⚠️ Erreur : La quantité doit être comprise entre 0.1 et 10 tasses.");
    return;
  }

  // Étape 1 : Arrondir à la tasse standard la plus proche
  int tassesArrondies = quantiteCafe.round();

  // Étape 2 : Convertir en millilitres
  int quantiteEnMl = tassesArrondies * 250;

  // Étape 3 : Isoler parties entière et décimale
  int partieEntiere = quantiteCafe.floor();
  double partieDecimale = quantiteCafe - partieEntiere;

  // Affichage des détails
  print('Service :');
  print('- Tasses arrondies : $tassesArrondies');
  print('- Quantité en millilitres : $quantiteEnMl ml');
  print('- Partie entière : $partieEntiere tasse(s)');
  print('- Partie décimale : ${partieDecimale.toStringAsFixed(2)}');

  // Étape 4 : Afficher le niveau avec 2 décimales
  print('${quantiteCafe.toStringAsFixed(2)} tasses restantes');

  // ✅ Protocole de Sécurité : Générer un message personnalisé selon la quantité
  print(genererMessage(quantiteCafe));
}

// ✅ Fonction pour générer un message personnalisé selon la quantité
String genererMessage(double quantite) {
  if (quantite < 1) {
    return "☕ Une petite tasse pour bien commencer.";
  } else if (quantite <= 5) {
    return "☕☕ Profitez de votre café !";
  } else {
    return "🔥 Préparez-vous pour un café intense !";
  }
}

// ✅ Fonction pour comparer deux commandes avec une tolérance de 0.05 tasse
bool comparerCommandes(double commande1, double commande2) {
  return (commande1 - commande2).abs() <= 0.05;
}
