# Key Vault の作成
# このコードは、名前やSKUなどの変数を使って Key Vault を作成します。2 変数は、別のファイルで定義するか、コマンドラインで指定することができます。3 詳細な手順や設定については、以下のリンクを参照してください。

resource "azurerm_key_vault" "kv" {
  name                = var.kv_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  sku_name            = var.kv_sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create",
      "get",
      "list",
      "delete",
    ]

    secret_permissions = [
      "set",
      "get",
      "list",
      "delete",
    ]
  }
}