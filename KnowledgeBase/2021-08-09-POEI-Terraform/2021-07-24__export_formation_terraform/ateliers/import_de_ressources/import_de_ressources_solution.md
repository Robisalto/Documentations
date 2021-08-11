# Import de ressources

## Utilisation de la commande import

* Déployer vos ressources
    ```
    terraform apply
    ```
* Lister les ressources gérées par le state
    ```
    terraform state list
    ```
* Afficher le détail de l'une d'entre elle pour récupérer son identifiant
    ```
    terraform state show azurerm_storage_container.terraform_backend
    ```
* Supprimer la ressource du state
    ```
    terraform state rm azurerm_storage_container.terraform_backend
    ```
* Faire un terraform plan pour vérifier que terraform va essayer de créer la ressource
    ```
    terraform plan
    ```
* Réaliser un import de cette ressource via terraform import
    ```
    terraform import azurerm_storage_container.terraform_backend "https://ach54123719d1335b15.blob.core.windows.net/tf-backend"
    ```
* Refaire un plan pour valider que la ressource est de nouveau rattachée au state
    ```
    terraform plan
    ```


## TerraCognita

* [Installer TerraCognita](https://github.com/cycloidio/terracognita#installation)
* Créer un nouveau répertoire en dehors du projet en cours
    ```
    mkdir ../import_data && cd ../import_data
    ```
* Lister les ressources gérées par TerraCognita
    ```
    terracognita-linux-amd64 azurerm resources
    ```
* Utiliser TerraCognita pour créer la recette concernant les ressources gérées qui sont rattachées à votre trigramme ainsi que le state correspondant
    ```
    terracognita-linux-amd64 azurerm --client-id="${AZURE_CLIENT_ID}" --client-secret="${AZURE_SECRET}" --subscription-id="${AZURE_SUBSCRIPTION_ID}" --tenant-id="${AZURE_TENANT}" --resource-group-name=ach-formation-default --tfstate ./terraform.tfstate --hcl ./terraform.tf
    ```
* Visualiser le résultat
    ```
    bat terraform.tf
    ```
* Tester avec un terraform plan
    ```
    terraform plan
    ```
