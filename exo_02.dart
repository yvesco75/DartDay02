// Fonction principale pour calculer le trajet
void main() {
  // Définir la distance souhaitée
  int distance = 75; // Vous pouvez modifier cette distance

  // Appeler le protocole énergétique principal
  protocoleEnergetiquePrincipal(distance);
  
  // Appeler le protocole de gestion d'énergie
  protocoleGestionEnergie(distance);
}

// Protocole Énergétique Principal : Identifier le type de route et calculer les recharges nécessaires
void protocoleEnergetiquePrincipal(int distance) {
  // Identification du type de route
  String mode = (distance % 2 == 0) ? "Route Rapide" : "Route Éco";
  
  // Calcul des points de recharge nécessaires
  const int capaciteBatterie = 10; // km par charge
  int nombreRecharges = (distance / capaciteBatterie).ceil(); // Arrondi au supérieur

  // Afficher les résultats du Protocole Énergétique Principal
  print("\nConfiguration du trajet pour $distance km :");
  print("- Mode activé : $mode");
  print("- Nombre de recharges nécessaires : $nombreRecharges");
}

// Protocole de Gestion d'Énergie : Estimer la consommation et appliquer le boost longue distance
void protocoleGestionEnergie(int distance) {
  // Estimation de la consommation énergétique (distance²)
  int consommation = distance * distance;

  // Application du Boost Longue Distance
  if (distance > 50) {
    consommation = (consommation * 1.2).ceil(); // Ajout de 20% si distance > 50 km
  }

  // Afficher les résultats du Protocole de Gestion d'Énergie
  print("- Consommation énergétique estimée : $consommation unités");
}
