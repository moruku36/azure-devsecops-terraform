# AKS クラスターの作成
# このコードは、名前やノード数などの変数を使って AKS クラスターを作成します。2 変数は、別のファイルで定義するか、コマンドラインで指定することができます。3 詳細な手順や設定については、以下のリンクを参照してください。
resource "azurerm_kubernetes_cluster" "aks" {
  location = azurerm_resource_group.aks.location
  name = var.cluster_name
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix = var.dns_prefix

  default_node_pool {
    name = "agentpool"
    vm_size = "Standard_D2_v2"
    node_count = var.agent_count
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
  }

  service_principal {
    client_id = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }
}