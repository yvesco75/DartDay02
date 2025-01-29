
// CAFÉ-O-MATIC - Division Innovation Café

//Mission : Créer la fonction servirCafe(double quantiteCafe) qui gérera notre service de café intelligent.

// Fonction main
void main() {
  // Exemple d'appel de la fonction
  servirCafe(1.795);
}


void servirCafe(double quantiteCafe) {
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
}


