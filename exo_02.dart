
// ROBOPOLIS - Division Innovation & Logistiqu

// Mission : Développer la fonction calculerTrajet(int distance) intégrant nos protocoles d'optimisation énergétique.

// Protocole Énergétique Principal :


void main () {
  calculerTrajet(65);
}

void calculerTrajet(int distance) {
  // Déterminer le mode en fonction de la parité de la distance
  String mode = (distance % 2 == 0) ? "Route Rapide" : "Route Éco";

  // Calculer le nombre de recharges nécessaires
  int capaciteBatterie = 10; // km par charge
  int nombreRecharges = (distance / capaciteBatterie).ceil(); // Arrondi supérieur

  print("Configuration du trajet :");
  print("- Distance : $distance km");
  print("- Mode activé : $mode");
  print("- Nombre de recharges nécessaires : $nombreRecharges");
}
