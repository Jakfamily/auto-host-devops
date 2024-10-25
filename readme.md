# Auto-Host DevOps

Auto-Host DevOps est un projet d'infrastructure automatisée qui combine **OpenTofu (anciennement Terraform)** pour le provisionnement de l'infrastructure et **Ansible** pour la configuration des services. Ce projet vise à automatiser le déploiement et la gestion des environnements de développement, de test et de production pour des applications conteneurisées.

## Structure du Projet

Le projet est structuré en deux parties principales :

1. **Infrastructure** : Provisionnement de l'infrastructure avec **OpenTofu**.
2. **Configuration** : Configuration des services et des applications avec **Ansible**.

```plaintext
/auto-host-devops/
├── terraform/                            # Projet OpenTofu pour l'infrastructure
│   ├── main.tf                           # Fichier principal pour orchestrer les modules
│   ├── variables.tf                      # Variables globales pour le projet
│   ├── outputs.tf                        # Définitions des outputs (ex : IPs)
│   ├── provider.tf                       # Configuration du fournisseur (Proxmox, etc.)
│   └── modules/                          # Dossier contenant les modules
│       ├── vm-pfsense/                   # Module pour la VM pfSense
│       │   ├── main.tf                   # Configuration spécifique pour pfSense
│       │   ├── variables.tf              # Variables pour le module pfSense
│       │   └── outputs.tf                # Outputs spécifiques de la VM pfSense
│       ├── vm-traefik/                   # Module pour la VM Traefik
│       │   ├── main.tf                   # Configuration spécifique pour Traefik
│       │   ├── variables.tf              # Variables pour le module Traefik
│       │   └── outputs.tf                # Outputs spécifiques de la VM Traefik
│       ├── vm-docker-host/               # Module pour la VM Docker Host
│       │   ├── main.tf                   # Configuration spécifique pour Docker Host
│       │   ├── variables.tf              # Variables pour le module Docker Host
│       │   └── outputs.tf                # Outputs spécifiques de la VM Docker Host
│       ├── lxc-db/                       # Module pour le conteneur LXC de base de données
│       │   ├── main.tf                   # Configuration spécifique pour LXC DB
│       │   ├── variables.tf              # Variables pour le module DB
│       │   └── outputs.tf                # Outputs spécifiques de la base de données
│       └── lxc-monitoring/               # Module pour le conteneur LXC de monitoring
│           ├── main.tf                   # Configuration spécifique pour le monitoring
│           ├── variables.tf              # Variables pour le module monitoring
│           └── outputs.tf                # Outputs spécifiques de monitoring
├── ansible/                              # Projet Ansible pour la configuration
│   ├── playbooks/                        # Dossier pour les playbooks
│   │   ├── docker_install.yml            # Playbook pour installer Docker
│   │   ├── pfsense_configure.yml         # Playbook pour configurer pfSense
│   ├── inventories/                      # Inventaire des VMs avec leurs adresses IP
│   │   └── hosts                         # Fichier inventaire Ansible avec les IPs des machines
│   ├── roles/                            # Dossier pour les rôles Ansible
│   │   ├── docker/                       # Rôle pour la configuration de Docker
│   │   ├── grafana/                      # Rôle pour Grafana
│   │   └── wordpress/                    # Rôle pour WordPress
├── ansible.cfg                           # Fichier de configuration Ansible
└── README.md                             # Documentation du projet
```

## Fonctionnalités

### 1. Provisionnement d'Infrastructure avec OpenTofu

Le dossier `terraform/` contient les fichiers de configuration pour provisionner l'infrastructure. Les ressources sont définies dans :

- **main.tf** : Déclaration des ressources de base (VMs, réseaux, VLANs).
- **variables.tf** : Définitions des variables pour personnaliser l'infrastructure.
- **outputs.tf** : Permet de récupérer les informations importantes, comme les adresses IP des VMs, pour les utiliser dans Ansible.
- **provider.tf** : Configuration du fournisseur (ex. : Proxmox).
- **terraform.tfstate** : Fichier d'état pour suivre l'infrastructure actuelle.

### 2. Configuration des Services avec Ansible

Le dossier `ansible/` contient les playbooks et rôles Ansible pour configurer les services sur les machines créées avec OpenTofu.

- **playbooks/** : Contient les playbooks, qui sont les scripts Ansible pour configurer les services.
  - `docker_install.yml` : Installe et configure Docker sur les VMs.
  - `pfsense_configure.yml` : Configure pfSense pour la gestion du pare-feu et des réseaux.
- **inventories/** : Fichier `hosts` qui contient les adresses IP des VMs pour Ansible.
- **roles/** : Contient les rôles Ansible, permettant de réutiliser facilement des configurations.
  - `docker/` : Installation et configuration de Docker.
  - `grafana/` : Installation et configuration de Grafana pour le monitoring.
  - `wordpress/` : Déploiement et configuration de WordPress.

### Configuration d'Ansible

Le fichier `ansible.cfg` contient la configuration générale pour Ansible, comme le chemin vers l'inventaire et les options de connexion.

## Prérequis

- **OpenTofu** : Pour provisionner les ressources. [Documentation OpenTofu](https://terraform.io)
- **Ansible** : Pour configurer et gérer les services. [Documentation Ansible](https://docs.ansible.com/)
- **Proxmox** : Serveur hyperviseur pour héberger les VMs.

## Installation et Démarrage

1. **Initialiser et appliquer OpenTofu** :

   ```bash
   cd terraform/
   tofu init
   tofu apply
   ```

   > Cette commande provisionne les VMs et les réseaux selon la configuration d'OpenTofu.

2. **Configurer les services avec Ansible** :

   ```bash
   cd ../ansible/
   ansible-playbook -i inventories/hosts playbooks/docker_install.yml
   ```

   > Ce playbook installe Docker sur les VMs provisionnées.

## Tags de Commit

Pour garder un historique propre et structuré, utilise les tags de commit suivants :

- **`init:`** : Initialisation du projet.
- **`feat:`** : Ajout d'une nouvelle fonctionnalité.
- **`fix:`** : Correction de bugs.
- **`docs:`** : Mise à jour de la documentation.
- **`chore:`** : Maintenance ou mise à jour mineure.

## Objectifs du Projet

L'objectif de ce projet est de fournir une infrastructure évolutive et configurable pour l'automatisation des environnements DevOps. Avec Auto-Host DevOps, vous pourrez facilement provisionner, configurer et gérer des environnements de manière reproductible.

## Contact

Pour plus d'informations, retrouvez-moi sur [LinkedIn](https://www.linkedin.com/in/faria-jean-baptiste/).

---

Pour toute question ou amélioration, n'hésitez pas à soumettre un ticket ou une pull request.
https://www.linkedin.com/in/faria-jean-baptiste/
