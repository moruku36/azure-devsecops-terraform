# ACR の作成
# このコードは、名前やSKUなどの変数を使って ACR を作成します。2 変数は、別のファイルで定義するか、コマンドラインで指定することができます。3 詳細な手順や設定については、以下のリンクを参照してください。

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}