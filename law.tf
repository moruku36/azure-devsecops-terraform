# Log Analytics workspace の作成
# このコードは、名前やSKUなどの変数を使って Log Analytics workspace を作成します。2 変数は、別のファイルで定義するか、コマンドラインで指定することができます。3 詳細な手順や設定については、以下のリンクを参照してください。
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  sku                 = var.law_sku
  retention_in_days   = var.law_retention_in_days
}